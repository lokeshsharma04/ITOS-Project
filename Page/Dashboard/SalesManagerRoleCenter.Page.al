page 52189 "AME Sales Mgr. Role Center"
{
    Caption = 'Sales Manager', Comment = '{Dependency=Match,"ProfileDescription_SALESMANAGER"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(SalesmanagerActivities; "AME Sales Mgr. Activities")
                {
                    ApplicationArea = RelationshipMgmt;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = RelationshipMgmt;
                    Visible = false;
                }
            }
            group(Control1900724708)
            {
                ShowCaption = false;
                part(Control11; "Sales Performance")
                {
                    ApplicationArea = RelationshipMgmt;
                }
                // part(Control4; "Trailing Sales Orders Chart")
                // {
                //     ApplicationArea = RelationshipMgmt;
                // }
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
                part(Control6; "Report Inbox Part")
                {
                    ApplicationArea = RelationshipMgmt;
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
                ApplicationArea = RelationshipMgmt;
                Caption = 'Customer - &Top 10 List';
                Image = "Report";
                RunObject = Report "Customer - Top 10 List";
                ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
            }
            separator(Action17)
            {
            }
            action("S&ales Statistics")
            {
                ApplicationArea = Suite;
                Caption = 'S&ales Statistics';
                Image = "Report";
                RunObject = Report "Sales Statistics";
                ToolTip = 'View detailed information about sales to your customers.';
            }
            action("Salesperson - Sales &Statistics")
            {
                ApplicationArea = Suite;
                Caption = 'Salesperson - Sales &Statistics';
                Image = "Report";
                RunObject = Report "Salesperson - Sales Statistics";
                ToolTip = 'View amounts for sales, profit, invoice discount, and payment discount, as well as profit percentage, for each salesperson for a selected period. The report also shows the adjusted profit and adjusted profit percentage, which reflect any changes to the original costs of the items in the sales.';
            }
            action("Salesperson - &Commission")
            {
                ApplicationArea = Suite;
                Caption = 'Salesperson - &Commission';
                Image = "Report";
                RunObject = Report "Salesperson - Commission";
                ToolTip = 'View a list of invoices for each salesperson for a selected period. The following information is shown for each invoice: Customer number, sales amount, profit amount, and the commission on sales amount and profit amount. The report also shows the adjusted profit and the adjusted profit commission, which are the profit figures that reflect any changes to the original costs of the goods sold.';
            }
            separator(Action22)
            {
            }
            action("Campaign - &Details")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Campaign - &Details';
                Image = "Report";
                RunObject = Report "Campaign - Details";
                ToolTip = 'Show detailed information about the campaign.';
            }
            separator(Action23)
            {
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
        }
        area(embedding)
        {
            action("Sales Analysis Reports")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Analysis Reports';
                RunObject = Page "Analysis Report Sale";
                ToolTip = 'Analyze the dynamics of your sales according to key sales performance indicators that you select, for example, sales turnover in both amounts and quantities, contribution margin, or progress of actual sales against the budget. You can also use the report to analyze your average sales prices and evaluate the sales performance of your sales force.';
            }
            action("Sales Analysis by Dimensions")
            {
                ApplicationArea = Dimensions;
                Caption = 'Sales Analysis by Dimensions';
                RunObject = Page "Analysis View List Sales";
                ToolTip = 'View sales amounts in G/L accounts by their dimension values and other filters that you define in an analysis view and then show in a matrix window.';
            }
            action("Sales Budgets")
            {
                ApplicationArea = SalesBudget;
                Caption = 'Sales Budgets';
                RunObject = Page "Budget Names Sales";
                ToolTip = 'Enter item sales values of type amount, quantity, or cost for expected item sales in different time periods. You can create sales budgets by items, customers, customer groups, or other dimensions in your business. The resulting sales budgets can be reviewed here or they can be used in comparisons with actual sales data in sales analysis reports.';
            }
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
                RunPageView = where("Inventory" = filter(> 0));
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(WarehouseShipment)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Warehouse Shipment';
                Image = Shipment;
                RunObject = Page "Warehouse Shipment List";
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
            action(Campaigns)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Campaigns';
                Image = Campaign;
                RunObject = Page "Campaign List";
                ToolTip = 'View a list of all your campaigns.';
            }
            action(Segments)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Segments';
                Image = Segment;
                RunObject = Page "Segment List";
                ToolTip = 'Create a new segment where you manage interactions with a contact.';
            }
            action(Tasks)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Tasks';
                Image = TaskList;
                RunObject = Page "Task List";
                ToolTip = 'View the list of marketing tasks that exist.';
            }
            action(Teams)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Teams';
                Image = TeamSales;
                RunObject = Page Teams;
                ToolTip = 'View the list of marketing teams that exist.';
            }
            action(TransferOrders)
            {
                ApplicationArea = Warehouse;
                Caption = 'Transfer Orders';
                Image = Document;
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
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
                action(Action54)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action(Action86)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Opens the list of posted purchase credit memos.';
                }
                action(Action87)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Opens the list of posted purchase return shipments.';
                }
                action(Action53)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
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

            group("Administration Sales/Purchase")
            {
                Caption = 'Administration Sales/Purchase';
                Image = AdministrationSalesPurchases;
                action("Salespeople/Purchasers")
                {
                    ApplicationArea = Suite;
                    Caption = 'Salespeople/Purchasers';
                    RunObject = Page "Salespersons/Purchasers";
                    ToolTip = 'View a list of your sales people and your purchasers.';
                }
                action("Cust. Invoice Discounts")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Cust. Invoice Discounts';
                    RunObject = Page "Cust. Invoice Discounts";
                    ToolTip = 'View or edit invoice discounts that you grant to certain customers.';
                }
                action("Vend. Invoice Discounts")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Vend. Invoice Discounts';
                    RunObject = Page "Vend. Invoice Discounts";
                    ToolTip = 'View the invoice discounts that your vendors grant you.';
                }
                action("Item Disc. Groups")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Item Disc. Groups';
                    RunObject = Page "Item Disc. Groups";
                    ToolTip = 'View or edit discount group codes that you can use as criteria when you grant special discounts to customers.';
                }
            }
        }
        area(processing)
        {

            separator(Action48)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            separator(Action2)
            {
            }
        }
    }
}

