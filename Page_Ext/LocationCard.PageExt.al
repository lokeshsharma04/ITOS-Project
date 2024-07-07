pageextension 52167 "Location Card Ext" extends "Location Card"
{
    layout
    {
        addafter("Cross-Dock Due Date Calc.")
        {
            group(Adjustment_2)
            {
                Caption = 'Adjustment';
                field("Create Pos. Adj. EOR"; Rec."AME Create Pos. Adj. EOR")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Create Pos. Adj. Entries on Receipt field.';
                }
                field("Adj. Template Name"; Rec."AME Adj. Template Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Adj. Template Name field.';
                }
                field("Adj. Batch Name"; Rec."AME Adj. Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Adj. Batch Name field.';
                }
            }
        }
        addafter("Adjustment Bin Code")
        {
            field("AME Adjustment Bin Code"; Rec."AME Adjustment Bin Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Adjustment Bin Code 2 field.';
            }
        }
    }
}
