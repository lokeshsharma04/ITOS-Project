pageextension 52183 "AME Sales Price Lists" extends "Sales Price Lists"
{
    layout
    {
        addafter(SourceNo)
        {
            field(ApplyToName; ApplyToName)
            {
                Caption = 'Apply-to Name';
                Editable = false;
                ApplicationArea = All;
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
                    SalesPriceHeader: Record "Price List Header";
                begin
                    SalesPriceHeader.SetRange(code, Rec.Code);
                    PriceListReport.SetTableView(SalesPriceHeader);
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