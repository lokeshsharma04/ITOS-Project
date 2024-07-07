tableextension 52134 "AME Purc & payable setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(52101; "AME Price Based On Price Date"; Boolean)
        {
            Caption = 'Purchase Price Based on Price Date';
            DataClassification = CustomerContent;
        }
        field(52107; "AME Create Arch. On Release"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Create Archive On Release';
        }
        field(52112; "AME UOM Req. for Price List"; Boolean)
        {
            Caption = 'Unit of Measure Required for Price List';
            DataClassification = CustomerContent;
        }
        field(52108; "AME Copy Des from Rcpt/Shpt Ln"; Boolean)
        {
            Caption = 'Copy Description from Receipt or Shipment';
            DataClassification = CustomerContent;
        }
        field(52120; "AME Default IC Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Default IC Vendor No.';
            TableRelation = Vendor."No.";
        }
    }
}
