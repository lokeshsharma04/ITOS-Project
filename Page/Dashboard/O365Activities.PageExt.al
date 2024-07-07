pageextension 52193 "AME O365 Activities" extends "O365 Activities"
{
    layout
    {
        // Add changes to page layout here
        addafter("Purchase Orders")
        {
            field("Purchase Orders - Open"; Rec."Purchase Orders - Open")
            {
                DrillDownPageID = "Purchase Order List";
            }
            field("Purchase Orders - Released"; Rec."Purchase Orders - Released")
            {
                DrillDownPageID = "Purchase Order List";
            }
            field("PurchaseOrder Pending Approval"; Rec."PurchaseOrder Pending Approval")
            {
                DrillDownPageID = "Purchase Order List";
            }
            field("Not Invoiced Purchase"; Rec."Not Invoiced Purchase")
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
            field("Partially Invoiced Purchase"; Rec."Partially Invoiced Purchase")
            {
                DrillDownPageID = "Purchase Order List";
            }
        }
        addlast("Ongoing Purchases")
        {
            field("AME PostedPurchInvAttachReq"; Rec."AME PostedPurchInvAttachReq")
            {
                ApplicationArea = All;
            }
        }

        addafter("Ongoing Purchases")
        {
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
            }
            cuegroup("Purchase Orders Returns- Status")
            {
                Caption = 'Purchase Orders Returns- Status';
                field("Purchase Return Orders - Open"; Rec."Purchase Return Orders - Open")
                {
                    DrillDownPageID = "Purchase Return Order List";
                }
                field("Purchase Credit Memos - Open"; Rec."Purchase Credit Memos - Open")
                {
                    AccessByPermission = TableData "Purch. Cr. Memo Hdr." = R;
                    DrillDownPageID = "Purchase Credit Memos";
                }
                field("Purchase Cr. Memos - Released"; Rec."Purchase Cr. Memos - Released")
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

        addlast("Ongoing Sales")
        {
            field("AME PostedSalesInvAttachReq"; Rec."AME PostedSalesInvAttachReq")
            {
                ApplicationArea = All;
            }
        }

        addlast(Payments)
        {
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

        addlast(Control54)
        {
            field("AME Expected By Rcpt Date"; Rec."AME Expected By Rcpt Date")
            {
                Caption = 'Items Rcpt. Expected 15 Days';
                ApplicationArea = All;
                DrillDownPageId = "AME Purchase Lines";
            }
        }

        modify("Incoming Documents")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        Appsetup: Record "ATOS App Setup";
        UserSetup: Record "User Setup";
        ShowTransShipAndReceive: Boolean;
        PhysicalInventoryCount: Decimal;

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