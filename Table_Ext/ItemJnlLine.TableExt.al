tableextension 52146 "AME Item Jnl Line" extends "Item Journal Line"
{
    fields
    {
        field(52100; "AME Prod. Posting Type"; Enum "Ame Prod. Posting Type")
        {
            Caption = 'Prod. Posting Type';
            DataClassification = CustomerContent;
        }

        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("Item No.") then
                    ItemRec.ValidateItemForTrans();
            end;
        }
    }
}
