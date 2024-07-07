table 52120 "AME Landed Cost"
{
    Caption = 'Landed Cost';
    DataClassification = CustomerContent;

    fields
    {
        field(52121; AME_Vendor_No; Code[20])
        {
            Caption = 'Vendor No';
            DataClassification = CustomerContent;
            TableRelation = "Vendor";
            NotBlank = true;
        }
        field(52122; AME_Supply_From; Code[20])
        {
            Caption = 'Supply From';
            DataClassification = CustomerContent;
            TableRelation = "Order Address".Code where("Vendor No." = field(AME_Vendor_No));
            NotBlank = true;
        }
        field(52123; AME_Transport_Type; Code[20])
        {
            Caption = 'Transport Type ';
            DataClassification = CustomerContent;
            TableRelation = "Transport Method";
            NotBlank = true;
        }
        field(52124; AME_Shipment_Method; Code[20])
        {
            Caption = 'Shipment Type ';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
            NotBlank = true;
        }
        field(52125; AME_Charge_Code; Code[20])
        {
            Caption = 'Charge Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Charge";
            NotBlank = true;
        }
        field(52126; AME_Charge_Type; Enum "AME Landed Cost Charge Type")
        {
            Caption = 'Charge Type';
            DataClassification = CustomerContent;
        }
        field(52127; AME_Charge; Decimal)
        {
            Caption = 'Charge';
            DataClassification = CustomerContent;
        }
        field(52130; AME_Vendor_Name; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field(AME_Vendor_No)));
        }
    }

    keys
    {
        key(PK; AME_Vendor_No, AME_Supply_From, AME_Transport_Type, AME_Shipment_Method, AME_Charge_Code)
        {
            Clustered = true;
        }
    }

}
