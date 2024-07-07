pageextension 52213 "AME Item Tracking Lines" extends "Item Tracking Lines"
{
    layout
    {
        addafter("Expiration Date")
        {
            field("AME Mfg. Date"; Rec."AME Mfg. Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AME BE No."; Rec."AME BE No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AME BOE Date"; Rec."AME BOE Date")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("AME Country of Origin"; Rec."AME Country of Origin")
            {
                ApplicationArea = All;
                Editable = false;
            }

        }
        modify("Expiration Date")
        {
            Visible = true;
        }
    }
}
