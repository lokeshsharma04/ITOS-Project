pageextension 52181 "AME Item Registers" extends "Item Registers"
{
    actions
    {
        addlast(Reporting)
        {
            action(AccountAnalysis)
            {
                ApplicationArea = All;
                Caption = 'Stock Adjustment';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                var
                    ItemRegister: Record "Item Register";
                begin
                    ItemRegister.Reset();
                    ItemRegister.SetRange("No.", Rec."No.");
                    Report.Run(Report::"AME Areen Stock Adjustment", true, false, ItemRegister);
                end;
            }
        }
    }
}
