pageextension 52114 "AME Movement Worksheet" extends "Movement Worksheet"
{
    layout
    {
        addafter(Quantity)
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = all;
            }

            field(Comments; Rec."AME Comments")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Comments field.';
            }
            field("AME Assembly Order No."; Rec."AME Assembly Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
