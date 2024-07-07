pageextension 52170 "AME Warehouse Entries" extends "Warehouse Entries"
{
    layout
    {
        addafter("Reason Code")
        {
            field(Comments; Rec."AME Comments")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Comments field.';
            }
            field("AME Assembly Order No."; Rec."AME Assembly Order No.")
            {
                ApplicationArea = All;
            }
            field("AME Worksheet Template Name"; Rec."AME Worksheet Template Name")
            {
                ApplicationArea = All;
            }
            field("AME Worksheet Batch Name"; Rec."AME Worksheet Batch Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("Whse. Document No.")
        {
            field("AME Item Category 1"; Rec."AME Item Category 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Areen Category field.';
            }
            field("AME Item Category 2"; Rec."AME Item Category 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Areen Sub Category 1 field.';
            }
            field("AME Item Category 3"; Rec."AME Item Category 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Areen Sub Category 2 field.';
            }
            field("AME Item Category 4"; Rec."AME Item Category 4")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Areen Sub Category 3 field.';
            }
            field("AME Item Category 5"; Rec."AME Item Category 5")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Category field.';
            }
            field("AME Item Category 6"; Rec."AME Item Category 6")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Sub Category 1 field.';
            }
            field("AME Item Category 7"; Rec."AME Item Category 7")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Sub Category 2 field.';
            }
            field("AME Item Category 8"; Rec."AME Item Category 8")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Sub Category 3 field.';
            }
            field("AME Item Category 9"; Rec."AME Item Category 9")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Sub Category 4 field.';
            }
            field("AME Item Category 10"; Rec."AME Item Category 10")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pigeon Sub Category 5 field.';
            }
            field("AME Item Category 11"; Rec."AME Item Category 11")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marketing Category field.';
            }
            field("AME Item Category 12"; Rec."AME Item Category 12")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marketing Sub Category 1 field.';
            }
            field("AME Item Category 13"; Rec."AME Item Category 13")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marketing Sub Category 2 field.';
            }
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
