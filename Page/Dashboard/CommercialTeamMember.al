page 52105 "AME Commercial -  Team Member"
{
    ApplicationArea = All;
    Caption = 'Commercial -  Team Member';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            group(Activities)
            {
                ShowCaption = true;
                Caption = 'Activities';
                part("AMECommercialActivities"; "AME Commercial Activities") { }
                part(Approvals; "Approvals Activities")
                {

                }
            }
        }
    }
    actions

    {
        area(Embedding)
        {
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                // RunPageView = where("AME Purch. Order Type" = const("AME Purch. Order Type"::Expense));
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(Action32)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Purchase Invoices';
                Image = PostedOrder;
                RunObject = Page "Posted Purchase Invoices";
                RunPageView = where("AME Purch. Order Type" = const("AME Purch. Order Type"::Expense));
                ToolTip = 'Open the list of posted Purchase invoices.';
            }
            action(Vendors)
            {
                ApplicationArea = All;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the Vendors that you deal with. From each Vendor card, you can open related information, such as Purchase statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Customers)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the Vendors that you deal with. From each Vendor card, you can open related information, such as Purchase statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            // action("Purchase Price List")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Purchase Price List';
            //     Image = Item;
            //     RunObject = Page "Item List";
            //     ToolTip = 'Open the list of Purchase Price List.';
            // }
            action("Sales Price List")
            {
                ApplicationArea = All;
                Caption = 'Sales Price List';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'Open the list of Sales Price List.';
            }
            action("Approval Entries")
            {
                ApplicationArea = All;
                Caption = 'Approval Entries';
                Image = Approvals;
                RunObject = Page "Approval Entries";
                ToolTip = 'Open the list of Approval Entries.';
            }
        }
        area(Reporting)
        {
            action(ItemExpiry)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Expiration - Quantity';
                RunObject = report "Item Expiration - Quantity";
            }
            action(LPOPOTracker)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'LPO Tracker Report';
                RunObject = report "AME LPO Tracker Report";
            }
            action(PostedInvTracker)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Invoice Tracker';
                RunObject = report "AME Posted Purch. Tracker Rep";
            }
            action(PostedANPExpeenses)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted ANP Expenses';
                RunObject = report "AME Posted ANP Expenses Report";
            }
            action(InventorySalesBackOrders)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory Sales Backorder';
                RunObject = report "Inventory - Sales Back Orders";
                Visible = false;
            }

        }
    }

}
