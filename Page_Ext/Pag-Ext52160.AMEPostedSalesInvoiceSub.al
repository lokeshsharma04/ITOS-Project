pageextension 52160 "AME Posted Sales Invoice Sub." extends "Posted Sales Invoice Subform"
{
    layout
    {
        moveafter("No."; "Gen. Prod. Posting Group")
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        addafter("Gen. Prod. Posting Group")
        {
            field("AME Prod. Posting Type"; Rec."AME Prod. Posting Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Prod. Posting Type field.';
            }
        }
    }
}
