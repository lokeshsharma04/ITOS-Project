pageextension 52139 "AME Purchase Order Subfom" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = all;


            }
        }
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Item Charge Qty. to Handle")
        {
            Visible = false;
        }
        modify("Direct Unit Cost")
        {
            Editable = AllowDierctUnitCostChange;
        }
        addafter("Line Amount")
        {
            field("AME Remarks"; Rec."AME Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Remarks field.';
                Visible = false;
            }
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
