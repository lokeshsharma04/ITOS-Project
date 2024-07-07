pageextension 52215 "AME Purch. Ord From SalesOrder" extends "Purch. Order From Sales Order"
{
    layout
    {
        addafter(Vendor)
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
