page 52102 "AME Item Category List"
{
    ApplicationArea = All;
    Caption = 'Category List';
    PageType = List;
    SourceTable = "AME Item Category";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Category Level"; Rec."AME Category Level")
                {
                    ToolTip = 'Specifies the value of the Category Level field.';
                    ApplicationArea = all;
                }
                field("Code"; Rec."AME Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = all;
                }
                field(Description; Rec."AME Description")
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = all;
                }
            }
        }
    }
}
