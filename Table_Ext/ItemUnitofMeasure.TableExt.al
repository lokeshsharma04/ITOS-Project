tableextension 52101 "AtosSW Item Unit of Measure" extends "Item Unit of Measure"
{
    fields
    {
        // Add changes to table fields here
        field(60110; "AME Carton UOM"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Carton Uom';
        }

    }
}
