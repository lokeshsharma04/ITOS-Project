pageextension 52129 "AME Posted Assembly Orders" extends "Posted Assembly Orders"
{
    actions
    {
        addlast(Reporting)
        {
            action(AMEFinishedGoods)
            {
                ApplicationArea = All;
                Caption = 'Finished Goods';
                Image = Report2;

                trigger OnAction()
                var
                    FinishedGoodsReport: Report "AME Finished Goods-Report";
                    PostedAssOrders: Record "Posted Assembly Header";
                begin
                    PostedAssOrders.SetRange("No.", rec."No.");
                    FinishedGoodsReport.SetTableView(PostedAssOrders);
                    FinishedGoodsReport.RunModal();
                end;

            }
        }
    }
}
