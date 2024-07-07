pageextension 52210 "AME G/L Account List" extends "G/L Account List"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }
}
