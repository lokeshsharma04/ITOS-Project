page 52123 "AME Purch. Exec. RoleCenter"
{
    Caption = 'Procurement';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(AMEPurchExecActivities; "AME Purch. Exec. Activities")
            {
                ApplicationArea = All;
            }


        }
    }

    actions
    {
        area(reporting)
        {
            action("ItemWeight")
            {
                ApplicationArea = All;
                Caption = 'Item Weight';
                Image = Report2;
                RunObject = report "AME Item Weight Report";
            }
            action("ItemCOODisc")
            {
                ApplicationArea = All;
                Caption = 'COO - Discrepancy';
                Image = Report2;
                RunObject = report "Item CO -Discrepancy";
            }
            action("PurchasePlanning")
            {
                ApplicationArea = All;
                Caption = 'Purchase Planning';
                Image = Report2;
                RunObject = report "AME Purchase Planning";
            }
        }
        area(embedding)
        {
            action(Items)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Item Category List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Categories';
                RunObject = Page "AME Item Category List";
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                RunPageView = where("AME Purch. Order Type" = filter(0));
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Purchase Return Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Return Orders';
                RunObject = Page "Purchase Return Order List";
                ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
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
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
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
            action("&Item")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Item';
                Image = NewCustomer;
                RunObject = Page "Item Card";
                RunPageMode = Create;
                ToolTip = 'Create a new Item.';
            }
            action("Purchase &Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Order';
                Image = PurchaseInvoice;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase order.';
            }
        }

    }
}

