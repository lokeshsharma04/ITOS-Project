pageextension 52122 "AME Bank Acc. Recon. Lines" extends "Bank Acc. Reconciliation Lines"
{
    layout
    {
        addafter(Description)
        {
            field("Cheque No."; Rec."Cheque No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cheque No. field.';
            }
        }
    }
}
