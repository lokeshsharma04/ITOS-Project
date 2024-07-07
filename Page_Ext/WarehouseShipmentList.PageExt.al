pageextension 52169 "AME Warehouse Shipment List" extends "Warehouse Shipment List"
{
    layout
    {
        addafter("Sorting Method")
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Commercial Invoice No. field.';
            }
            field("Bill of Exit Date"; Rec."AME Bill of Exit Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit Date field.';
            }
            field("Bill of Exit No."; Rec."AME Bill of Exit No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit No. field.';
            }
            field("AME Ship. Confirm Status"; Rec."AME Ship. Confirm Status")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnDeleteRecord(): Boolean
    var
    BEGIN
        Rec.CanUserDeleteShipmentDocument();
    END;
}
