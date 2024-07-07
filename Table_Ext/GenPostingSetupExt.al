tableextension 52151 "AME Gen. Posting Setup Ext" extends "General Posting Setup"
{
    fields
    {
        field(52100; "AME Sales Revn. Reversal Acc."; Code[20])
        {
            Caption = 'Sales Revenue Reversal Acc.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(52101; "AME Sales VAT Reversal Acc."; Code[20])
        {
            Caption = 'Sales VAT Reversal Acc.';
            Description = 'Sales VAT Reversal Acc. is used for reversing VAT amount for FOC/POS item lines';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
    }
}
