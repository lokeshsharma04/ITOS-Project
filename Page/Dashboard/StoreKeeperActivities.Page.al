page 52128 "AME Store Keeper Activities"
{
    Caption = 'Store Keeper Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                field("AME Request to Approve"; Rec."AME Request to Approve")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Requests to Approve";
                }
                field("AME Negative Inventory"; Rec."AME Negative Inventory")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Item List";
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
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;



        Rec.SetFilter("User ID Filter", UserId);
    end;
}