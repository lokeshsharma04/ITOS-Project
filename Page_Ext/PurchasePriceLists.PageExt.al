pageextension 52140 "AME Purchase Price Lists" extends "Purchase Price Lists"
{
    layout
    {
        addafter(SourceNo)
        {
            field(ApplyToName; ApplyToName)
            {
                Caption = 'Apply-to Name';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
        addfirst(Reporting)
        {
            action("AME Report")
            {
                ApplicationArea = All;
                Caption = 'Price List Report';
                Promoted = true;
                Image = Print;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PriceListReport: Report "AME Price List Report";
                    PurchasePriceHeader: Record "Price List Header";
                begin
                    //PurchasePriceHeader.SetRange(code, Rec.Code);
                    CurrPage.SetSelectionFilter(PurchasePriceHeader);
                    PriceListReport.SetTableView(PurchasePriceHeader);
                    PriceListReport.RunModal();
                end;
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        ApplyToName := REc.GetApplyToName();
    end;

    trigger OnAfterGetRecord()
    begin
        ApplyToName := REc.GetApplyToName();
    end;

    var
        ApplyToName: Text;
}
