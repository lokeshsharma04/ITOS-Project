pageextension 52110 "AME Posted Whse.Receipt Card " extends "Posted Whse. Receipt"
{
    layout
    {
        addafter("Assignment Time")
        {
            field("BL_No"; Rec.BL_No)
            {
                Caption = 'BL No';
                ApplicationArea = All;
            }
            field("Supp_Invoice_No"; Rec.Supp_Invoice_No)
            {
                Caption = 'Supp Invoice No';
                ApplicationArea = All;
            }
            field("Supp_Invoice_Date"; Rec.Supp_Invoice_Date)
            {
                Caption = 'Supp Invoice Date';
                ApplicationArea = All;
            }
            field("Expected_Receipt_Date"; Rec.Expected_Receipt_Date)
            {
                Caption = 'Expected Receipt Date';
                ApplicationArea = All;
            }
        }
        addafter(Expected_Receipt_Date)
        {
            field("Shipment Status"; Rec."Shipment Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shipment Status field.';
            }
        }
    }
    actions
    {

        addlast("&Receipt")
        {
            action("AME Cost_Worksheet")
            {
                ApplicationArea = All;
                Caption = 'Cost Worksheet';
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Category8;
                trigger OnAction()
                var
                    PostedCostWorksheetPage: Page "AME Posted Cost Worksheet";
                    PostedCostWorksheetRec: Record "AME Posted Cost Worksheet";
                begin
                    PostedCostWorksheetRec.Reset();
                    PostedCostWorksheetRec.SetRange(AME_Document_Type, PostedCostWorksheetRec.AME_Document_Type::"Warehouse Receipt");
                    PostedCostWorksheetRec.SetRange(AME_Document_No, Rec."Whse. Receipt No.");
                    PostedCostWorksheetPage.SetTableView(PostedCostWorksheetRec);
                    PostedCostWorksheetPage.RunModal();
                end;
            }
        }
        addlast(reporting)
        {
            action("AME Initial GRN")
            {
                ApplicationArea = ALL;
                Caption = 'Initial GRN';
                Image = Print;

                trigger OnAction()
                var
                    WRh: Record "Posted Whse. Receipt Header";
                BEGIN
                    WRh.SetRange("No.", rec."No.");
                    Report.Run(Report::"Inital GRN Report1", true, false, WRh);
                END;
            }
        }
    }
}
