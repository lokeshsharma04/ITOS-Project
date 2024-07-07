pageextension 52184 "AME Chart of Accounts" extends "Chart of Accounts"
{
    actions
    {
        addlast(reporting)
        {
            action(AccountAnalysis)
            {
                ApplicationArea = All;
                Caption = 'Account Analysis Report';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                var
                    GLAcc: Record "G/L Account";
                begin
                    GLAcc.Reset();
                    GLAcc.SetRange("No.", Rec."No.");
                    Report.Run(Report::"AME Account Analysis Report", true, false, GLAcc);
                end;
            }
        }
    }
}
