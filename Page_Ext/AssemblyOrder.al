pageextension 52104 "AME Assembly Order" extends "Assembly Order"
{
    layout
    {
        addafter(Status)
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
        addlast(Print)
        {
            action("AMEWIP Report")
            {
                ApplicationArea = All;
                Caption = 'WIP Report';
                Promoted = true;
                PromotedCategory = Category7;
                Image = Print;

                trigger OnAction()
                var
                    WIPReport: Report "AME WIP Shortage Report";
                    AssOrders: Record "Assembly Header";
                begin
                    AssOrders.SetRange("No.", rec."No.");
                    WIPReport.SetTableView(AssOrders);
                    WIPReport.RunModal();
                end;
            }
        }
    }

}
