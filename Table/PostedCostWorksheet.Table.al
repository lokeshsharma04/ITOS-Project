table 52123 "AME Posted Cost Worksheet"
{
    Caption = 'Posted Cost Worksheet';
    DataClassification = CustomerContent;

    fields
    {
        field(1; AME_Document_Type; Enum "AME Cost Worksheet Doc. Type")
        {
            Caption = 'Document Type';
            Editable = false;
        }
        field(5; AME_Document_No; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; AME_Vendor_No; Code[20])
        {
            Caption = 'Vendor No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; AME_Vendor_Name; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Vendor.Name where("No." = field(AME_Vendor_No)));
        }
        field(15; AME_Supply_From; Code[20])
        {
            Caption = 'Supply From';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(18; AME_Transport_Type; Code[20])
        {
            Caption = 'Transport Type';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Transport Method";
        }
        field(25; AME_Shipment_Method; Code[20])
        {
            Caption = 'Shipment Method';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(28; AME_Charge_Code; Code[20])
        {
            Caption = 'Charge Code';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Item Charge";
        }
        field(30; AME_Charge_Type; Enum "AME Landed Cost Charge Type")
        {
            Caption = 'Charge Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(35; AME_Charge; Decimal)
        {
            Caption = 'Charge';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(40; AME_Charge_Amount; Decimal)
        {
            Caption = 'Charge Amount';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(45; AME_Service_Vendor_No; Code[20])
        {
            Caption = 'Service Vendor No.';
            Editable = true;
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";
        }
        field(46; TotalCharges; Decimal)
        {
            Caption = 'Total Charges';
            DataClassification = CustomerContent;
        }
        field(47; TotalInvoiceValue; Decimal)
        {
            Caption = 'Total Invoice Value';
            DataClassification = CustomerContent;
        }
        field(48; LandedCostFactor; Decimal)
        {
            Caption = 'Landed Cost Factor';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; AME_Document_Type, AME_Document_No, AME_Charge_Code)
        {
            Clustered = true;
        }
    }
}
