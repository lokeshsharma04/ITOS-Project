pageextension 52205 "AME Posted Return Shipments" extends "Posted Return Shipments"
{
    layout
    {
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
