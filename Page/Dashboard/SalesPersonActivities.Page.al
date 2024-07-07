page 52190 "AME Salesperson Activities"
{
    Caption = 'Salesperson Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Sales & Collections")
            {
                field("AME Month Sales"; Rec."AMESalesperson Month Sales")
                {
                    ApplicationArea = All;
                }
                field("Month Collection"; Rec."AMESalesperson Month Collc.")
                {
                    ApplicationArea = All;
                }

                field("AME Request to Approve"; Rec."AME Request to Approve")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Requests to Approve";
                }
                field("AME Open Receipts"; Rec."AME Open Receipts")
                {
                    ApplicationArea = All;
                }
            }
            cuegroup("Sales")
            {
                field("Sales Quotes - Open"; Rec."AME Sales Quotes-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Quotes";
                }
                field("Sales Orders - Open"; Rec."AME Sales Orders - Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("AME Sales Orders-PndgApprvl"; Rec."AME Sales Orders-PndgApprvl")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("AME Sales Orders - Released"; Rec."AME Sales Orders - Released")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("Sales Return Orders - Open"; Rec."AME Sales Return Order-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Return Order List";
                }
                field("Sales Credit Memos - Open"; Rec."AME Sales CrMemo-Open")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Credit Memos";
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
        TeamSalesPerson: Record "Team Salesperson";
        SalesPersonFilterText: Text;
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetFilter("Date Filter", '%1..%2', CalcDate('-CM', Today), CalcDate('CM', Today));
    end;
}