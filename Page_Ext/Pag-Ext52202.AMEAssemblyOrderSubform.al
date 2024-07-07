pageextension 52202 "AME Assembly Order Subform" extends "Assembly Order Subform"
{
    layout
    {
        addafter("Quantity to Consume")
        {
            field("AME Qty. Picked"; Rec."AME Qty. Picked")
            {
                ApplicationArea = All;
            }
        }
    }
}
