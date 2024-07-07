page 52109 "AME Sales-Purch. Activities"
{
    Caption = 'Sales Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Sales")
            {
                CuegroupLayout = Wide;
                field("AME Not Invoiced"; Rec."AME Not Invoiced")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("Partially Shipped"; Rec."Partially Shipped")
                {
                    DrillDownPageId = "Sales Order List";
                    ApplicationArea = All;
                }
                field("AME Partially Invoiced"; Rec."AME Partially Invoiced")
                {
                    DrillDownPageId = "Sales Order List";
                    ApplicationArea = All;
                }

            }
            cuegroup("Purchase")
            {
                field("Not Invoiced Purchase"; Rec."AME Not Invoiced Purchase")
                {
                    DrillDownPageID = "Purchase Order List";
                    ApplicationArea = All;
                }
                field("Partially Invoiced Purchase"; Rec."AME Partially Inv. Purch.")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Purchase Order List";
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;
}