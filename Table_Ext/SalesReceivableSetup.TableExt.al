tableextension 52109 "AME_Sales&Receivable_Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(52100; AME_DeleteInvdBlnktSalesOrders; Boolean)
        {
            Caption = 'Delete Invd Blnkt Sales Orders';
            DataClassification = CustomerContent;
        }
        field(52101; "AME Price Based On Price Date"; Boolean)
        {
            Caption = 'Sales Price Based on Price Date';
            DataClassification = CustomerContent;
        }
        field(52102; "AME Revenue Adj. Templ. Name"; Code[20])
        {
            Caption = 'Revenue Adj. Templ. Name';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
        }
        field(50103; "AME Revenue Adj. Batch"; Code[20])
        {
            Caption = 'Revenue Adj. Batch';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("AME Revenue Adj. Templ. Name"));
        }
        field(50104; "AME Reverse Rev. For FOC Items"; Boolean)
        {
            Caption = 'Reverse Revenue For FOC Items';
            DataClassification = CustomerContent;
        }
        field(50105; "AME Reverse Rev. For POS Items"; Boolean)
        {
            Caption = 'Reverse Revenue for POS Items';
            DataClassification = CustomerContent;
        }
        field(52106; "AME Commercial Inv. Nos."; Code[20])
        {
            Caption = 'Commercial Inv. Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(51207; "AME Chamber Charge Item"; Code[20])
        {
            Caption = 'Chamber Charge Item';
            DataClassification = CustomerContent;
            TableRelation = Item."No." where(Type = const("Non-Inventory"));
        }
        field(52107; "AME Create Arch. On Release"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Create Archive On Release';
        }
        field(52110; "AME Comm. Inv Req. for Ship"; Boolean)
        {
            Caption = 'Commercial Inv. No. Req. for Shipment';
            DataClassification = CustomerContent;
        }
        field(52111; "AME BOE Details Req. for Ship"; Boolean)
        {
            Caption = 'BOE Details Req. for Shipment';
            DataClassification = CustomerContent;
        }
        field(52112; "AME UOM Req. for Price List"; Boolean)
        {
            Caption = 'Unit of Measure Required for Price List';
            DataClassification = ToBeClassified;
        }
        field(52120; "AME Skip Ship Before WrkDate"; Boolean)
        {
            Caption = 'Skip Shipment before Work date check';
            DataClassification = CustomerContent;
        }
    }
}
