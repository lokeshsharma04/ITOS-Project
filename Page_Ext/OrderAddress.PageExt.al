pageextension 52179 "AME Order Address" extends "Order Address"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("AME Shipment Method Code"; Rec."AME Shipment Method Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Shipment Method Code field.';
            }
        }
    }
}
