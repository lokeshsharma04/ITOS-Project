report 52136 "AME Original Forecast Vs Act"
{
    Caption = 'Original Forecast Vs Actual';
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/OriginalForecastVsActual.rdl';
    ApplicationArea = Basic, Suite;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture)
            { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            column(No_Customer; "No.") { }
            column(Name_Customer; Name) { }
            column(CountryRegionCode_Customer; CountryName) { }
            column(OrderedValue_FO_; "OrderedValue[FO]") { }
            column(ShippedValue_Sales_; "ShippedValue[Sales]") { }
            column(DiffFOVsFC; DiffFOVsFC) { }
            column(ForecaseValue_FC_; "ForecastValue[FC]") { }
            column(PendingValue; PendingValue) { }
            column(ReportCap; ReportCap) { }
            column(Debit_Amount; "Debit Amount") { }
            column(ReportFilters; ReportFilters) { }
            column(DateFilters; DateFilters) { }

            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Sales Header";
                SalesLine: Record "Sales Line";
            begin
                CountryName := '';
                "OrderedValue[FO]" := 0;
                "ShippedValue[Sales]" := 0;
                "DiffFOVsFC" := 0;
                "ForecastValue[FC]" := 0;
                PendingValue := 0;
                if CountryRegion.Get(Customer."Country/Region Code") then
                    CountryName := CountryRegion.Name;
                //For Sales Order
                SalesHeader.Reset();
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SetRange("Sell-to Customer No.", Customer."No.");
                if (FromDate <> 0D) and (ToDate <> 0D) then
                    SalesHeader.SetRange("Document Date", FromDate, ToDate);
                if Customer."Global Dimension 1 filter" <> '' then
                    SalesHeader.SetRange("Shortcut Dimension 1 Code", Customer."Global Dimension 1 Filter");
                if Customer."Global Dimension 2 Filter" <> '' then
                    SalesHeader.SetRange("Shortcut Dimension 2 Code", Customer."Global Dimension 2 Filter");
                if CurrencyCode <> '' then
                    SalesHeader.SetRange("Currency Code", CurrencyCode);
                if SalesHeader.FindSet() then
                    repeat
                        SalesLine.Reset();
                        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                        SalesLine.SetRange("Document No.", SalesHeader."No.");
                        if SalesLine.FindSet() then begin
                            // SalesLine.CalcSums(Amount, "Amount Including VAT");
                            repeat
                                "OrderedValue[FO]" += SalesLine.Amount;
                                if (SalesLine."Quantity (Base)" <> 0) and (SalesLine.Amount <> 0) then
                                    "ShippedValue[Sales]" += SalesLine."Quantity Shipped" * (SalesLine.Amount / SalesLine."Quantity (Base)");
                            until SalesLine.Next() = 0;
                        end;
                    until SalesHeader.Next() = 0;


                //For Blanket Sales Order
                SalesHeader.SetRange("Document Type");
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
                if SalesHeader.FindSet() then
                    repeat
                        SalesLine.Reset();
                        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                        SalesLine.SetRange("Document No.", SalesHeader."No.");
                        if SalesLine.FindSet() then begin
                            SalesLine.CalcSums(Amount);
                            "ForecastValue[FC]" += SalesLine.Amount;
                        end;
                    until SalesHeader.Next() = 0;

                "DiffFOVsFC" := "OrderedValue[FO]" - "ForecastValue[FC]";
                PendingValue := ("OrderedValue[FO]" - "ShippedValue[Sales]") * -1;

                IF ("OrderedValue[FO]" = 0) AND (PendingValue = 0) AND (DiffFOVsFC = 0) AND ("ForecastValue[FC]" = 0) AND ("ShippedValue[Sales]" = 0) THEN
                    CurrReport.Skip();
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
                    Caption = 'Filters';
                    field(FromDate; FromDate)
                    {
                        Caption = 'From Date';
                        ApplicationArea = all;
                    }
                    field(ToDate; ToDate)
                    {
                        Caption = 'To Date';
                        ApplicationArea = all;
                    }
                    field(CurrencyCode; CurrencyCode)
                    {
                        Caption = 'Currency Code';
                        ApplicationArea = all;
                        TableRelation = Currency;
                    }
                }
            }
        }
        actions
        {
            area(processing) { }
        }
    }
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    trigger OnPreReport()
    begin
        DateFilters := '';
        ReportFilters := '';
        if Customer.GetFilters() <> '' then
            ReportFilters := Customer.GetFilters();
        if CurrencyCode <> '' then
            ReportFilters += ', Currency code: ' + CurrencyCode;
        if (FromDate <> 0D) And (ToDate <> 0D) then
            DateFilters := 'From date: ' + Format(FromDate) + ', To date: ' + Format(ToDate);
    end;

    var
        CountryRegion: Record "Country/Region";
        CountryName: Text[100];
        "ForecastValue[FC]": Decimal;
        "OrderedValue[FO]": Decimal;
        "ShippedValue[Sales]": Decimal;
        "DiffFOVsFC": Decimal;
        PendingValue: Decimal;
        FromDate: date;
        ToDate: Date;
        CurrencyCode: Code[20];
        ReportCap: Label 'Original Forecast Vs. Actual';
        CompInfo: Record "Company Information";
        ReportFilters: Text;
        DateFilters: Text;
}
