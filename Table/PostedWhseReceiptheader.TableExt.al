tableextension 52110 "AME Posted Whse.Receipt header" extends "Posted Whse. Receipt Header"
{
    fields
    {
        field(52100; BL_No; Code[20])
        {
            Caption = 'BL_No';
            DataClassification = CustomerContent;
        }
        field(52101; Supp_Invoice_No; Code[20])
        {
            Caption = 'Supp_Invoice_No';
            DataClassification = CustomerContent;
        }
        field(52102; Supp_Invoice_Date; Date)
        {
            Caption = 'Supp_Invoice_Date';
            DataClassification = CustomerContent;
        }
        field(52103; Expected_Receipt_Date; Date)
        {
            Caption = 'Expected_Receipt_Date';
            DataClassification = CustomerContent;
        }
        field(52104; "Shipment Status"; Enum "Whse. Receipt Ship Status")
        {
            Caption = 'Shipment Status';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52105; "BOE No."; Code[20])
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

            end;
        }
        field(52106; "BOE Date"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

            end;
        }
        field(52107; "AME Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin

            end;
        }
    }
}
