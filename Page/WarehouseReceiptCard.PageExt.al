pageextension 52113 "AME Warehouse Receipt" extends "Warehouse Receipt"
{
    layout
    {
        addafter("Sorting Method")
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
            field("BOE No."; Rec."BOE No.")
            {
                ApplicationArea = all;
            }
            field("BOE Date"; Rec."BOE Date")
            {
                ApplicationArea = all;
            }
            field("AME Transport Method"; Rec."AME Transport Method")
            {
                ApplicationArea = All;
            }
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
                    CostWorksheetPage: Page "AME_Cost_Worksheet";
                    CostWorksheetRec: Record "AME Cost_Worksheet";
                    PuchHeader: Record "Purchase Header";
                begin
                    Rec.TestField("AME Transport Method");
                    if Rec.IsLandedCostApplicable() then begin
                        PuchHeader := Rec.GetFirstPOFromWarehouseReceipt();
                        CostWorksheetPage.InitDetails(CostWorksheetRec.AME_Document_Type::"Warehouse Receipt", Rec."No.", PuchHeader."Buy-from Vendor No.");
                        CostWorksheetRec.Reset();
                        CostWorksheetRec.SetRange(AME_Document_Type, CostWorksheetRec.AME_Document_Type::"Warehouse Receipt");
                        CostWorksheetRec.SetRange(AME_Document_No, Rec."No.");
                        CostWorksheetRec.SetRange(AME_Vendor_No, PuchHeader."Buy-from Vendor No.");
                        CostWorksheetPage.SetTableView(CostWorksheetRec);
                        CostWorksheetPage.RunModal();
                    end;
                end;
            }

        }
        addlast(Reporting)
        {
            action("AME Initial GRN")
            {
                ApplicationArea = ALL;
                Caption = 'GIT';
                Image = Print;

                trigger OnAction()
                var
                    InitialGrn: Report "Inital GRN Report";
                    WRh: Record "Warehouse Receipt Header";
                BEGIN
                    WRh.SetRange("No.", rec."No.");
                    Report.Run(Report::"Inital GRN Report", true, false, WRh);
                END;
            }
            action("AMELandedCostReview")
            {
                ApplicationArea = ALL;
                Caption = 'Landed Cost Review';
                Image = Print;

                trigger OnAction()
                var
                    //InitialGrn: Report "Inital GRN Report";
                    WRh: Record "Warehouse Receipt Header";
                BEGIN
                    WRh.SetRange("No.", rec."No.");
                    Report.Run(Report::"AME Landed Cost Review", true, false, WRh);
                END;
            }
            action("AME Invoice/GRN Verification")
            {
                ApplicationArea = ALL;
                Image = Print;
                Caption = 'Invoice/GRN Verification';
                trigger OnAction()
                var
                    InvoiceGRNReport: Report "AME Invoice/GRN Verification";
                    WRh: Record "Warehouse Receipt Header";
                BEGIN
                    WRh.SetRange("No.", rec."No.");
                    Report.Run(Report::"AME Invoice/GRN Verification", true, false, WRh);
                END;
            }
        }
        addafter("P&osting")
        {
            group(ShipmentStatus)
            {
                Caption = 'Shipment Status';
                Image = ChangeStatus;
                action("ReOpen")
                {
                    Caption = 'ReOpen';
                    ApplicationArea = All;
                    Image = ReOpen;
                    trigger OnAction()
                    begin
                        Rec.Validate("Shipment Status", Rec."Shipment Status"::Open);
                        Rec.Modify();
                    end;
                }
                action("GIT Confirmed")
                {
                    Caption = 'GIT Confirmed';
                    ApplicationArea = All;
                    Image = Change;
                    trigger OnAction()
                    begin
                        Rec.SetGITConfirmed();
                    end;
                }
                action("GRN Confirmed")
                {
                    Caption = 'GRN Confirmed';
                    ApplicationArea = All;
                    Image = Change;
                    trigger OnAction()
                    begin
                        Rec.SetGRNConfirmed();
                    end;
                }
                action("Landed Cost Completed")
                {
                    Caption = 'Landed Cost Completed';
                    ApplicationArea = All;
                    Image = Change;
                    trigger OnAction()
                    begin
                        Rec.SetLandedCostCompleted();
                    end;
                }

            }
        }
    }
}


