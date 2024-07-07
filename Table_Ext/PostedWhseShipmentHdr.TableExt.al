tableextension 52161 "AME Posted Whse. Shipment Hdr " extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(52100; "AME Commercial Invoice No."; Code[20])
        {
            Caption = 'Commercial Invoice No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52101; "AME Ship Confirmed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Ship Confirmed';
            Editable = false;
        }
        field(52103; "AME Bill of Exit Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Bill of Exit Date';
        }
        field(52104; "AME Bill of Exit No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bill of Exit No.';
        }
        field(52105; "AME Ship. Confirm Status"; Enum "AME Ship. Confirmation Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Shipment Confirmation Status';
            Editable = false;
        }
        field(52106; "AME Chamber Charges"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Chamber Charges';
        }
        field(52120; "AME Remarks"; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
    }
}
