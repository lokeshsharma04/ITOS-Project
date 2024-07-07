page 52103 "AME Supply Chain Management"
{
    Caption = 'Supply Chain Manager';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(SalesmanagerActivities; "AME Sales Mgr. Activities Supp")
            {
                ApplicationArea = All;
            }
            part(Approvals; "Approvals Activities")
            {
                ApplicationArea = All;
            }

            part(Control11; "Sales Performance")
            {
                ApplicationArea = All;
            }
            part(Control6; "Report Inbox Part")
            {
                ApplicationArea = All;
            }
            systempart(Control31; MyNotes)
            {
                ApplicationArea = All;
            }
            group("My User Tasks")
            {
                Caption = 'My User Tasks';
                part("User Tasks"; "User Tasks Activities")
                {
                    ApplicationArea = All;
                    Caption = 'User Tasks';
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
                ApplicationArea = All;
                Caption = 'Customer - &Order Summary';
                Image = "Report";
                RunObject = Report "Customer - Order Summary";
                ToolTip = 'View the quantity not yet shipped for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
            }
            action("Customer - &Top 10 List")
            {
                ApplicationArea = All;
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
                ApplicationArea = All;
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
            action(Customers)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Item Categories")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Categories';
                RunObject = Page "Item Categories";
            }
            action("Blanket Sales Orders")
            {
                ApplicationArea = All;
                Caption = 'Blanket Sales Orders';
                Image = Quote;
                RunObject = Page "Blanket Sales Orders";
                ToolTip = 'Use blanket sales orders as a framework for a long-term agreement between you and your customers to sell large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a sales order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
            }
            action(SalesOrders)
            {
                ApplicationArea = All;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }

            action("Purchase Return Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Return Orders';
                RunObject = Page "Purchase Return Order List";
                ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                RunPageView = where("AME Purch. Order Type" = filter(0));
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(WarehouseReceipt)
            {
                ApplicationArea = All;
                Caption = 'Warehouse Receipt';
                Image = Receipt;
                RunObject = Page "Warehouse Receipts";
            }
            action(WarehouseShipment)
            {
                ApplicationArea = All;
                Caption = 'Warehouse Shipments';
                Image = Shipment;
                RunObject = Page "Warehouse Shipment List";
            }
            action("Item Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                    Recurring = const(false));
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }
            action("Phys. Inventory Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Phys. Inventory Journal';
                RunObject = Page "Phys. Inventory Journal";
                // RunPageView = 
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
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
                action(Action40)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action(Action41)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Warehouse Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Whse. Shipment List";
                    ToolTip = 'Open the list of Posted Warehouse Shipment List.';
                }
                action(Action42)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Registered Pick';
                    Image = RegisterPick;
                    RunObject = Page "Registered Pick";
                    ToolTip = 'Open the list of Registered Pick.';
                }
                action(Action43)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Registered Put-Away';
                    Image = RegisterPutAway;
                    RunObject = Page "Registered Whse. Put-aways";
                    ToolTip = 'Open the list of Registered Warehouse Put-Aways';
                }
                action(Action44)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Ledger Entries';
                    Image = ItemLedger;
                    RunObject = Page "Item Ledger Entries";
                    ToolTip = 'Open the list of Item Ledger Entries';
                }
                action(Action45)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Register';
                    Image = ItemRegisters;
                    RunObject = Page "Item Registers";
                    ToolTip = 'Open the list of Item Registers';
                }
                action(Action87)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Return Order';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Opens the list of posted purchase return shipments.';
                }
                action(Action86)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Opens the list of posted purchase credit memos.';
                }
                action(Action89)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger Entries';
                    RunObject = Page "Customer Ledger Entries";
                    ToolTip = 'Opens the list of Customer Ledger Entries.';
                }
            }

            group("Administration Sales/Purchase")
            {
                Visible = false;
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
                    ApplicationArea = All;
                    Caption = 'Cust. Invoice Discounts';
                    RunObject = Page "Cust. Invoice Discounts";
                    ToolTip = 'View or edit invoice discounts that you grant to certain customers.';
                }
                action("Vend. Invoice Discounts")
                {
                    ApplicationArea = All;
                    Caption = 'Vend. Invoice Discounts';
                    RunObject = Page "Vend. Invoice Discounts";
                    ToolTip = 'View the invoice discounts that your vendors grant you.';
                }
                action("Item Disc. Groups")
                {
                    ApplicationArea = All;
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
        area(Creation)
        {
            action("&Customer")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Customer';
                Image = NewCustomer;
                RunObject = Page "Customer Card";
                RunPageMode = Create;
                ToolTip = 'Create a new Customer.';
            }
            action("Sales &Quote")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new sales quote to offer items or services to a customer.';
            }
        }
    }
}