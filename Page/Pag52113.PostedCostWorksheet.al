page 52113 "AME Posted Cost Wrk Lines"
{
    ApplicationArea = All;
    Caption = 'Posted Cost Worksheet Lines';
    PageType = List;
    SourceTable = "AME Posted Cost Worksheet";
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(AME_Document_No; Rec.AME_Document_No)
                {
                    ApplicationArea = All;
                }
                field(AME_Document_Type; Rec.AME_Document_Type)
                {
                    ApplicationArea = All;
                }
                field(AME_Vendor_No; Rec.AME_Vendor_No)
                {
                    ApplicationArea = All;
                }
                field(AME_Vendor_Name; Rec.AME_Vendor_Name)
                {
                    ApplicationArea = All;
                }
                field(AME_Supply_From; Rec.AME_Supply_From)
                {
                    ApplicationArea = All;
                }
                field(AME_Transport_Type; Rec.AME_Transport_Type)
                {
                    ApplicationArea = All;
                }
                field(AME_Shipment_Method; Rec.AME_Shipment_Method)
                {
                    ApplicationArea = All;
                }
                field(AME_Charge_Type; Rec.AME_Charge_Type)
                {
                    ApplicationArea = All;
                }
                field(AME_Charge_Amount; Rec.AME_Charge_Amount)
                {
                    ApplicationArea = All;
                }
                field(AME_Charge; Rec.AME_Charge)
                {
                    ApplicationArea = All;
                }
                field(AME_Charge_Code; Rec.AME_Charge_Code)
                {
                    ApplicationArea = All;
                }
                field(AME_Service_Vendor_No; Rec.AME_Service_Vendor_No)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
