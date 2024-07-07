tableextension 52106 "AME Sales Line" extends "Sales Line"
{
    fields
    {
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                QtyBase: Decimal;
            begin
                if REc.Type = Rec.Type::Item then begin
                    if item.Type = Item.Type::Inventory then begin
                        Item.Get(Rec."No.");
                        item.TestField("AME Carton UOM");
                        item.ValidateItemForTrans();

                        ItemUOM.Get(Item."No.", "Unit of Measure Code");
                        QtyBase := Quantity * ItemUOM."Qty. per Unit of Measure";

                        item.ValidateCartonQty(QtyBase);
                    end;
                end;
            end;

        }

        modify("No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                GenProPosGroup: Record "Gen. Product Posting Group";
            begin
                if GenProPosGroup.Get(Rec."Gen. Prod. Posting Group") then
                    Validate("AME Prod. Posting Type", GenProPosGroup."AME Prod. Posting Type");
            end;

        }

        field(52101; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
            trigger OnValidate()
            begin
                UpdateUnitPrice(Rec.FieldNo(Quantity));
                // Rec.Modify(true)
            end;
        }
        field(52102; "AME Prod. Posting Type"; Enum "Ame Prod. Posting Type")
        {
            Caption = 'Prod. Posting Type';
            DataClassification = CustomerContent;
        }
        field(52103; "AME Commercial Inv. No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."AME Commercial Invoice No." where("Document Type" = field("Document Type"), "No." = field("Document No.")));
        }
        modify("Gen. Prod. Posting Group")
        {
            trigger OnAfterValidate()
            var
                GenProPosGroup: Record "Gen. Product Posting Group";
            begin
                if GenProPosGroup.Get(Rec."Gen. Prod. Posting Group") then
                    Validate("AME Prod. Posting Type", GenProPosGroup."AME Prod. Posting Type");
            end;
        }
        field(52104; "AME Charge Document No."; Code[20])
        {
            Caption = 'Charge Document No.';
            DataClassification = CustomerContent;
        }
        field(52125; "AME Item Category 1"; Code[30])
        {
            Caption = 'Areen Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 1" where("No." = field("No.")));
        }
        field(52126; "AME Item Category 2"; Code[30])
        {
            Caption = 'Areen Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 2" where("No." = field("No.")));
        }
        field(52127; "AME Item Category 3"; Code[30])
        {
            Caption = 'Areen Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 3" where("No." = field("No.")));
        }
        field(52128; "AME Item Category 4"; Code[30])
        {
            Caption = 'Areen Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 4" where("No." = field("No.")));
        }
        field(52129; "AME Item Category 5"; Code[30])
        {
            Caption = 'Pigeon Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 5" where("No." = field("No.")));
        }
        field(52130; "AME Item Category 6"; Code[30])
        {
            Caption = 'Pigeon Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 6" where("No." = field("No.")));
        }
        field(52131; "AME Item Category 7"; Code[30])
        {
            Caption = 'Pigeon Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 7" where("No." = field("No.")));
        }
        field(52132; "AME Item Category 8"; Code[30])
        {
            Caption = 'Pigeon Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 8" where("No." = field("No.")));
        }
        field(52133; "AME Item Category 9"; Code[30])
        {
            Caption = 'Pigeon Sub Category 4';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 9" where("No." = field("No.")));
        }
        field(52134; "AME Item Category 10"; Code[30])
        {
            Caption = 'Pigeon Sub Category 5';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 10" where("No." = field("No.")));
        }
        field(52135; "AME Item Category 11"; Code[30])
        {
            Caption = 'Marketing Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 11" where("No." = field("No.")));
        }
        field(52136; "AME Item Category 12"; Code[30])
        {
            Caption = 'Marketing Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 12" where("No." = field("No.")));
        }
        field(52137; "AME Item Category 13"; Code[30])
        {
            Caption = 'Marketing Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 13" where("No." = field("No.")));
        }
    }
    trigger OnBeforeDelete()
    var
        myInt: Integer;
    begin
        if REc."Document Type" = rec."Document Type"::"Blanket Order" then
            TestBlanketOrderDelete();
    end;

    local procedure TestBlanketOrderDelete()
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
    begin
        if SalesRecSetup.Get() then;

        if SalesRecSetup.AME_DeleteInvdBlnktSalesOrders then
            exit;

        Rec.TestField("Quantity Invoiced", 0);
        Rec.TestField("Quantity Shipped", 0);
    end;
    //06022024>>
    procedure AMESelectMultipleItems()
    var
        ItemListPage: Page "Item List";
        SelectionFilter: Text;
    begin
        if IsCreditDocType() then
            SelectionFilter := AMESelectActiveItems()
        else
            SelectionFilter := AMESelectActiveItemsForSale();
        if SelectionFilter <> '' then
            AMEAddItems(SelectionFilter);
    end;

    procedure CalculateValuesForQty(Qty: Decimal; var GrossAmt: Decimal; var DiscAmt: Decimal; var LineAmt: Decimal; Var VATAmt: Decimal; var NetAmt: Decimal)
    var
        myInt: Integer;
        SalesLine: Record "Sales Line";
    begin
        if SalesLine.GEt(REc."Document Type", rec."Document No.", rec."Line No.") then;
        GrossAmt := Qty * SalesLine."Unit Price";
        DiscAmt := GrossAmt * SalesLine."Line Discount %" / 100;
        LineAmt := Round(GrossAmt - DiscAmt, 0.01);
        VATAmt := Round(LineAmt * SalesLine."VAT %" / 100, 0.01);
        NetAmt := LineAmt + VATAmt;
    end;

    procedure AMESelectActiveItemsForSale(): Text
    var
        Item: Record Item;
    begin
        Item.SetRange("Sales Blocked", false);
        Exit(AMESelectInItemList(Item));
    end;

    procedure AMESelectActiveItems(): Text
    var
        Item: Record Item;
    begin
        Exit(AMESelectInItemList(Item));
    end;

    procedure AMESelectInItemList(var Item: Record Item): Text
    var
        ItemListPage: Page "Item List";
        SalesHdr: Record "Sales Header";
        GLSetup: Record "General Ledger Setup";
    begin
        if GLSetup.Get() then;
        SalesHdr.GEt(Rec."Document Type", rec."Document No.");
        Item.SetFilter("ATOS Allowed Division", '%1', strsubstno('@*%1*', SalesHdr."Shortcut Dimension 1 Code"));
        item.SetFilter("ATOS Dim1. Code Filter", GLSetup."Global Dimension 1 Code");
        Item.SetRange(Blocked, false);
        ItemListPage.SetTableView(Item);
        ItemListPage.LookupMode(true);
        if ItemListPage.RunModal() = ACTION::LookupOK then
            exit(ItemListPage.GetSelectionFilter());
    end;

    local procedure AMEAddItems(SelectionFilter: Text)
    var
        Item: Record Item;
        SalesLine: Record "Sales Line";
    begin
        InitNewLine(SalesLine);
        Item.SetFilter("No.", SelectionFilter);
        if Item.FindSet() then
            repeat
                AddItem(SalesLine, Item."No.");
            until Item.Next() = 0;
    end;
    //06022024<<

    var
        Item: Record item;
        ItemUOM: Record "Item Unit of Measure";
        OpenQty: Decimal;
}
