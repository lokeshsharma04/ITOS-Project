tableextension 52133 "AME Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(52101; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
            trigger OnValidate()
            var
                RecSalesLine: Record "Sales Line";
            begin
                Rec.TestField(Status, Status::Open);
                Rec.Validate("Expected Receipt Date", Rec."AME Price Date");
                UpdatePurchLinesByFieldNo(FieldNo("AME Price Date"), CurrFieldNo <> 0);
            end;
        }
        field(52102; "AME Purch. Order Type"; Enum "AME Purch. Order Type")
        {
            Caption = 'Purch. Order Type';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                PurchLine: Record "Purchase Line";
            begin
                Rec.TestField(Status, Status::Open);
                PurchLine.Reset();
                PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                PurchLine.SetRange("Document No.", Rec."No.");
                if PurchLine.FindSet() then
                    Error(TEXT0001, FieldCaption("AME Purch. Order Type"));


            end;

        }

        modify("Order Date")
        {
            trigger OnAfterValidate()
            begin
                if Confirm('Do you want to update Price Date to Order Date', false) then
                    IF Rec."Order Date" <> 0D then
                        Rec.Validate("AME Price Date", Rec."Order Date");
            end;
        }
        modify("Order Address Code")
        {
            trigger OnBeforeValidate()
            begin
                Rec.TestField(Status, Rec.Status::Open);
            end;

            trigger OnAfterValidate()
            var
                ShipmentMethod: Record "Shipment Method";
                OrderAddress: Record "Order Address";
            begin
                if OrderAddress.Get(Rec."Buy-from Vendor No.", Rec."Order Address Code") then begin
                    if ShipmentMethod.Get(OrderAddress."AME Shipment Method Code") then
                        Rec.Validate("Shipment Method Code", ShipmentMethod.Code);
                end;
            end;
        }
        field(52103; "AME Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(52104; "AME Workflow Category"; Code[20])
        {
            Caption = 'Workflow Category';
            TableRelation = "Workflow Category".Code where("AME Allow Selct. for App. Flow" = const(true));
            DataClassification = ToBeClassified;
        }
        field(52110; "AME Documents Attached"; Integer)
        {
            Caption = 'Documents Attached';
            FieldClass = FlowField;
            CalcFormula = count("Document Attachment" where("Table ID" = const(38), "No." = field("No."), "Document Type" = field("Document Type")));
        }
    }

    procedure RefreshPurchasePrices(PurchaseHeader: Record "Purchase Header")
    var
        PurcPaySetup: Record "Purchases & Payables Setup";
        PurchaseLine: Record "Purchase Line";
        PurchaseLine2: Record "Purchase Line";
    begin
        PurchaseHeader.TestField(Status, PurchaseHeader.Status::Open);
        PurcPaySetup.Get();
        PurchaseLine.Reset();
        PurchaseLine.SetCurrentKey("Document Type", "Document No.");
        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                if PurchaseLine2.GEt(PurchaseLine."Document Type", PurchaseLine."Document No.", PurchaseLine."Line No.") then begin
                    PurchaseLine2.UpdateDirectUnitCost(PurchaseLine2.FieldNo(Quantity));
                    PurchaseLine2.Modify(true);
                end;
            until PurchaseLine.Next() = 0;
    end;

    procedure ValidateBeforeRelease()
    var
        myInt: Integer;
        PurchLine: Record "Purchase Line";
    begin
        Rec.TestField("Shortcut Dimension 1 Code");
        rec.TestField("Order Address Code");
        if Rec."AME Purch. Order Type" = rec."AME Purch. Order Type"::Trading then
            Rec.TestField("Shipment Method Code");
        //Rec.TestField("Shortcut Dimension 2 Code");

        PurchLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."No.");
        PurchLine.SetFilter("No.", '<>%1', '');
        if PurchLine.FindFirst() then
            repeat
                PurchLine.TestField("Shortcut Dimension 1 Code");
                PurchLine.TestField("Shortcut Dimension 2 Code");
            until PurchLine.Next() = 0;

    end;


    var
        TEXT0001: Label '%1 cannot be changed.One or more purchase line exists!';
        ReqToApprove: page "Requests to Approve";

}
