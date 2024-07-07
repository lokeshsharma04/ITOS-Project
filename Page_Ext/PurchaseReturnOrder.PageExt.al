pageextension 52137 "AME Purchase Return Order" extends "Purchase Return Order"
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
                ShowMandatory = true;
                ApplicationArea = ALL;
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
        addafter("Responsibility Center")
        {
            field("AME Workflow Category"; Rec."AME Workflow Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Workflow Category field.';
            }
            field("AME Documents Attached"; Rec."AME Documents Attached")
            {
                ApplicationArea = All;
                DrillDownPageId = "Document Attachment Details";
            }
        }

    }
    actions
    {
        addafter(Post)
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
                    Rec.RefreshPurchasePrices(Rec);
                end;
            }
        }
    }
}
