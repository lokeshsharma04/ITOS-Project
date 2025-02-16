page 52127 "AME Store Keeper Role"
{
    Caption = 'Store Keeper', Comment = '{Dependency=Match,"ProfileDescription_STOREKEEPER"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control49; "AME Store Keeper Activities")
            {
                ApplicationArea = Warehouse;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("M&ovement List")
            {
                ApplicationArea = Warehouse;
                Caption = 'M&ovement List';
                Image = "Report";
                RunObject = Report "Movement List";
                ToolTip = 'View the list of ongoing movements between bins.';
            }
            action("Whse. &Shipment Status")
            {
                ApplicationArea = Warehouse;
                Caption = 'Whse. &Shipment Status';
                Image = "Report";
                RunObject = Report "Whse. Shipment Status";
                ToolTip = 'View warehouse shipments by status.';
            }
            action("Warehouse &Bin List")
            {
                ApplicationArea = Warehouse;
                Caption = 'Warehouse &Bin List';
                Image = "Report";
                RunObject = Report "Warehouse Bin List";
                ToolTip = 'Get an overview of warehouse bins, their setup, and the quantity of items within the bins.';
            }
            action("Whse. &Adjustment Bin")
            {
                ApplicationArea = Warehouse;
                Caption = 'Whse. &Adjustment Bin';
                Image = "Report";
                RunObject = Report "Whse. Adjustment Bin";
                ToolTip = 'Adjust the quantity of an item in a particular bin or bins. For instance, you might find some items in a bin that are not registered in the system, or you might not be able to pick the quantity needed because there are fewer items in a bin than was calculated by the program. The bin is then updated to correspond to the actual quantity in the bin. In addition, it creates a balancing quantity in the adjustment bin, for synchronization with item ledger entries, which you can then post with an item journal.';
            }
            action("Warehouse Physical Inventory &List")
            {
                ApplicationArea = Warehouse;
                Caption = 'Warehouse Physical Inventory &List';
                Image = "Report";
                RunObject = Report "Whse. Phys. Inventory List";
                ToolTip = 'View or print the list of the lines that you have calculated in the Warehouse Physical Inventory Journal window. You can use this report during the physical inventory count to mark down actual quantities on hand in the warehouse and compare them to what is recorded in the program.';
            }
            action("P&hys. Inventory List")
            {
                ApplicationArea = Warehouse;
                Caption = 'P&hys. Inventory List';
                Image = "Report";
                RunObject = Report "Phys. Inventory List";
                ToolTip = 'View a list of the lines that you have calculated in the Phys. Inventory Journal window. You can use this report during the physical inventory count to mark down actual quantities on hand in the warehouse and compare them to what is recorded in the program.';
            }
            action("&Customer - Labels")
            {
                ApplicationArea = Warehouse;
                Caption = '&Customer - Labels';
                Image = "Report";
                RunObject = Report "Customer - Labels";
                ToolTip = 'View, save, or print mailing labels with the customers'' names and addresses. The report can be used to send sales letters, for example.';
            }
        }
        area(embedding)
        {
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
            action(WhseRcpt)
            {
                ApplicationArea = Warehouse;
                Caption = 'Warehouse Receipts';
                RunObject = Page "Warehouse Receipts";
                ToolTip = 'View the list of ongoing warehouse receipts.';
            }
            action(WhseRcptPartReceived)
            {
                ApplicationArea = Warehouse;
                Caption = 'Partially Received';
                RunObject = Page "Warehouse Receipts";
                RunPageView = WHERE("Document Status" = FILTER("Partially Received"));
                ToolTip = 'View the list of ongoing warehouse receipts that are partially completed.';
            }
            action(TransferOrders)
            {
                ApplicationArea = Warehouse;
                Caption = 'Transfer Orders';
                Image = Document;
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(PhysInvtOrders)
            {
                ApplicationArea = Warehouse;
                Caption = 'Physical Inventory Orders';
                RunObject = Page "Physical Inventory Orders";
                ToolTip = 'Plan to count inventory by calculating existing quantities and generating the recording documents.';
            }
            action(PhysInvtRecordings)
            {
                ApplicationArea = Warehouse;
                Caption = 'Physical Inventory Recordings';
                RunObject = Page "Phys. Inventory Recording List";
                ToolTip = 'Prepare to count inventory by creating a recording document to capture the quantities.';
            }
            action(ReleasedProductionOrders)
            {
                ApplicationArea = Manufacturing;
                Caption = 'Released Production Orders';
                RunObject = Page "Released Production Orders";
                ToolTip = 'View the list of released production order that are ready for warehouse activities.';
            }
            action(AssemblyOrders)
            {
                ApplicationArea = Assembly;
                Caption = 'Assembly Orders';
                RunObject = Page "Assembly Orders";
                ToolTip = 'View ongoing assembly orders.';
            }
            action(Movements)
            {
                ApplicationArea = Warehouse;
                Caption = 'Movements';
                RunObject = Page "Warehouse Movements";
                ToolTip = 'View the list of ongoing movements between bins according to an advanced warehouse configuration.';
            }
            action(MovementsUnassigned)
            {
                ApplicationArea = Warehouse;
                Caption = 'Unassigned';
                RunObject = Page "Warehouse Movements";
                RunPageView = WHERE("Assigned User ID" = FILTER(''));
                ToolTip = 'View all unassigned warehouse activities.';
            }
            action(BinContents)
            {
                ApplicationArea = Warehouse;
                Caption = 'Bin Contents';
                Image = BinContent;
                RunObject = Page "Bin Contents List";
                ToolTip = 'View items in the bin if the selected line contains a bin code.';
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
            //CP-14-11-2022-
            action(StockkeepingUnitList)
            {
                ApplicationArea = Warehouse;
                Caption = 'Stockkeeping Unit';
                RunObject = Page "Stockkeeping Unit List";
                ToolTip = 'View the list of ongoing Stockkeeping Unit List.';
            }
            //CP-14-11-2022+
        }
        area(sections)
        {
            group("Reference Data")
            {
                Caption = 'Reference Data';
                Image = ReferenceData;
                action(Items)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                    ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
                }
                action(Locations)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Locations';
                    Image = Warehouse;
                    RunObject = Page "Location List";
                    ToolTip = 'View the list of warehouse locations.';
                }
                action("Shipping Agent")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Shipping Agent';
                    RunObject = Page "Shipping Agents";
                    ToolTip = 'View the list of shipping companies that you use to transport goods.';
                }
            }
            group(Worksheet)
            {
                Caption = 'Worksheet';
                Image = Worksheets;
                action(MovementWorksheets)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Movement Worksheets';
                    RunObject = Page "Worksheet Names List";
                    RunPageView = WHERE("Template Type" = CONST(Movement));
                    ToolTip = 'Plan and initiate movements of items between bins according to an advanced warehouse configuration.';
                }
                action("Internal Put-aways")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Internal Put-aways';
                    RunObject = Page "Whse. Internal Put-away List";
                    ToolTip = 'View the list of ongoing put-aways for internal activities, such as production.';
                }
                action("Internal Picks")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Internal Picks';
                    RunObject = Page "Whse. Internal Pick List";
                    ToolTip = 'View the list of ongoing picks for internal activities, such as production.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
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

                action("Posted Whse Shipments")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Whse Shipments';
                    RunObject = Page "Posted Whse. Shipment List";
                    ToolTip = 'Open the list of posted warehouse shipments.';
                }
                action("Posted Sales Shipment")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Sales Shipment';
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("Posted Transfer Shipments")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Transfer Shipments';
                    RunObject = Page "Posted Transfer Shipments";
                    ToolTip = 'Open the list of posted transfer shipments.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted return shipments.';
                }
                action("Posted Whse Receipts")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Whse Receipts';
                    RunObject = Page "Posted Whse. Receipt List";
                    ToolTip = 'Open the list of posted warehouse receipts.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Transfer Receipts")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Transfer Receipts';
                    RunObject = Page "Posted Transfer Receipts";
                    ToolTip = 'Open the list of posted transfer receipts.';
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted return receipts.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted credit memo.';
                }
                action("Posted Phys. Invt. Orders")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Phys. Invt. Orders';
                    RunObject = Page "Posted Phys. Invt. Order List";
                    ToolTip = 'View the list of posted inventory counts.';
                }
                action("Posted Phys. Invt. Recordings")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Phys. Invt. Recordings';
                    RunObject = Page "Posted Phys. Invt. Rec. List";
                    ToolTip = 'View the list of finished inventory counts, ready for posting.';
                }
                action("Posted Assembly Orders")
                {
                    ApplicationArea = Assembly;
                    Caption = 'Posted Assembly Orders';
                    RunObject = Page "Posted Assembly Orders";
                    ToolTip = 'View completed assembly orders.';
                }
            }
            group("Registered Documents")
            {
                Caption = 'Registered Documents';
                Image = RegisteredDocs;
                action("Registered Movements")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Registered Movements';
                    Image = RegisteredDocs;
                    RunObject = Page "Registered Whse. Movements";
                    ToolTip = 'View the list of completed warehouse movements.';
                }
            }
        }
        area(creation)
        {
            action("Whse. &Shipment")
            {
                ApplicationArea = Warehouse;
                Caption = 'Whse. &Shipment';
                Image = Shipment;
                RunObject = Page "Warehouse Shipment";
                RunPageMode = Create;
                ToolTip = 'Create a new warehouse shipment.';
            }
            action("T&ransfer Order")
            {
                ApplicationArea = Warehouse;
                Caption = 'T&ransfer Order';
                Image = Document;
                RunObject = Page "Transfer Order";
                RunPageMode = Create;
                ToolTip = 'Move items from one warehouse location to another.';
            }
            action("&Purchase Order")
            {
                ApplicationArea = Warehouse;
                Caption = '&Purchase Order';
                Image = Document;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Purchase goods or services from a vendor.';
            }
            action("&Whse. Receipt")
            {
                ApplicationArea = Warehouse;
                Caption = '&Whse. Receipt';
                Image = Receipt;
                RunObject = Page "Warehouse Receipt";
                RunPageMode = Create;
                ToolTip = 'Record the receipt of items according to an advanced warehouse configuration. ';
            }
            action("Phys. Inv. Order")
            {
                ApplicationArea = Warehouse;
                Caption = 'Phys. Inv. Order';
                RunObject = Page "Physical Inventory Order";
                ToolTip = 'Plan to count inventory by calculating existing quantities and generating the recording documents.';
            }
            action("Phys. Inv. Recording")
            {
                ApplicationArea = Warehouse;
                Caption = 'Phys. Inv. Recording';
                RunObject = Page "Phys. Inventory Recording";
                ToolTip = 'Prepare to count inventory by creating a recording document to capture the quantities.';
            }
        }
        area(processing)
        {
            action("P&ut-away Worksheet")
            {
                ApplicationArea = Warehouse;
                Caption = 'P&ut-away Worksheet';
                Image = PutAwayWorksheet;
                RunObject = Page "Put-away Worksheet";
                ToolTip = 'Prepare and initialize item put-aways.';
            }
            action("Pi&ck Worksheet")
            {
                ApplicationArea = Warehouse;
                Caption = 'Pi&ck Worksheet';
                Image = PickWorksheet;
                RunObject = Page "Pick Worksheet";
                ToolTip = 'Plan and initialize picks of items. ';
            }
            action("M&ovement Worksheet")
            {
                ApplicationArea = Warehouse;
                Caption = 'M&ovement Worksheet';
                Image = MovementWorksheet;
                RunObject = Page "Movement Worksheet";
                ToolTip = 'Prepare to move items between bins within the warehouse.';
            }
            action("W&hse. Item Journal")
            {
                ApplicationArea = Warehouse;
                Caption = 'W&hse. Item Journal';
                Image = BinJournal;
                RunObject = Page "Whse. Item Journal";
                ToolTip = 'Adjust the quantity of an item in a particular bin or bins. For instance, you might find some items in a bin that are not registered in the system, or you might not be able to pick the quantity needed because there are fewer items in a bin than was calculated by the program. The bin is then updated to correspond to the actual quantity in the bin. In addition, it creates a balancing quantity in the adjustment bin, for synchronization with item ledger entries, which you can then post with an item journal.';
            }
            action("Whse. &Phys. Invt. Journal")
            {
                ApplicationArea = Warehouse;
                Caption = 'Whse. &Phys. Invt. Journal';
                Image = InventoryJournal;
                RunObject = Page "Whse. Phys. Invt. Journal";
                ToolTip = 'Prepare to count inventories by preparing the documents that warehouse employees use when they perform a physical inventory of selected items or of all the inventory. When the physical count has been made, you enter the number of items that are in the bins in this window, and then you register the physical inventory.';
            }
            action("Item &Tracing")
            {
                ApplicationArea = Warehouse;
                Caption = 'Item &Tracing';
                Image = ItemTracing;
                RunObject = Page "Item Tracing";
                ToolTip = 'Trace where a lot or serial number assigned to the item was used, for example, to find which lot a defective component came from or to find all the customers that have received items containing the defective component.';
            }
            //CP-14-11-2022-
            action(PhysInventoryJournal)
            {
                ApplicationArea = Warehouse;
                Caption = 'Physical Inventory Journal';
                Image = PhysicalInventory;
                RunObject = Page "Phys. Inventory Journal";
                ToolTip = 'View the list of ongoing Physical Inventory Journal.';
            }
        }
    }
}

