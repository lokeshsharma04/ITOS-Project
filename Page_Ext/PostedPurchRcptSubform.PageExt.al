pageextension 52196 "AME Posted Purch. Rcpt Subform" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("AME Remarks"; Rec."AME Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remarks field.';
            }
        }
    }
}
