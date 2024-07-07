pageextension 52163 "AME Purchase Inv Subform" extends "Purch. Invoice Subform"
{
    layout
    {
        modify("Direct Unit Cost")
        {
            Editable = AllowDierctUnitCostChange;
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
        AllowDierctUnitCostChange: Boolean;

    trigger OnOpenPage()
    var
        AMEUtility: Codeunit "AME Utility";
    begin
        AllowDierctUnitCostChange := AMEUtility.IsDirectUnitCostChangeAllowedForLine(Rec);
    end;

}

