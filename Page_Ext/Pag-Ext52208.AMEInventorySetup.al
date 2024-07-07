pageextension 52216 "AME Inventory Setup" extends "Inventory Setup"
{
    layout
    {
        addafter("Skip Prompt to Create Item")
        {
            field("Skip Delete Item Track Confirm"; Rec."AME Skip Del ItemTrack Confirm")
            {
                ApplicationArea = All;
            }
        }
    }
}
