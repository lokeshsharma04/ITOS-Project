pageextension 52123 "AME Sales Return Order" extends "Sales Return Order"
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
        addafter("P&osting")
        {
            action(RefreshPrice)
            {
                ApplicationArea = all;
                Image = Price;
                Caption = 'Refresh Price';
                Promoted = true;
                PromotedCategory = Category7;
                trigger OnAction()
                begin
                    Rec.RefreshSalesPrices(Rec);
                end;
            }
        }
    }
}
