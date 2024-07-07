page 52119 "AME SalesPerson Role Center"
{
    Caption = 'Sales Person', Comment = '{Dependency=Match,"ProfileDescription_SALESPERSON"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(salesperson; "AME Salesperson Activities")
                {
                    ApplicationArea = All;
                }

            }
            group(Control1900724708)
            {
                ShowCaption = false;
                part(Control1; "My Job Queue")
                {
                    ApplicationArea = RelationshipMgmt;
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = RelationshipMgmt;
                    Visible = false;
                }
                systempart(Control31; MyNotes)
                {
                    ApplicationArea = RelationshipMgmt;
                }
                group("My User Tasks")
                {
                    Caption = 'My User Tasks';
                    part("User Tasks"; "User Tasks Activities")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'User Tasks';
                    }
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Customer - &Order Summary")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Customer - &Order Summary';
                Image = "Report";
                RunObject = Report "Customer - Order Summary";
                ToolTip = 'View the quantity not yet shipped for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
            }
            action("Customer - &Top 10 List")
            {
                Visible = false;
                ApplicationArea = RelationshipMgmt;
                Caption = 'Customer - &Top 10 List';
                Image = "Report";
                RunObject = Report "Customer - Top 10 List";
                ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
            }
            action(CustAgingSummary)
            {
                Image = Report2;
                CaptionML = ENU = 'Customer Aging - Summary';
                Visible = true;
                RunObject = report "Atos Customer Aging - Summary";
            }

            action(CustAgingDetail)
            {
                Image = Report2;
                CaptionML = ENU = 'Customer Aging - Detail';
                Visible = true;
                RunObject = report "Atos Customer Aging - Detailed";
            }
            separator(Action22)
            {
            }
        }
        area(embedding)
        {
            action("Sales Quotes")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Quotes';
                Image = Quote;
                RunObject = Page "Sales Quotes";
                ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            }
            action(SalesOrders)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action(SalesOrdersOpen)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Open';
                Image = Edit;
                RunObject = Page "Sales Order List";
                RunPageView = WHERE(Status = FILTER(Open));
                ShortCutKey = 'Return';
                ToolTip = 'Open the card for the selected record.';
            }
            action("Sales Orders - Microsoft Dynamics 365 for Sales")
            {
                Visible = false;
                ApplicationArea = Suite;
                Caption = 'Sales Orders - Microsoft Dynamics 365 for Sales';
                RunObject = Page "CRM Sales Order List";
                RunPageView = WHERE(StateCode = FILTER(Submitted),
                                    LastBackofficeSubmit = FILTER(0D));
                ToolTip = 'View sales orders in Dynamics 365 for Sales that are coupled with sales orders in Business Central.';
            }
            action(SalesInvoices)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
                ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
            }
            action(SalesInvoicesOpen)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Open';
                Image = Edit;
                RunObject = Page "Sales Invoice List";
                RunPageView = WHERE(Status = FILTER(Open));
                ShortCutKey = 'Return';
                ToolTip = 'Open the card for the selected record.';
            }
            action(SalesReturnOrders)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Return Orders';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order List";
            }
            action(SalesReturnOrdersOpen)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Return Orders';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order List";
                RunPageView = where(Status = filter(Open));
            }
            action(SalesCreditMemos)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Credit Memos';
                Image = CreditMemo;
                RunObject = page "Sales Credit Memos";
            }
            action(SalesCreditMemosOpen)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Credit Memos';
                Image = CreditMemo;
                RunObject = page "Sales Credit Memos";
                RunPageView = where(Status = filter(Open));
            }

            action(Items)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(StockList)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Stock List';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
                RunPageView = where(Inventory = filter(> 0));
            }
            action(Contacts)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page "Contact List";
                ToolTip = 'View a list of all your contacts.';
            }
            action(Customers)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(WhseShpt)
            {
                ApplicationArea = Warehouse;
                Caption = 'Warehouse Shipments';
                RunObject = Page "Warehouse Shipment List";
                ToolTip = 'View the list of ongoing warehouse shipments.';
            }
            action(WhseShptReleased)
            {
                ApplicationArea = Warehouse;
                Caption = 'Released';
                RunObject = Page "Warehouse Shipment List";
                RunPageView = SORTING("No.")
                              WHERE(Status = FILTER(Released));
                ToolTip = 'View the list of released source documents that are ready for warehouse activities.';
            }
            action(WhseShptPartShipped)
            {
                ApplicationArea = Warehouse;
                Caption = 'Partially Shipped';
                RunObject = Page "Warehouse Shipment List";
                RunPageView = WHERE("Document Status" = FILTER("Partially Shipped"));
                ToolTip = 'View the list of ongoing warehouse shipments that are partially completed.';
            }
            action(TransferOrders)
            {
                ApplicationArea = Warehouse;
                Caption = 'Transfer Orders';
                Image = Document;
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(AME_Action32)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Sales Invoices';
                Image = PostedOrder;
                RunObject = Page "Posted Sales Invoices";
                ToolTip = 'Open the list of posted sales invoices.';
            }
            action(AME_Action34)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Sales Credit Memos';
                Image = PostedOrder;
                RunObject = Page "Posted Sales Credit Memos";
                ToolTip = 'Open the list of posted sales credit memos.';
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action(Action32)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action(Action34)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted return receipts.';
                }
                action(Action40)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("Posted Whse Shipments")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Whse Shipments';
                    RunObject = Page "Posted Whse. Shipment List";
                    ToolTip = 'Open the list of posted warehouse shipments.';
                }
                action("Posted Transfer Shipments")
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Transfer Shipments';
                    RunObject = Page "Posted Transfer Shipments";
                    ToolTip = 'Open the list of posted transfer shipments.';
                }
                action("Posted Transfer Receipts")
                {
                    ApplicationArea = Location;
                    Caption = 'Posted Transfer Receipts';
                    RunObject = Page "Posted Transfer Receipts";
                    ToolTip = 'Open the list of posted transfer receipts.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Issued Reminders';
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'Opens the list of issued reminders.';
                }
                action("Issued Finance Charge Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Issued Finance Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'Opens the list of issued finance charge memos.';
                }
            }

        }
        area(processing)
        {

        }
    }
}

