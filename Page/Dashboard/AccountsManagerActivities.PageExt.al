pageextension 52186 "AME Account Mgr. Activities" extends "Account Manager Activities"
{
    layout
    {
        // Add changes to page layout here
        addlast(Payments)
        {
            field("Vendors - Payment on Hold"; Rec."Vendors - Payment on Hold")
            {
                ApplicationArea = All;
                DrillDownPageId = "Vendor List";
            }
            field("AME Open Receipts"; Rec."AME Open Receipts")
            {
                Caption = 'Open Receipts';
                ApplicationArea = All;
                DrillDownPageId = "Customer Ledger Entries";
            }
            field("AME Open Payments"; Rec."AME Open Payments")
            {
                ApplicationArea = All;
                DrillDownPageId = "Vendor Ledger Entries";
                Caption = 'Open Payments';
            }

            field("Outstanding Vendor Invoices"; Rec."Outstanding Vendor Invoices")
            {
                ApplicationArea = All;
            }

            field("AME PDC Payble Total"; Rec."AME PDC Payble Total")
            {
                ApplicationArea = All;
                DrillDownPageId = "AME Gen Jnl Lines";
            }
            field("AME Overdue PDC Pay. Total"; Rec."AME Overdue PDC Pay. Total")
            {
                ApplicationArea = All;
                DrillDownPageId = "AME Gen Jnl Lines";
            }
            field("AME PDC Receivable Total"; Rec."AME PDC Receivable Total")
            {
                ApplicationArea = All;
                DrillDownPageId = "AME Gen Jnl Lines";
            }
            field("AME Overdue PDC Recv. Total"; Rec."AME Overdue PDC Recv. Total")
            {
                ApplicationArea = All;
                DrillDownPageId = "AME Gen Jnl Lines";
            }

        }
        addafter(Payments)
        {
            cuegroup(AMEPurcahse)
            {
                Caption = 'Purchase';
                field("Not Invoiced Purchase"; Rec."AME Not Invoiced Purchase")
                {
                    DrillDownPageID = "Purchase Order List";

                    trigger OnDrillDown()
                    var
                        PurchOrderList: page "Purchase Order List";
                        PurchHeader: Record "Purchase Header";
                    begin
                        PurchHeader.SetCurrentKey("Document Type", "No.");
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
                        PurchHeader.SetFilter("Amt. Rcd. Not Invoiced (LCY)", '>%1', 0);
                        if PurchHeader.FindFirst() then;

                        PurchOrderList.SetTableView(PurchHeader);
                        PurchOrderList.Run();
                    end;
                }
                field("Partially Invoiced Purchase"; Rec."AME Partially Invoiced Purchas")
                {
                    DrillDownPageID = "Purchase Order List";
                }
            }
            cuegroup("Purchase Invoice - Status")
            {
                field("AME Invoices-Open"; Rec."AME Invoices-Open")
                {
                    DrillDownPageId = "Purchase Invoices";
                }
                field("AME Invoices-Released"; Rec."AME Invoices-Released")
                {
                    DrillDownPageId = "Purchase Invoices";
                }
                field("Purchase Return Orders"; Rec."Purchase Return Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Return Order List";
                }
                field("Purchase Credit Memos - Open"; Rec."AME Purchase Cr. Memos - Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Credit Memos";
                }
                field("Purchase Cr. Memos - Released"; Rec."AME Purch Cr. Memos - Released")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Credit Memos";
                }
            }
            cuegroup(AMEReceivables)
            {
                Caption = 'Receivables';
                field("Sales Return Orders - All"; Rec."Sales Return Orders - All")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Return Order List";
                }
                field("Customers - Blocked"; Rec."Customers - Blocked")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                }
            }
            cuegroup(AME_TransferOrders)
            {
                Caption = 'Transfer Orders';

                field("AME Transfer Orders"; Rec."AME Transfer Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Transfer Orders";
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            group("AMEPending")
            {
                Caption = 'Pending Journal';

                action("Pending Journal Lines")
                {
                    Caption = 'Pending Journal Lines';
                    ApplicationArea = All;
                    Image = Journal;
                    RunObject = page "AME Gen Jnl Lines";
                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

        Rec.SetFilter("AME PDC Rcv Template Filter", 'CASH RECE');
        Rec.SetFilter("AME PDC Rcv. Batch Filter", 'PDC');

        Rec.SetFilter("AME PDCPayble Template Fltr", 'PAYMENTS');
        Rec.SetFilter("AME PDC Payble Batch Filter", 'PDC');

        Rec.SetFilter("AME Overdue PDC DateFilter", '..%1', Today);
    end;
}