pageextension 52136 "AME Purchase Quote" extends "Purchase Quote"
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
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ApplicationArea = ALL;
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
                    Rec.RefreshPurchasePrices(Rec);
                end;
            }
        }
    }
}
