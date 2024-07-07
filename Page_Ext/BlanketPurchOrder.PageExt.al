pageextension 52133 "AME Blanket Purch Order" extends "Blanket Purchase Order"
{
    layout
    {
        addafter("Order Date")
        {
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("AME Description"; Rec."AME Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
                // MultiLine = true;
            }
        }
    }
    actions
    {
        addafter("O&rder")
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
                    Rec.RefreshPurchasePrices(Rec);
                end;
            }
        }
    }


}
