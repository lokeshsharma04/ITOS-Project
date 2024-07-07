report 52134 "AME Posted ANP Expenses Report"
{
    ApplicationArea = All;
    Caption = 'Posted ANP Expenses Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/PostedANPExpenses.rdl';
    dataset
    {
        dataitem(PurchInvLine; "Purch. Inv. Line")
        {
            DataItemTableView = sorting("Document No.", "Order No.", "Order Line No.", "Posting Date");
            RequestFilterFields = "Posting Date", "Gen. Prod. Posting Group", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";

            column(compName; CompInfo.Name)
            {
            }
            column(compPicture; CompInfo.Picture)
            { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            column(PostingDate_SalesInvoiceLine; "Posting Date") { }
            column(Description_SalesInvoiceLine; Description) { }
            column(Invoice_No_; "Document No.") { }
            column(Document_No_; "Order No.") { }
            column(CustomerName; CustomerName) { }
            column(Customer_country; CustomerCountry) { }
            column(Division; "Shortcut Dimension 1 Code") { }
            column(Brand; "Shortcut Dimension 2 Code") { }
            column(OTL; ItemCategory11Code) { }
            column(Sub_Type1_BTL; ItemCategory12Code) { }
            column(ItemDesc; ItemDescription) { }
            column(PurchOrdType; PurchInvHeader."AME Purch. Order Type") { }
            column(Amount; AmtLCY) { }
            column(ReportFilters; ReportFilters) { }
            column(LCYCode; GLsetup."LCY Code") { }
            trigger OnAfterGetRecord()
            var
                Customer: Record Customer;
                CountryRegion: Record "Country/Region";
                Item: Record Item;
                DimensionMgmt: Codeunit DimensionManagement;
                CustomerNo: Code[20];
                DimCode: array[8] of code[20];
                CurrExchRate: Record "Currency Exchange Rate";
            begin
                clearvar();
                Clear(DimCode);
                DimensionMgmt.GetShortcutDimensions(PurchInvLine."Dimension Set ID", DimCode);
                if Customer.Get(DimCode[6]) then begin
                    CustomerName := Customer.Name;
                    if CountryRegion.Get(Customer."Country/Region Code") then
                        CustomerCountry := CountryRegion.Name;
                end;
                if Item.Get("No.") then begin
                    ItemCategory11Code := Item."AME Item Category 11";
                    ItemCategory12Code := Item."AME Item Category 12";
                    ItemDescription := Item.Description;
                end;
                if PurchInvHeader.Get("Document No.") then;

                AmtLCY := CurrExchRate.ExchangeAmtFCYToLCY("Posting Date", PurchInvHeader."Currency Code", Amount, PurchInvHeader."Currency Factor");
            end;

            trigger OnPreDataItem()
            begin
                // PurchInvLine.SetRange("Posting Date", PostingDate);
                // PurchInvLine.SetRange("Gen. Prod. Posting Group", GenProdFilter);
                // if DivisionFilter <> '' then
                //     PurchInvLine.SetRange("Shortcut Dimension 1 Code", DivisionFilter);
                // if BrandFilter <> '' then
                //     PurchInvLine.SetRange("Shortcut Dimension 2 Code", BrandFilter);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filters)
                {
                }
            }
        }
        actions
        {
            area(processing) { }
        }
    }
    trigger OnPreReport()
    begin
        GLsetup.Get();
        if (PurchInvLine.GetFilter("Posting Date") = '') then
            Error('Date Filter must have a value.');
        if PurchInvLine.GetFilter("Gen. Prod. Posting Group") = '' then
            Error('General Prod. Posting Group must have a value.');

        ReportFilters := '';
        IF PurchInvLine.GetFilters() <> '' then
            ReportFilters := PurchInvLine.GetFilters();
    end;

    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;

    end;

    var
        CustomerCountry: Text[50];
        ItemCategory11Code: Code[30];
        ItemCategory12Code: Code[30];
        ItemDescription: Text[100];
        CustomerName: Text[100];
        PurchInvHeader: Record "Purch. Inv. Header";
        CompInfo: Record "Company Information";
        ReportFilters: text;
        AmtLCY: Decimal;
        GLsetup: Record "General Ledger Setup";

    local procedure clearvar()
    begin
        clear(CustomerCountry);
        clear(ItemCategory11Code);
        clear(ItemCategory12Code);
        clear(ItemDescription);
        clear(CustomerName);
    end;
}
