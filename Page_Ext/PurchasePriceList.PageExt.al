pageextension 52148 "AME Purchase Price List" extends "Purchase Price List"
{
    layout
    {
        addafter(AssignToNo)
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
        addafter(VerifyLines)
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
                    PurchasePriceHeader.SetRange(code, Rec.Code);
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

