tableextension 52114 "AME Bank Acc. Recon. Line" extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        field(52100; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
            DataClassification = CustomerContent;
        }
    }
}
