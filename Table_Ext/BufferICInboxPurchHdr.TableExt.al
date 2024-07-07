tableextension 52181 "AME Buffer IC Inbox Purch Hdr" extends "Buffer IC Inbox Purch Header"
{
    fields
    {
        field(52100; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
        }
        field(52102; "AME Purch. Order Type"; Enum "AME Purch. Order Type")
        {
            Caption = 'Purch. Order Type';
            DataClassification = CustomerContent;
        }
        field(52103; "AME Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
}
