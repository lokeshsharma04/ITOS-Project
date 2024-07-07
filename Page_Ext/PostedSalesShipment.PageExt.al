pageextension 52176 "AME Posted Sales Shipment" extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Commercial Invoice No. field.';
            }
            field("AME Bill of Exit Date"; Rec."AME Bill of Exit Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit Date field.';
            }
            field("AME Bill of Exit No."; Rec."AME Bill of Exit No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit No. field.';
            }
            field("AME Chamber Charges"; Rec."AME Chamber Charges")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Chamber Charges field.';
            }
            field("AME Remarks"; Rec."AME Remarks")
            {
                ApplicationArea = All;
            }
        }
    }
}
