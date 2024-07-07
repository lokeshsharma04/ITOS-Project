pageextension 52106 "AME Whse. Receipt Subform." extends "Whse. Receipt Subform"
{
    layout
    {
        addafter("Qty. to Receive")
        {
            field("Landed Cost %"; Rec."Landed Cost %")
            {
                ApplicationArea = all;
                Editable = false;
                Visible = ShowCost;
            }
            field("Landed Cost Amt."; Rec."Landed Cost Amt.")
            {
                ApplicationArea = all;
                Editable = false;
                Visible = ShowCost;
            }
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
                Editable = false;
            }
            field("Excess Qty (Base)"; Rec."Excess Qty (Base)")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Short Qty"; Rec."Short Qty")
            {
                ApplicationArea = all;
                Editable = false;
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
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Currency Code field.';
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unit Cost field.';
                Visible = ShowCost;
            }
            field("Line Amount"; Rec."Line Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Line Amount field.';
                Visible = ShowCost;
            }
            field("Line Amount (LCY)"; Rec."Line Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Line Amount (LCY) field.';
                Visible = ShowCost;
            }
            field("AME Remarks"; Rec."AME Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Remarks field.';
            }

        }

        modify("Qty. to Receive")
        {
            trigger OnBeforeValidate()
            begin
                Rec.CheckDocShipStatus();
            end;
        }
        addafter("Over-Receipt Code")
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
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.CheckDocShipStatus();
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        Rec.CheckDocShipStatus();
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        ShowCost := AMEUtility.CanShowCostToUser();
    end;

    var
        ShowCost: Boolean;
        AMEUtility: Codeunit "AME Utility";

}
