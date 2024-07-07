tableextension 52148 "AME Assembly Line " extends "Assembly Line"
{
    fields
    {
        modify("Quantity per")
        {
            trigger OnBeforeValidate()
            var
                QtyBase: Decimal;
            begin
                if REc.Type = Rec.Type::Item then begin
                    if item.Type = Item.Type::Inventory then begin
                        Item.Get(Rec."No.");
                        item.TestField("AME Carton UOM");

                        ItemUOM.Get(Item."No.", "Unit of Measure Code");
                        QtyBase := Quantity * ItemUOM."Qty. per Unit of Measure";

                        if ItemUOM.Get(Item."No.", Item."AME Carton UOM") then begin
                            OpenQty := QtyBase MOD ItemUOM."Qty. per Unit of Measure";
                            if OpenQty <> 0 then
                                // Message('Entered Qty should be a complete carton qty.');
                                // Message('Entered quanity should be in multiple of (Carton UOM.Qty Per unit of mesure)');
                                Message('Entered quanity should be in multiple of %1 ', ItemUOM."Qty. per Unit of Measure");

                        end;
                    end;
                end;
            end;
        }
        modify(Type)
        {
            trigger OnAfterValidate()
            begin
                if (Rec.Type = Rec.Type::Resource) then
                    Rec.Validate("Resource Usage Type", Rec."Resource Usage Type"::Fixed);
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                if (Rec.Type = Rec.Type::Resource) and (Rec."No." <> '') then
                    Rec.Validate("Resource Usage Type", Rec."Resource Usage Type"::Fixed);
            end;
        }
        field(52101; "AME Qty. Picked"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Qty. to Pick';

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Qty. Picked" >= "AME Qty. Picked" then
                    Validate("Qty. Picked", "Qty. Picked" - "AME Qty. Picked")
            end;
        }
    }
    var

        Item: Record item;
        ItemUOM: Record "Item Unit of Measure";
        OpenQty: Decimal;

}

