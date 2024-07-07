tableextension 52155 "AME Buffer IC Inbox Sales Hdr" extends "Buffer IC Inbox Sales Header"
{
    fields
    {
        field(52100; "AME SO Status"; Option)
        {
            OptionMembers = Open,"On-Hold",Confirmed,Canceled;
            OptionCaption = 'Open,On-Hold,Confirmed,Canceled';
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'SO Status';
        }
        field(52101; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
        }
        field(52102; "AME Commercial Invoice No."; Code[20])
        {
            Caption = 'Commercial Invoice No.';
            DataClassification = CustomerContent;
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
        field(52105; "AME Chamber Charges"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Chamber Charges';
        }
    }
}
