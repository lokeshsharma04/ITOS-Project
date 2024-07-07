pageextension 52175 "AME Posted Whse. Shipment" extends "Posted Whse. Shipment"
{
    layout
    {
        addafter("Posting Date")
        {
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
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
            }
            field("AME Ship Confirmed"; Rec."AME Ship Confirmed")
            {
                ApplicationArea = All;
            }
            field("AME Ship. Confirm Status"; Rec."AME Ship. Confirm Status")
            {
                ApplicationArea = All;
            }
            field("AME Chamber Charges"; Rec."AME Chamber Charges")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Chamber Charges field.';
            }
            field("AME Remarks"; Rec."AME Remarks") { }
        }
    }
}
