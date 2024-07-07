page 52126 "AME Purch. Suprvsr Activity"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Purchase Cue";

    layout
    {
        area(content)
        {
            cuegroup("Purchase Orders - Status")
            {
                Caption = 'Purchase Orders - Status';
                field("Purchase Orders - Open"; Rec."AME Purchase Orders - Open")
                {
                    DrillDownPageID = "Purchase Order List";
                }
                field("Purchase Orders - Released"; Rec."AME Purchase Orders - Released")
                {
                    DrillDownPageID = "Purchase Order List";
                }
                field("Not Invoiced Purchase"; Rec."AME Not Invoiced Purchase")
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
                field("Partially Invoiced Purchase"; Rec."AME Partially Invoiced Purchas")
                {
                    DrillDownPageID = "Purchase Order List";
                }

                actions
                {
                    action("New Purchase Quote")
                    {
                        ApplicationArea = Suite;
                        Caption = 'New Purchase Quote';
                        RunObject = Page "Purchase Quote";
                        RunPageMode = Create;
                        ToolTip = 'Prepare a request for quote';
                    }
                    action("New Purchase Order")
                    {
                        ApplicationArea = Suite;
                        Caption = 'New Purchase Order';
                        RunObject = Page "Purchase Order";
                        RunPageMode = Create;
                        ToolTip = 'Purchase goods or services from a vendor.';
                    }
                    action("Edit Purchase Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Edit Purchase Journal';
                        RunObject = Page "Purchase Journal";
                        ToolTip = 'Post purchase invoices in a purchase journal that may already contain journal lines.';
                    }
                    action(RequisitionWorksheets)
                    {
                        ApplicationArea = Planning;
                        Caption = 'Requisition Worksheets';
                        RunObject = Page "Req. Wksh. Names";
                        RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                        ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
                    }
                }
            }
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
                field("Purchase Return Orders - Open"; Rec."AME Purchase Return O - Open")
                {
                    DrillDownPageID = "Purchase Return Order List";
                }
                field("Purch. Return Order-Released"; Rec."AME Purch. Return O Released")
                {
                    DrillDownPageId = "Purchase Return Order List";
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

            cuegroup("Post Arrival Follow-up")
            {
                Caption = 'Post Arrival Follow-up';
                field(OutstandingOrders; Rec."Outstanding Purchase Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Outstanding Purchase Orders';
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies the number of outstanding purchase orders that are displayed in the Purchase Cue on the Role Center. The documents are filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo("Outstanding Purchase Orders"));
                    end;
                }
                field("Purchase Return Orders - All"; Rec."Purchase Return Orders - All")
                {
                    ApplicationArea = PurchReturnOrder;
                    DrillDownPageID = "Purchase Return Order List";
                    ToolTip = 'Specifies the number of purchase return orders that are displayed in the Purchase Cue on the Role Center. The documents are filtered by today''s date.';
                }

                actions
                {
                    action(Navigate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Navigate';
                        Image = Navigate;
                        RunObject = Page Navigate;
                        ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';
                    }
                    action("New Purchase Return Order")
                    {
                        ApplicationArea = PurchReturnOrder;
                        Caption = 'New Purchase Return Order';
                        RunObject = Page "Purchase Return Order";
                        RunPageMode = Create;
                        ToolTip = 'Process a return or refund that requires inventory handling by creating a new purchase return order.';
                    }
                }
            }
            cuegroup("Purchase Orders - Authorize for Payment")
            {
                Caption = 'Purchase Orders - Authorize for Payment';
                field(NotInvoiced; Rec."Not Invoiced")
                {
                    ApplicationArea = Suite;
                    Caption = 'Received, Not Invoiced';
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies received orders that are not invoiced. The orders are displayed in the Purchase Cue on the Purchasing Agent role center, and filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo("Not Invoiced"));
                    end;
                }
                field(PartiallyInvoiced; Rec."Partially Invoiced")
                {
                    ApplicationArea = Suite;
                    Caption = 'Partially Invoiced';
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies the number of partially invoiced orders that are displayed in the Purchase Cue on the Role Center. The documents are filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowOrders(Rec.FieldNo("Partially Invoiced"));
                    end;
                }
            }

            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CalculateCueFieldValues;
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetRespCenterFilter;
        Rec.SetFilter("Date Filter", '>=%1', WorkDate);
        Rec.SetFilter("User ID Filter", UserId);
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";

    local procedure CalculateCueFieldValues()
    begin
        if Rec.FieldActive("Outstanding Purchase Orders") then
            Rec."Outstanding Purchase Orders" := Rec.CountOrders(Rec.FieldNo("Outstanding Purchase Orders"));

        if Rec.FieldActive("Not Invoiced") then
            Rec."Not Invoiced" := Rec.CountOrders(Rec.FieldNo("Not Invoiced"));

        if Rec.FieldActive("Partially Invoiced") then
            Rec."Partially Invoiced" := Rec.CountOrders(Rec.FieldNo("Partially Invoiced"));
    end;
}

