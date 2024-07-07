pageextension 52180 "AME ATOS App Setup" extends "ATOS App Setup"
{
    layout
    {
        addlast(General)
        {
            field("AME Allowed Extension"; Rec."AME Allowed Extension")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Allowed Extension field.';
            }
            field("AME Max. File Size (KB)"; Rec."AME Max. File Size (KB)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Max. File Size (KB) field.';
            }
        }
    }
}
