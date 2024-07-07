pageextension 52189 "AME Purchase Quotes" extends "Purchase Quotes"
{
    layout
    {
        addafter(Status)
        {
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ShowMandatory = true;
                ApplicationArea = ALL;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("AME Description"; Rec."AME Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }
}
