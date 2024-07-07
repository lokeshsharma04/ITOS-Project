tableextension 52112 "AME Whse.Receipt Header" extends "Warehouse Receipt Header"
{
    fields
    {
        field(52100; "BL_No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'BL No.';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52101; "Supp_Invoice_No"; Code[20])
        {

            DataClassification = CustomerContent;
            Caption = 'Supplier Invoice No.';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52102; "Supp_Invoice_Date"; Date)
        {

            DataClassification = CustomerContent;
            Caption = 'Supplier Invoice Date';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52103; "Expected_Receipt_Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expected Receipt Date';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52104; "Shipment Status"; Enum "Whse. Receipt Ship Status")
        {
            Caption = 'Shipment Status';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52105; "BOE No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'BOE No.';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52106; "BOE Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'BOE Date';
            trigger OnValidate()
            begin
                Rec.TestField("Shipment Status", Rec."Shipment Status"::Open);
            end;
        }
        field(52107; "AME Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if LandedCostsheetEntriesExists() then
                    Error('One or more costsheet entries exists!\%1 cannot be changed.', Rec.FieldCaption("AME Transport Method"));
            end;
        }
    }

    procedure GetInvoiceAmount(): Decimal
    var
        WarehouseRecptLine: Record "Warehouse Receipt Line";
        TotalInvoiceAmt: Decimal;
    begin
        TotalInvoiceAmt := 0;
        WarehouseRecptLine.SetCurrentKey("No.", "Line No.");
        WarehouseRecptLine.SetRange("No.", Rec."No.");
        WarehouseRecptLine.SetRange("Source Document", WarehouseRecptLine."Source Document"::"Purchase Order");
        if WarehouseRecptLine.FindFirst() then begin
            WarehouseRecptLine.CalcSums("Line Amount");
            TotalInvoiceAmt := WarehouseRecptLine."Line Amount";
        end;
        exit(TotalInvoiceAmt);
    end;

    procedure CheckIfLinesExist(WhseRcptHdrNo: code[20])
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
        LineExistErr: Label 'Document does not contain a quantity or amount.';
    begin
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", WhseRcptHdrNo);
        if Not WhseRcptLine.FindFirst() then
            Error(LineExistErr);
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", WhseRcptHdrNo);
        WhseRcptLine.Setrange("Qty. to Receive", 0);
        if WhseRcptLine.FindFirst() then
            WhseRcptLine.TestField("Qty. to Receive");
    end;

    local procedure ValidateHeaderForGITConfirmed(WhseRcptHeader: Record "Warehouse Receipt Header")
    begin
        WhseRcptHeader.TestField(BL_No);
        WhseRcptHeader.TestField(Supp_Invoice_No);
        WhseRcptHeader.TestField(Supp_Invoice_Date);
        WhseRcptHeader.TestField(Expected_Receipt_Date);
    end;

    local procedure ValidateHeaderForGRNConfirmed(WhseRcptHeader: Record "Warehouse Receipt Header")
    begin
        // WhseRcptHeader.TestField(BL_No);
        // WhseRcptHeader.TestField(Supp_Invoice_No);
        // WhseRcptHeader.TestField(Supp_Invoice_Date);
        // WhseRcptHeader.TestField(Expected_Receipt_Date);
        ValidateHeaderForGITConfirmed(WhseRcptHeader);
        WhseRcptHeader.TestField("BOE No.");
        WhseRcptHeader.TestField("BOE Date");
    end;

    procedure IsLandedCostApplicable(): Boolean
    var
        WhseRcptHeader: Record "Warehouse Receipt Header";
        WhseRcptLine: Record "Warehouse Receipt Line";
        PurchHeader: Record "Purchase Header";
        LandedCostSetup: Record "AME Landed Cost";
    begin
        PurchHeader := Rec.GetFirstPOFromWarehouseReceipt();

        LandedCostSetup.Reset();
        LandedCostSetup.SetRange(AME_Vendor_No, PurchHeader."Buy-from Vendor No.");
        LandedCostSetup.SetRange(AME_Shipment_Method, PurchHeader."Shipment Method Code");
        LandedCostSetup.SetRange(AME_Transport_Type, Rec."AME Transport Method");
        exit(LandedCostSetup.FindFirst());
    end;

    procedure IsLandedCostApplied(): Boolean
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
    begin
        WhseRcptLine.Reset();
        WhseRcptLine.SetCurrentKey("No.", "Source Document");
        WhseRcptLine.SetRange("No.", Rec."No.");
        WhseRcptLine.SetRange("Source Document", WhseRcptLine."Source Document"::"Purchase Order");
        WhseRcptLine.SetRange("Landed Cost %", 0);
        if WhseRcptLine.FindFirst() then
            exit(false);

        WhseRcptLine.SetRange("Landed Cost %");
        WhseRcptLine.SetRange("Landed Cost Amt.", 0);
        if WhseRcptLine.FindFirst() then
            exit(false);

        exit(true);
    end;

    procedure CheckIfActualQtyUpdated()
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
    begin
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", Rec."No.");
        WhseRcptLine.SetRange("Actual Qty", 0);
        if WhseRcptLine.FindFirst() then
            WhseRcptLine.TestField("Actual Qty");
    end;

    procedure CheckIfPOLinesExist(): Boolean
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
    begin
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", Rec."No.");
        WhseRcptLine.SetRange("Source Document", WhseRcptLine."Source Document"::"Purchase Order");
        exit(WhseRcptLine.FindFirst());
    end;

    procedure SetGITConfirmed()
    begin
        ValidateHeaderForGITConfirmed(Rec);
        CheckIfLinesExist(Rec."No.");
        Rec.Validate("Shipment Status", Rec."Shipment Status"::"GIT Confirmed");
        Rec.Modify();
    end;

    procedure SetGRNConfirmed()
    begin
        ValidateHeaderForGRNConfirmed(Rec);
        CheckIfLinesExist(Rec."No.");
        CheckIfActualQtyUpdated();
        Rec.TestField("Shipment Status", Rec."Shipment Status"::"GIT Confirmed");
        Rec.Validate("Shipment Status", Rec."Shipment Status"::"GRN Confirmed");
        Rec.Modify();
    end;

    procedure SetLandedCostCompleted()
    var
        DocumentErr: Label 'Document does not contain a purchase order line';
    begin
        if not CheckIfPOLinesExist() then
            Error(DocumentErr);
        if not IsLandedCostApplicable() then
            Error(LandedCostSetupErr);

        if not IsLandedCostApplied() then
            Error(LandedCostNotAppliedErr, Rec.TableCaption(), "No.");
        Rec.TestField("Shipment Status", Rec."Shipment Status"::"GRN Confirmed");
        Rec.Validate("Shipment Status", Rec."Shipment Status"::"Landed Cost Completed");
        Rec.Modify();
    end;

    procedure LandedCostsheetEntriesExists(): Boolean
    var
        CostsheetEntries: Record "AME Cost_Worksheet";
    begin
        CostsheetEntries.SetCurrentKey(AME_Document_Type, AME_Document_No, AME_Charge_Code);
        CostsheetEntries.SetRange(AME_Document_Type, CostsheetEntries.AME_Document_Type::"Warehouse Receipt");
        CostsheetEntries.SetRange(AME_Document_No, Rec."No.");
        exit(CostsheetEntries.FindFirst());
    end;


    procedure GetFirstPOFromWarehouseReceipt(): Record "Purchase Header"
    var
        WarehouseRecptLine: Record "Warehouse Receipt Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        WarehouseRecptLine.SetCurrentKey("No.", "Line No.");
        WarehouseRecptLine.SetRange("No.", Rec."No.");
        WarehouseRecptLine.SetRange("Source Document", WarehouseRecptLine."Source Document"::"Purchase Order");
        if not WarehouseRecptLine.FindFirst() then
            Error('No purchase order found in warehouse receipt!');

        PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, WarehouseRecptLine."Source No.");
        exit(PurchaseHeader);
    end;

    var
        LandedCostSetupErr: Label 'Landed cost setup does not exists for the Vendor No.: %1 VendorName :%2';
        LandedCostNotAppliedErr: Label 'Landed cost is not applied for one or more line in %1:%2';

}
