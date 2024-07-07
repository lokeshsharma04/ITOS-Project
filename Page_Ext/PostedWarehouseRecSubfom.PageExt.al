pageextension 52107 "AME Posted Whse. Rec Subfom" extends "Posted Whse. Receipt Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Actual Qty"; Rec."Actual Qty")
            {
                ApplicationArea = all;

            }
            field("Actual Qty (Base)"; Rec."Actual Qty (Base)")
            {
                ApplicationArea = all;
                Visible = false;

            }
            field("Excess Qty"; Rec."Excess Qty")
            {
                ApplicationArea = all;
            }
            field("Excess Qty (Base)"; Rec."Excess Qty (Base)")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Short Qty"; Rec."Short Qty")
            {
                ApplicationArea = all;
            }
            field("Short Qty (Base)"; Rec."Short Qty (Base)")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Damaged Qty"; Rec."Damaged Qty")
            {
                ApplicationArea = all;
            }
            field("Damaged Qty (Base)"; Rec."Damaged Qty (Base)")
            {
                ApplicationArea = all;
                Visible = false;
            }
        }
        addlast(Control1)
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
        }
    }
}
