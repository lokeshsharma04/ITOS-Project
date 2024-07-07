pageextension 52124 "AME Blanket Sales Order" extends "Blanket Sales Order"
{
    layout
    {
        addafter("Order Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("O&rder")
        {
            action(RefreshPrice)
            {
                ApplicationArea = all;
                Image = Price;
                Caption = 'Refresh Price';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.RefreshSalesPrices(Rec);
                end;
            }
        }

        addafter(Print)
        {
            action("AMEPrintForecastProforma")
            {
                ApplicationArea = all;
                Image = PrintVoucher;
                Caption = 'Forecast Proforma';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    ForecastProformaRep: Report "AME Forecast Report";
                begin
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.", Rec."No.");
                    ForecastProformaRep.SetTableView(SalesHeader);
                    ForecastProformaRep.Run();
                end;
            }
        }
    }
}
