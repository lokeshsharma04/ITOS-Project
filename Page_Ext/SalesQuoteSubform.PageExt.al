pageextension 52174 "AME Sales Quote Subform" extends "Sales Quote Subform"
{
    layout
    {
        addafter(Description)
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Gen. Prod. Posting Group")
        {
            field("AME Prod. Posting Type"; Rec."AME Prod. Posting Type")
            {
                ApplicationArea = all;
            }
        }
        moveafter("No."; "Gen. Prod. Posting Group")
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
            trigger OnAfterValidate()
            var
                AMEUtility: Codeunit "AME Utility";
            begin
                AllowUnitPriceChange := AMEUtility.IsUnitPriceChangeAllowedForLine(Rec);
            end;
        }
        modify("Unit Price")
        {
            Editable = AllowUnitPriceChange;
        }
        modify("Line Amount")
        {
            Editable = AllowUnitPriceChange;
        }
    }
    actions
    {
        modify(SelectMultiItems)
        {
            Visible = false;
        }
        addafter(SelectMultiItems)
        {
            action(SelectMultiItems_2)
            {
                AccessByPermission = TableData Item = R;
                ApplicationArea = Basic, Suite;
                Caption = 'Select items';
                Ellipsis = true;
                Image = NewItem;
                ToolTip = 'Add two or more items from the full list of your inventory items.';

                trigger OnAction()
                begin
                    Rec.AMESelectMultipleItems();
                end;
            }
        }
    }
    var
        AllowUnitPriceChange: Boolean;

    trigger OnAfterGetCurrRecord()
    var
        AMEUtility: Codeunit "AME Utility";
    begin
        AllowUnitPriceChange := AMEUtility.IsUnitPriceChangeAllowedForLine(Rec);
    end;
}
