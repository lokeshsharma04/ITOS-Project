pageextension 52115 "AME Regi Movement Subform" extends "Registered Movement Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = ALL;
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
