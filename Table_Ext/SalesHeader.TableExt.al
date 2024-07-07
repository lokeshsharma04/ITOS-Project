tableextension 52105 "AME Sales Header" extends "Sales Header"
{

    fields
    {
        field(52100; "AME SO Status"; Option)
        {
            OptionMembers = Open,"On-Hold",Confirmed,Canceled;
            OptionCaption = 'Open,On-Hold,Confirmed,Cancelled';
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'SO Status';
            trigger OnValidate()
            var
                RecSalesLine: Record "Sales Line";
                WhseShipLine: Record "Warehouse Shipment Line";
                WarehouseShipErr: Label '%1 exists Document No.:%2 , Line No.:%3';
            begin
                if (Rec."AME SO Status" in [Rec."AME SO Status"::"On-Hold", rec."AME SO Status"::Canceled]) then begin
                    RecSalesLine.Reset();
                    RecSalesLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
                    RecSalesLine.SetRange("Document Type", RecSalesLine."Document Type"::Order);
                    RecSalesLine.SetRange("Document No.", Rec."No.");
                    RecSalesLine.SetFilter("Quantity Shipped", '<>%1', 0);
                    if RecSalesLine.FindFirst() then
                        Error(Text52100, FieldCaption("AME SO Status"), Format(REc."AME SO Status"), RecSalesLine.FieldCaption("Quantity Shipped"), RecSalesLine."No.", RecSalesLine."Line No.", RecSalesLine."Quantity Shipped");
                    //Error('SO Status Can not be changed to On-Hold.Quantity Shipped available for : Item No. :%1,Line No. :%2,Quantity Shipped :%3', RecSalesLine."No.", RecSalesLine."Line No.", RecSalesLine."Quantity Shipped");

                    RecSalesLine.SetRange("Quantity Shipped");
                    RecSalesLine.SetFilter("Quantity Invoiced", '<>%1', 0);
                    if RecSalesLine.FindFirst() then
                        Error(Text52100, FieldCaption("AME SO Status"), Format(REc."AME SO Status"), RecSalesLine.FieldCaption("Quantity Invoiced"), RecSalesLine."No.", RecSalesLine."Line No.", RecSalesLine."Quantity Invoiced");
                    //05022024
                    if Rec."AME SO Status" = Rec."AME SO Status"::Canceled then begin
                        WhseShipLine.Reset();
                        WhseShipLine.SetRange("Source Type", 37);
                        WhseShipLine.SetRange("Source Subtype", 1);
                        WhseShipLine.SetRange("Source Document", WhseShipLine."Source Document"::"Sales Order");
                        WhseShipLine.SetRange("Source No.", Rec."No.");
                        if WhseShipLine.FindFirst() then
                            Error(WarehouseShipErr, WhseShipLine.TableCaption, WhseShipLine."No.", WhseShipLine."Line No.");
                    end;
                    //Error('SO Status Can not be changed to On-Hold.Quantity Invoiced available for : Item No. :%1,Line No. :%2,Quantity Invoiced :%3', RecSalesLine."No.", RecSalesLine."Line No.", RecSalesLine."Quantity Invoiced");
                end;
            end;
        }
        field(52101; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
            trigger OnValidate()
            var
                RecSalesLine: Record "Sales Line";
            begin
                Rec.TestField(Status, Status::Open);
                if Rec."AME Price Date" <> 0D then
                    Rec.Validate("Shipment Date", Rec."AME Price Date");
                UpdateSalesLinesByFieldNo(FieldNo("AME Price Date"), CurrFieldNo <> 0);
            end;
        }

        field(52102; "AME Commercial Invoice No."; Code[20])
        {
            Caption = 'Commercial Invoice No.';
            DataClassification = CustomerContent;
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
        field(52103; "AME Bill of Exit Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Bill of Exit Date';
        }
        field(52104; "AME Bill of Exit No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bill of Exit No.';
        }
        field(52105; "AME Chamber Charges"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Chamber Charges';
        }
        field(52120; "AME Remarks"; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }

        field(52130; "AME Purch. Currency Code"; Code[10])
        {
            Caption = 'Purchase Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency.Code;
        }


    }
    trigger OnBeforeDelete()
    begin
        if Rec."Document Type" = rec."Document Type"::"Blanket Order" then
            TestBlanketOrderDelete();
    end;

    local procedure TestBlanketOrderDelete()
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
        SalesLine: record "Sales Line";
    begin

        if SalesRecSetup.Get() then;
        if SalesRecSetup.AME_DeleteInvdBlnktSalesOrders then
            exit;

        SalesLine.SetCurrentKey("Document Type", "Document No.");
        SalesLine.SetRange("Document Type", rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindFirst() then
            repeat
                SalesLine.TestField("Quantity Invoiced", 0);
                SalesLine.TestField("Quantity Shipped", 0);
            until SalesLine.Next() = 0;
    end;


    procedure RefreshSalesPrices(SalesHeader: Record "Sales Header")
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";
        SalesLine2: Record "Sales Line";
    begin
        SalesHeader.TestField(Status, SalesHeader.Status::Open);
        SalesRecSetup.Get();

        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document Type", "Document No.");
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                if SalesLine2.GEt(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
                    SalesLine2.UpdateUnitPrice(SalesLine.FieldNo(Quantity));
                    SalesLine2.Modify(true);
                end;

            until SalesLine.Next() = 0;
    end;

    procedure ValidateBeforeRelease()
    var
        myInt: Integer;
        SalesLine: Record "Sales Line";
    begin
        Rec.TestField("Shortcut Dimension 1 Code");
        //rec.TestField("Shortcut Dimension 2 Code");
        if Rec."Document Type" = rec."Document Type"::Order then
            rec.TestField("AME SO Status", "AME SO Status"::Confirmed);

        SalesLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindFirst() then
            repeat
                SalesLine.TestField("Shortcut Dimension 1 Code");
                SalesLine.TestField("Shortcut Dimension 2 Code");
            until SalesLine.Next() = 0;
    end;

    procedure GetDivisionName(): Text;
    var
        DimensionValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
    begin
        Rec.TestField("Shortcut Dimension 1 Code");
        if GLSetup.Get() then
            if DimensionValue.Get(GLSetup."Global Dimension 1 Code", Rec."Shortcut Dimension 1 Code") then
                exit(DimensionValue.Name);

        exit('');
    end;

    var
        Text52100: Label '%1 cannot be changed to %2. %3 available for : Item No. :%4, Line No. :%5, %3 :%6';

}
