tableextension 52115 "AME Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(52101; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
            trigger OnValidate()
            var
                PurchLine: Record "Purchase Line";
            begin
                if PurchLine.get(Rec."Document Type", Rec."Document No.", Rec."Line No.") then begin
                    PurchLine.UpdateDirectUnitCost(FieldNo(Quantity));
                    PurchLine.Modify(true);
                end;
            end;
        }
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                QtyBase: Decimal;
            begin
                if REc.Type = Rec.Type::Item then begin
                    if item.Type = Item.Type::Inventory then begin
                        Item.Get(Rec."No.");

                        if Quantity = 0 then
                            exit;

                        ItemUOM.Get(Item."No.", "Unit of Measure Code");
                        QtyBase := Quantity * ItemUOM."Qty. per Unit of Measure";

                        item.ValidateCartonQty(QtyBase);

                        IF Rec."Document Type" = Rec."Document Type"::order then
                            if item.Type = item.Type::Inventory then
                                item.ValidateBOQQty(QtyBase);

                        if Item."Minimum Order Quantity" <> 0 then
                            IF QtyBase < Item."Minimum Order Quantity" then begin
                                Message('Quantity should be equal to or more than the MOQ Qty.: %1', Item."Minimum Order Quantity");
                            end;
                    end;
                end;

            end;

        }
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
            begin
                if REc.Type = Rec.Type::Item then begin

                    if Item.Get(Rec."No.") then
                        if item.Type = Item.Type::Inventory then begin
                            item.ValidateItemForTrans();
                        end;
                end;
            end;
        }
        field(52102; "AME Remarks"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Remarks';
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

    procedure AMESelectMultipleItems()
    var
        ItemListPage: Page "Item List";
        SelectionFilter: Text;
    begin
        if IsCreditDocType() then
            SelectionFilter := AMESelectActiveItems()
        else
            SelectionFilter := AMESelectActiveItemsForPurchase();
        if SelectionFilter <> '' then
            AMEAddItems(SelectionFilter);
    end;

    procedure AMESelectActiveItems(): Text
    var
        Item: Record Item;
    begin
        exit(AMESelectInItemList(Item));
    end;

    procedure AMESelectActiveItemsForPurchase(): Text
    var
        Item: Record Item;
    begin
        Item.SetRange("Purchasing Blocked", false);
        exit(AMESelectInItemList(Item));
    end;

    procedure AMESelectInItemList(var Item: Record Item): Text
    var
        ItemListPage: Page "Item List";
        PurchaseHdr: Record "Purchase Header";
        GLSetup: Record "General Ledger Setup";
    begin
        if GLSetup.Get() then;
        PurchaseHdr.GEt(Rec."Document Type", rec."Document No.");
        Item.SetFilter("ATOS Allowed Division", '%1', strsubstno('@*%1*', PurchaseHdr."Shortcut Dimension 1 Code"));
        item.SetFilter("ATOS Dim1. Code Filter", GLSetup."Global Dimension 1 Code");
        Item.SetRange(Blocked, false);
        ItemListPage.SetTableView(Item);
        ItemListPage.LookupMode(true);
        if ItemListPage.RunModal() = ACTION::LookupOK then
            exit(ItemListPage.GetSelectionFilter());
    end;

    procedure AMEAddItems(SelectionFilter: Text)
    var
        Item: Record Item;
        PurchLine: Record "Purchase Line";
        IsHandled: Boolean;
    begin
        InitNewLine(PurchLine);
        Item.SetFilter("No.", SelectionFilter);
        if Item.FindSet() then
            repeat
                AddItem(PurchLine, Item."No.");
            until Item.Next() = 0;
    end;

    var
        Item: Record item;
        ItemUOM: Record "Item Unit of Measure";
        OpenQty: Decimal;
}
