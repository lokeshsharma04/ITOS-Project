page 52130 "AME Retail Sales Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";

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
                field("Purchase Orders - Released"; Rec."AME Purch. Orders-Released")
                {
                    DrillDownPageID = "Purchase Order List";
                }
                field("PurchaseOrder Pending Approval"; Rec."AME Purch.Order Pndg Apprvl")
                {
                    DrillDownPageID = "Purchase Order List";
                }
                field("Not Invoiced Purchase"; Rec."AME Not Invoiced Purchase")
                {
                    DrillDownPageID = "Purchase Order List";
                }
                field("Partially Invoiced Purchase"; Rec."AME Partially Inv. Purch.")
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
        area(Processing)
        {


        }
    }

    trigger OnAfterGetRecord()
    begin
        // CalculateCueFieldValues;
    end;

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

        Rec.SetRespCenterFilter;
        // SetFilter("Date Filter", '>=%1', WorkDate);
        Rec.SetFilter("User ID Filter", UserId);
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";

}

