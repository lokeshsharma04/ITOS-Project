page 52133 "Assembly Activities"
{
    ApplicationArea = All;
    Caption = 'Assembly Activities';
    PageType = CardPart;
    SourceTable = "Activities Cue";
    RefreshOnActivate = true;
    ShowFilter = false;


    layout
    {
        area(content)
        {
            cuegroup("Assembly Orders")
            {
                field("Assembly Orders - Open"; Rec."Assembly Orders - Open")
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    DrillDownPageId = "Assembly Orders";
                    ToolTip = 'Specifies the value of the Assembly Orders - Open field.';
                }
                field("Assembly Orders - Released"; Rec."Assembly Orders - Released")
                {
                    ApplicationArea = All;
                    Caption = 'Released';
                    DrillDownPageId = "Assembly Orders";
                    ToolTip = 'Specifies the value of the Assembly Orders - Released field.';
                }
                field("Picked - Not Assembled"; Rec."Picked - Not Assembled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assembly Orders - Released field.';
                }
            }
        }
    }
}
