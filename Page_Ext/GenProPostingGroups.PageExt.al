pageextension 52151 "AME Gen. Pro PostingGroups" extends "Gen. Product Posting Groups"
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
