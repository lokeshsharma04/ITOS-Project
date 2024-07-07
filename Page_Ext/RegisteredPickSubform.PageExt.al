pageextension 52212 "AME Registered Pick Subform" extends "Registered Pick Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("AME Lot Description"; Rec."AME Lot Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Lot Description field.';
            }
            field("AME Mfg. Date"; Rec."AME Mfg. Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manufacturing Date field.';
            }
            field("AME BE No."; Rec."AME BE No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BE No. field.';
            }
            field("AME BOE Date"; Rec."AME BOE Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BOE Date field.';
            }
            field("AME Country of Origin"; Rec."AME Country of Origin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Country of Origin field.';
            }
        }
    }
}
