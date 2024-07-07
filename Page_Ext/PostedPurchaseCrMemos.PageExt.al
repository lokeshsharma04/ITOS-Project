pageextension 52201 "AME Posted Purchase Cr. Memos" extends "Posted Purchase Credit Memos"
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

