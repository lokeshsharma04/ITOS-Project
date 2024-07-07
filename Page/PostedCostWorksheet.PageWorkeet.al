page 52125 "AME Posted Cost Worksheet"
{
    ApplicationArea = All;
    Caption = 'Posted Cost Worksheet';
    PageType = Worksheet;
    SourceTable = "AME Posted Cost Worksheet";
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec.AME_Document_No)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Document Type"; Rec.AME_Document_Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Charges"; Rec.TotalCharges)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Invoice Value"; Rec.TotalInvoiceValue)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Landed Cost Factor"; Rec.LandedCostFactor)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            repeater(Control1)
            {
                field("Vendor No"; Rec."AME_Vendor_No")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Vendor Name"; Rec.AME_Vendor_Name)
                {
                    ApplicationArea = All;
                    Visible = false;
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
                field("Charge Amount"; Rec."AME_Charge_Amount")
                {
                    ApplicationArea = All;
                }
                field("Service Vendor No"; Rec."AME_Service_Vendor_No")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }
}