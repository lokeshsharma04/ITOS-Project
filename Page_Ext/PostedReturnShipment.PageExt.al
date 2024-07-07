pageextension 52204 "AME Posted Return Shipment" extends "Posted Return Shipment"
{
    layout
    {
        addafter("Responsibility Center")
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
