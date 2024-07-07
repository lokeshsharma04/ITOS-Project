page 52110 "AME Sales Mgr. Activities Supp"
{
    Caption = 'Supply Chain Activities';
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
                // field("Month Sales"; Rec."AME Month Sales")
                // {
                //     AccessByPermission = TableData "Sales Header" = R;
                //     ApplicationArea = Basic, Suite;
                //     DrillDownPageID = "Customer Ledger Entries";
                //     ToolTip = 'Specifies the number of sales quotes that are not yet converted to invoices or orders.';
                // }
                // field("AME Open Receipts"; Rec."AME Open Receipts")
                // {
                //     Caption = 'Open Receipts';
                //     ApplicationArea = All;
                //     DrillDownPageId = "Customer Ledger Entries";
                // }
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
            cuegroup("Blanket Sales Order - Status")
            {
                Caption = 'Blanket Sales Order - Status';

                field("AME Blanket SO-Open"; Rec."AME Blanket SO-Open")
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    DrillDownPageId = "Blanket Sales Orders";
                    ToolTip = 'Specifies the value of the Blanket Sales Order - Open field.';
                }
                field("AME Blanket SO-Released"; Rec."AME Blanket SO-Released")
                {
                    ApplicationArea = All;
                    Caption = 'Released';
                    DrillDownPageId = "Blanket Sales Orders";
                    ToolTip = 'Specifies the value of the Blanket Sales Order - Released field.';
                }
            }
            cuegroup("Sales Return Order - Status")
            {
                Caption = 'Sales Return Order - Status';
                field("AME Sales Return Order-Open"; Rec."AME Sales Return Order-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Return Order List";
                    ToolTip = 'Specifies the value of the Sales Return Orders - Open field.';
                }
                field("AME Sales Return Order-Pend. App"; Rec."AME Sales Return Order-PendApp")
                {
                    DrillDownPageId = "Sales Return Order List";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Return Orders - Pending Approval field.';
                }
                field("AME Sales Return Order-Relea."; Rec."AME Sales Return Order-Relea.")
                {
                    DrillDownPageId = "Sales Return Order List";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Return Orders - Released field.';
                }
            }
            cuegroup("Sales Orders - Status")
            {
                Caption = 'Sales Orders - Status';

                field("Sales Orders - Open"; Rec."Sales Orders - Open")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Orders - Draft';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that are not fully posted.';
                }

                // field("Sales Orders -Pending Approval"; Rec."AME Sales Orders-PndgApprvl")
                // {
                //     Caption = 'Sales Orders -Pending Approval';
                //     DrillDownPageID = "Sales Order List";
                // }
                // field("Sales Orders - Released"; Rec."AME Sales Orders - Released")
                // {
                //     Caption = 'Sales Orders - Ready to Pick';
                //     DrillDownPageID = "Sales Order List";
                // }
                field("AME SOStatus - Open"; Rec."AME SOStatus - Open")
                {
                    Caption = 'Sales Order - Open';
                    DrillDownPageId = "Sales Order List";
                }
                field("AME SOStatus - OnHold"; Rec."AME SOStatus - OnHold")
                {
                    DrillDownPageId = "Sales Order List";
                }

                field("AME SOStatus - Canceled"; Rec."AME SOStatus - Canceled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Order - Canceled field.';
                    DrillDownPageId = "Sales Order List";

                }
                field("AME SOStatus - Confirmed"; Rec."AME SOStatus - Confirmed")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                    ToolTip = 'Specifies the value of the Sales Order - Confirmed field.';
                }
                // field(PartiallyShipped; Rec."Partially Shipped")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Partially Delivered';
                //     DrillDownPageID = "Sales Order List";
                //     ToolTip = 'Specifies the number of sales documents that are partially shipped.';

                //     trigger OnDrillDown()
                //     begin
                //         Rec.ShowOrders(Rec.FieldNo(Rec."Partially Shipped"));
                //     end;
                // }
                field(NotInvoiced; Rec."AME Not Invoiced")
                {
                    ApplicationArea = Advanced;
                    Caption = 'Shipped, Not Invoiced';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies received orders that are not invoiced. The orders are displayed in the Sales Cue on the Purchasing Agent role center, and filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo(Rec."AME Not Invoiced"));
                    end;
                }
                // field(PartiallyInvoiced; Rec."AME Partially Invoiced")
                // {
                //     ApplicationArea = Advanced;
                //     Caption = 'Partially Invoiced';
                //     DrillDownPageID = "Sales Order List";
                //     ToolTip = 'Specifies the number of partially invoiced orders that are displayed in the Sales Cue on the Role Center. The documents are filtered by today''s date.';

                //     trigger OnDrillDown()
                //     begin
                //         Rec.ShowOrders(Rec.FieldNo(Rec."AME Partially Invoiced"));
                //     end;
                // }
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
            }
            // cuegroup("Purchase Order - Status")
            // {
            //     Caption = 'Purchase Order - Status';

            //     field("AME Purchase Orders - Open"; Rec."AME Purchase Orders - Open")
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Request to Approve';
            //         DrillDownPageId = "Purchase Order List";
            //         ToolTip = 'Specifies the value of the Purchase Orders - Open field.';
            //     }

            //     field("AME Purch.Order Pndg Apprvl"; Rec."AME Purch.Order Pndg Apprvl")
            //     {
            //         ApplicationArea = All;
            //         DrillDownPageId = "Purchase Order List";
            //         Caption = 'Pending for Approval';
            //         ToolTip = 'Specifies the value of the Purchase Order - Pending Approval field.';
            //     }
            // }
            cuegroup("Purchase Return Order")
            {
                Caption = 'Purchase Return Order - Status';

                field("AME Purch. Ret. Orders-Open"; Rec."AME Purch. Ret. Orders-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Return Order List";
                    ToolTip = 'Specifies the value of the Purchase Return Orders - Open field.';
                }
                field("AME Purch. Ret. Orders-PendApp"; Rec."AME Purch. Ret. Orders-PendApp")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Return Order List";
                    ToolTip = 'Specifies the value of the Pending Approval field.';
                }
                field("AME Purch. Ret. Orders-Releas."; Rec."AME Purch. Ret. Orders-Releas.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Return Order List";
                    ToolTip = 'Specifies the value of the Released field.';
                }
            }

            cuegroup("Warehouse Pick - Status")
            {
                Caption = 'Warehouse Pick - Status';

                field("AME Whse Ship. Pick-Open"; Rec."AME Whse Ship. Pick-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Shipment List";
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field("AME Whse Ship. Partial-Picked"; Rec."AME Whse Ship. Partial-Picked")
                {
                    DrillDownPageId = "Warehouse Shipment List";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Partially Picked field.';
                }
                field("AME Whse Ship. Complete-Picked"; Rec."AME Whse Ship. Complete-Picked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Completely Picked field.';
                    DrillDownPageId = "Warehouse Shipment List";
                }
            }
            cuegroup("Warehouse Shipment")
            {
                Caption = 'Warehouse Shipment - Status';

                field("AME Warehouse Shipment - Open"; Rec."AME Warehouse Shipment - Open")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Warehouse Shipment List";
                    ToolTip = 'Specifies the value of the Open Shipment field.';
                }
                field("AME Warehouse Shipment-Releas."; Rec."AME Warehouse Shipment-Releas.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Shipment List";
                    ToolTip = 'Specifies the value of the Open Released field.';
                }
            }
            cuegroup("Warehouse Receipt Shipment - Status")
            {
                Caption = 'Warehouse Receipt Shipment - Status';

                field("AME Whse. Ship. Status-Open"; Rec."AME Whse. Ship. Status-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Receipts";
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field("AME Whse. Ship Status-GIT Conf"; Rec."AME Whse. Ship Status-GIT Conf")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Receipts";
                    ToolTip = 'Specifies the value of the GIT Confirmed field.';
                }
                field("AME Whse. Ship Status-GRN Conf"; Rec."AME Whse. Ship Status-GRN Conf")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Receipts";
                    ToolTip = 'Specifies the value of the GRN Confirmed field.';
                }
                field("AME Whse. Ship Status-LCP"; Rec."AME Whse. Ship Status-LCP")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Warehouse Receipts";
                    ToolTip = 'Specifies the value of the Landed Cost Completed field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
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
                Image = NewOrder;
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services that require partial posting.';
            }
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
        LocationRec: Record Location;
        AdjBinFilter: Text;
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        //set filter for customer reconcilation
        // Rec.SetFilter("AME Recon. Date Filter", '<=%1', CalcDate('-180D', Today));

        Rec.SetFilter("User ID Filter", UserId);

        //For displaying current month sales and collection
        Rec.SetFilter("Date Filter", '%1..%2', CalcDate('-CM', Today), CalcDate('CM', Today));

        if UserSetup.Get(UserId) then begin
        end;

        LocationRec.Reset();
        LocationRec.SetFilter("Adjustment Bin Code", '<>%1', '');
        if LocationRec.FindFirst() then
            repeat
                if (StrPos(AdjBinFilter, LocationRec."Adjustment Bin Code") = 0) then begin
                    if AdjBinFilter <> '' then
                        AdjBinFilter += '|';

                    AdjBinFilter += LocationRec."Adjustment Bin Code";
                end;
            until LocationRec.Next() = 0;

        if AdjBinFilter <> '' then
            Rec.SetFilter("AME Adj. Bin Filter", AdjBinFilter);
    end;

    var
        ShowTransShipAndReceive: Boolean;
        AppSetup: Record "ATOS App Setup";

}