pageextension 52185 "AME Accountant Activities" extends "Accountant Activities"
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
            field("Purchase Return Orders"; Rec."Purchase Return Orders")
            {
                ApplicationArea = All;
                DrillDownPageId = "Purchase Return Order List";
            }
            field("Outstanding Vendor Invoices"; Rec."Outstanding Vendor Invoices")
            {
                ApplicationArea = All;
            }
            field("AME Open Payments"; Rec."AME Open Payments")
            {
                ApplicationArea = All;
                DrillDownPageId = "Vendor Ledger Entries";
                Caption = 'Open Payments';
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
        }
        addafter(Payments)
        {
            cuegroup(AMEReceivables)
            {
                Caption = 'Receivables';
                field("Overdue Sales Documents"; Rec."Overdue Sales Documents")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";

                }
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
                field("AME Open Receipts"; Rec."AME Open Receipts")
                {
                    Caption = 'Open Receipts';
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
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
            cuegroup(AMEOngoingPurchase)
            {
                Caption = 'Ongoing Purchase';
                field("Purchase Orders"; Rec."AME Purchase Orders")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("Purchase Orders - Open"; Rec."AME Purchase Orders - Open")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("PO Pending Approval"; Rec."POs Pending Approval")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("Approved Purchase Orders"; Rec."Approved Purchase Orders")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("Not Invoiced Purchase"; Rec."AME Not Invoiced Purchase")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("Partially Invoiced Purchase"; Rec."AME Partially Invoiced Purchas")
                {
                    DrillDownPageId = "Purchase Order List";
                }
                field("AME Expected By Rcpt Date"; Rec."AME Expected By Rcpt Date")
                {
                    Caption = 'Items Rcpt. Expected 15 Days';
                    ApplicationArea = All;
                    DrillDownPageId = "AME Purchase Lines";
                }
            }
            cuegroup(AMEPurchase)
            {
                Caption = 'Purchase';
                field("Purchase Invocies"; Rec."AME Purchase Invocies")
                {
                    Caption = 'Ongoing Purchase';
                    DrillDownPageId = "Purchase Invoices";
                }
                field("AME Invoices-Open"; Rec."AME Invoices-Open")
                {
                    DrillDownPageId = "Purchase Invoices";
                }
                field("AME Invoices-Released"; Rec."AME Invoices-Released")
                {
                    DrillDownPageId = "Purchase Invoices";
                }
                field("Purchase Credit Memos - Open"; Rec."AME Purchase Cr. Memos - Open")
                {
                    AccessByPermission = TableData "Purch. Cr. Memo Hdr." = R;
                    DrillDownPageID = "Purchase Credit Memos";
                }
                field("Purchase Cr. Memos - Released"; Rec."AME Purch Cr. Memos - Released")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Credit Memos";
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
    }



    var
        UserSetup: Record "User Setup";

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

        Rec.SetFilter("AME PDC Rcv Template Filter", 'CASH RECE');
        Rec.SetFilter("AME PDC Rcv. Batch Filter", 'PDC');

        Rec.SetFilter("AME PDCPayble Template Fltr", 'PAYMENTS');
        Rec.SetFilter("AME PDC Payble Batch Filter", 'PDC');

        Rec.SetFilter("AME Overdue PDC DateFilter", '..%1', Today);

        Rec.SetFilter("AME Exp. Rcpt Date Filter", '<%1', CalcDate('+15D', Today));

        if UserSetup.Get(UserId) then begin

        end;
    end;
}