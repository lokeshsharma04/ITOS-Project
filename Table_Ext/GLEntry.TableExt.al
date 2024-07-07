tableextension 52147 "AME G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(52100; "AME Prod. Posting Type"; Enum "Ame Prod. Posting Type")
        {
            Caption = 'Prod. Posting Type';
            DataClassification = CustomerContent;
        }
    }
}
