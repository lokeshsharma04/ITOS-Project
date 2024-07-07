page 52120 "AME Landed Cost"
{
    ApplicationArea = All;
    Caption = 'Landed Cost Master';
    PageType = List;
    SourceTable = "AME Landed Cost";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Vendor No"; Rec."AME_Vendor_No")
                {
                    ApplicationArea = All;
                }
                field(AME_Vendor_Name; Rec.AME_Vendor_Name)
                {
                    ApplicationArea = All;
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
