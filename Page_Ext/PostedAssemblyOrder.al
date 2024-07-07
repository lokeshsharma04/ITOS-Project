pageextension 52108 "AME Posted Assembly Order" extends "Posted Assembly Order"
{
    layout
    {
        addafter(Reversed)
        {
            field("Sub-contract Order"; Rec."Sub-contract Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sub-contract Order field.';
            }
        }
    }
    actions
    {
        addlast(Reporting)
        {
            action(AMEFinishedGoods)
            {
                ApplicationArea = All;
                Caption = 'Finished Goods';
                Image = Print;

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
            action(Report)
            {
                ApplicationArea = All;
                Caption = 'Assembly Man Hours';
                Image = Print;

                trigger OnAction()
                var
                    ManHousReport: Report "AME Assembly Man Hours";
                    PostedAssOrders: Record "Posted Assembly Header";
                begin
                    PostedAssOrders.SetRange("No.", rec."No.");
                    ManHousReport.SetTableView(PostedAssOrders);
                    ManHousReport.RunModal();
                end;
            }
        }
    }
}
