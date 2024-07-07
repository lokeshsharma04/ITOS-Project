pageextension 52126 "AME Sales Quote" extends "Sales Quote"
{
    layout
    {
        addafter("Order Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Price Date field.';
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            action(RefreshPrice)
            {
                ApplicationArea = all;
                Image = Price;
                Caption = 'Refresh Price';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.RefreshSalesPrices(Rec);
                end;
            }
        }
    }
}