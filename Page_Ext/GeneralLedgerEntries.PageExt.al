pageextension 52155 "AME General Ledger Entries " extends "General Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("AME Prod. Posting Type"; Rec."AME Prod. Posting Type")
            {
                ApplicationArea = all;
            }
        }
    }
}
