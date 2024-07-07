pageextension 52103 AME_Vendor_Card extends "Vendor Card"
{
    actions
    {
        addlast("Ven&dor")
        {
            action("AME Landed Cost Setup")
            {
                ApplicationArea = All;
                Caption = 'Landed Cost Setup';
                Image = ItemCosts;

                trigger OnAction()
                var
                    LandedCostSetupPage: Page "AME Landed Cost Setup";
                    LandedCostSetupRec: Record "AME Landed Cost";
                begin
                    LandedCostSetupRec.SetCurrentKey(AME_Vendor_No, AME_Supply_From, AME_Transport_Type, AME_Shipment_Method, AME_Charge_Code);
                    LandedCostSetupRec.SetRange(AME_Vendor_No, Rec."No.");
                    if LandedCostSetupRec.FindFirst() then;
                    LandedCostSetupPage.SetTableView(LandedCostSetupRec);
                    LandedCostSetupPage.RunModal();
                end;
            }
        }

    }
}
