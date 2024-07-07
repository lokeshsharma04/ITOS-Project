page 52132 "AME Commercial Activities"
{
    ApplicationArea = All;
    Caption = 'Commercial Activities';
    PageType = CardPart;
    SourceTable = "Purchase Cue";

    layout
    {
        area(content)
        {
            cuegroup(Purchase)
            {
                Caption = 'Purchase Order - Status';
                field("AME Purchase Order 2-Open"; Rec."AME Purchase Order 2-Open")
                {
                    ToolTip = 'Specifies the value of the Released field.';
                    DrillDownPageId = "Purchase Order List";
                }
                field("AME Purch. Order 2-Pending App"; Rec."AME Purch. Order 2-Pending App")
                {
                    DrillDownPageId = "Purchase Order List";
                    ToolTip = 'Specifies the value of the Pending Approval field.';
                }
                field("AME Purchase Order 2-Released"; Rec."AME Purchase Order 2-Released")
                {
                    DrillDownPageId = "Purchase Order List";
                    ToolTip = 'Specifies the value of the Released field.';
                }
                field("AME Purch Received Not Invoic."; Rec."AME Not Invoiced Purchase")
                {
                    DrillDownPageId = "Purchase Order List";
                    ToolTip = 'Specifies the value of the Not Invoiced Purchase field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("AME Purch. Order Type", '%1', Rec."AME Purch. Order Type"::Expense);
    end;
}
