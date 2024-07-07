pageextension 52154 "General Posting Setup Ext" extends "General Posting Setup"
{
    layout
    {
        addafter("Sales Account")
        {

            field("Sales Revn. Reversal Acc."; Rec."AME Sales Revn. Reversal Acc.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Revenue Reversal Acc. field.';
            }
            field("AME Sales VAT Reversal Acc."; Rec."AME Sales VAT Reversal Acc.")
            {
                ApplicationArea = All;
            }
        }
    }
}
