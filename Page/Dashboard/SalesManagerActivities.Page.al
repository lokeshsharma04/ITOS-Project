page 52122 "AME Sales Mgr. Activities"
{
    Caption = 'Sales Manager Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Sales and Collection")
            {
                Caption = 'Sales and Collection';
                field("AME Request to Approve"; Rec."AME Request to Approve")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Requests to Approve";
                }
                field("Month Sales"; Rec."AME Month Sales")
                {
                    AccessByPermission = TableData "Sales Header" = R;
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer Ledger Entries";
                    ToolTip = 'Specifies the number of sales quotes that are not yet converted to invoices or orders.';
                }
                field("AME Open Receipts"; Rec."AME Open Receipts")
                {
                    Caption = 'Open Receipts';
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
                }
                field("AME Qty in Adjustment"; Rec."AME Qty in Adjustment")
                {
                    ApplicationArea = All;
                    DrillDown = false;
                }
                actions
                {
                    action("New Sales Quote")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Quote';
                        Image = NewSalesQuote;
                        RunObject = Page "Sales Quote";
                        RunPageMode = Create;
                        ToolTip = 'Offer items or services to a customer.';
                    }
                    action("New Sales Order")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Order';
                        RunObject = Page "Sales Order";
                        RunPageMode = Create;
                        ToolTip = 'Create a new sales order for items or services that require partial posting.';
                    }
                }
            }
            cuegroup("Sales Orders - Status")
            {
                Caption = 'Sales Orders - Status';

                field("Sales Orders - Open"; Rec."Sales Orders - Open")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Orders - Open';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that are not fully posted.';
                }
                field("Sales Orders -Pending Approval"; Rec."AME Sales Orders-PndgApprvl")
                {
                    Caption = 'Sales Orders -Pending Approval';
                    DrillDownPageID = "Sales Order List";
                }
                field("Sales Orders - Released"; Rec."AME Sales Orders - Released")
                {
                    Caption = 'Sales Orders - Ready to Pick';
                    DrillDownPageID = "Sales Order List";
                }
                field(PartiallyShipped; Rec."Partially Shipped")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Partially Delivered';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales documents that are partially shipped.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo(Rec."Partially Shipped"));
                    end;
                }
                field(NotInvoiced; Rec."AME Not Invoiced")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Shipped, Not Invoiced';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies received orders that are not invoiced. The orders are displayed in the Purchase Cue on the Purchasing Agent role center, and filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo(Rec."AME Not Invoiced"));
                    end;
                }
                field(PartiallyInvoiced; Rec."AME Partially Invoiced")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Partially Invoiced';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of partially invoiced orders that are displayed in the Purchase Cue on the Role Center. The documents are filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo(Rec."AME Partially Invoiced"));
                    end;
                }
                field(DelayedOrders; Rec.Delayed)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Delayed';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales documents where your delivery is delayed.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo(Delayed));
                    end;
                }
                field("Average Days Delayed"; Rec."Average Days Delayed")
                {
                    ApplicationArea = Basic, Suite;
                    DecimalPlaces = 0 : 1;
                    Image = Calendar;
                    ToolTip = 'Specifies the number of days that your order deliveries are delayed on average.';
                }


                actions
                {
                    action(Action42)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Quote';
                        Image = NewSalesQuote;
                        RunObject = Page "Sales Quote";
                        RunPageMode = Create;
                        ToolTip = 'Offer items or services to a customer.';
                    }
                    action(Action43)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Order';
                        RunObject = Page "Sales Order";
                        RunPageMode = Create;
                        ToolTip = 'Create a new sales order for items or services that require partial posting.';
                    }
                }
            }
            cuegroup("Sales Orders Returns- Status")
            {
                Caption = 'Sales Orders Returns- Status';
                field("Sales Return Orders - Open"; Rec."Sales Return Orders - Open")
                {
                    ApplicationArea = Advanced;
                    DrillDownPageID = "Sales Return Order List";
                    ToolTip = 'Specifies the number of sales return orders documents that are displayed in the Sales Cue on the Role Center. The documents are filtered by today''s date.';
                }
                field("Sales Credit Memos - Open"; Rec."Sales Credit Memos - Open")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Sales Credit Memos";
                    ToolTip = 'Specifies the number of sales credit memos that are not yet posted.';
                }

                actions
                {
                    action("New Sales Return Order")
                    {
                        ApplicationArea = Advanced;
                        Caption = 'New Sales Return Order';
                        RunObject = Page "Sales Return Order";
                        RunPageMode = Create;
                        ToolTip = 'Process a return or refund that requires inventory handling by creating a new sales return order.';
                    }
                    action("New Sales Credit Memo")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Credit Memo';
                        RunObject = Page "Sales Credit Memo";
                        RunPageMode = Create;
                        ToolTip = 'Process a return or refund by creating a new sales credit memo.';
                    }
                }
            }


            cuegroup("Transfers")
            {
                field("AME Transfer Orders"; Rec."AME Transfer Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Transfer Orders";
                }
            }
            cuegroup("Customers")
            {
                field("AME Cust. Recon. Due"; Rec."AME Cust. Recon. Due")
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {

        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        GenJnlLine: Record "Gen. Journal Line";
        JournalTemplates: Record "Gen. Journal Template";
        JournalBatchTempaltes: Record "Gen. Journal Batch";
        TemplateFilter: Text;
        BatchFilter: Text;
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        //set filter for customer reconcilation
        Rec.SetFilter("AME Recon. Date Filter", '<=%1', CalcDate('-180D', Today));

        Rec.SetFilter("User ID Filter", UserId);

        //For displaying current month sales and collection
        Rec.SetFilter("Date Filter", '%1..%2', CalcDate('-CM', Today), CalcDate('CM', Today));

        if UserSetup.Get(UserId) then begin
        end;
    end;

    var
        ShowTransShipAndReceive: Boolean;
        AppSetup: Record "ATOS App Setup";

}