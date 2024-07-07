pageextension 52158 "AME Registered Pick " extends "Registered Pick"
{
    actions
    {
        addlast(Reporting)
        {
            action(Report)
            {
                ApplicationArea = All;
                Caption = 'Move Order Transfers';
                Image = Print;

                trigger OnAction()
                var
                    FinishedGoodsReport: Report "AME Move Order Transfers Rep";
                    PostedAssOrders: Record "Registered Whse. Activity Hdr.";
                begin
                    PostedAssOrders.SetRange("No.", rec."No.");
                    FinishedGoodsReport.SetTableView(PostedAssOrders);
                    FinishedGoodsReport.RunModal();
                end;
            }
        }
    }
}

