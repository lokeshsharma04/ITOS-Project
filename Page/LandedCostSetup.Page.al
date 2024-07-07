page 52121 "AME Landed Cost Setup"
{

    Caption = 'Landed Cost Setup';
    PageType = List;
    SourceTable = "AME Landed Cost";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Vendor No"; Rec."AME_Vendor_No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AME_Vendor_Name; Rec.AME_Vendor_Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Supply From"; Rec."AME_Supply_From")
                {
                    ApplicationArea = All;
                }
                field("Transport Type"; Rec."AME_Transport_Type")
                {
                    ApplicationArea = All;
                }
                field("Shipment Type"; Rec.AME_Shipment_Method)
                {
                    ApplicationArea = All;
                }
                field("Charge Code"; Rec."AME_Charge_Code")
                {
                    ApplicationArea = All;
                }
                field("Charge Type"; Rec."AME_Charge_Type")
                {
                    ApplicationArea = All;
                }
                field("Charge"; Rec."AME_Charge")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
