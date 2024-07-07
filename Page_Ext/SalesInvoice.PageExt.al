pageextension 52125 "AME Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("Posting Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Price Date field.';
            }
        }
        addafter("External Document No.")
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Commercial Invoice No. field.';
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
                trigger OnAction()
                begin
                    Rec.RefreshSalesPrices(Rec);
                end;
            }
        }
    }
}
