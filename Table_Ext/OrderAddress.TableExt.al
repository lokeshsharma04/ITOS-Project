tableextension 52162 "AME Order Address" extends "Order Address"
{
    fields
    {
        field(52100; "AME Shipment Method Code"; Code[20])
        {
            Caption = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method".Code;
        }
    }
}
