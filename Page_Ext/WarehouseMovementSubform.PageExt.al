pageextension 52112 "AME Warehouse Movement Subform" extends "Warehouse Movement Subform"
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
        addlast(Control1)
        {
            field("AME Lot Description"; Rec."AME Lot Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Lot Description field.';
                Visible = false;
            }
            field("AME Mfg. Date"; Rec."AME Mfg. Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manufacturing Date field.';
                Visible = false;
            }
            field("AME BE No."; Rec."AME BE No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BE No. field.';
                Visible = false;
            }
            field("AME BOE Date"; Rec."AME BOE Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BOE Date field.';
                Visible = false;
            }
            field("AME Country of Origin"; Rec."AME Country of Origin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Country of Origin field.';
                Visible = false;
            }
        }
    }
}
