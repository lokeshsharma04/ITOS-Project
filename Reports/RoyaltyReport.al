report 52127 "AME Royalty Report"
{
    ApplicationArea = All;
    Caption = 'Royalty Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Royalty Report.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "AME Item Category 5";
            PrintOnlyIfDetail = true;
            column(No_Item; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(ReportFilter; ReportFilter)
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(CompanyPicture; CompInfo.Picture) { }
            column(ShowTranDetail; ShowTranDetail) { }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = sorting("Item No.", "Entry Type", "Document Type", "Document No.") where("Entry Type" = filter(1), "Document Type" = filter(1 | 3));
                RequestFilterFields = "Document Type";
                column(Quantity_ItemLedgerEntry; Quantity * -1)
                {
                }
                column(InvoicedQuantity_ItemLedgerEntry; "Invoiced Quantity" * -1)
                {
                }
                column(SalesAmountActual_ItemLedgerEntry; "Sales Amount (Actual)")
                {
                }
                column(CurrencyCode; ToCurrency) { }
                column(DocumentType_ItemLedgerEntry; "Document Type")
                {
                }
                column(DocumentNo_ItemLedgerEntry; "Document No.")
                {
                }
                column(SalesAmt_USD; SalesAmt_USD) { }
                column(Royalty_USD; Royalty_USD) { }
                trigger OnAfterGetRecord()
                var
                    SalesShipHeader: Record "Sales Shipment Header";
                    SalesReturnRcpthdr: Record "Return Receipt Header";
                    CurrExchRate: Record "Currency Exchange Rate";
                begin
                    FromCurrencyCode := 'USD';
                    SalesAmt_USD := 0;
                    Royalty_USD := 0;
                    ToCurrency := '';
                    if "Document Type" = "Document Type"::"Sales Shipment" then begin
                        SalesShipHeader.Get("Document No.");
                        ToCurrency := SalesShipHeader."Currency Code";
                        if ToCurrency <> '' then begin
                            SalesAmt_USD := CurrExchRate.ExchangeAmtFCYToFCY(SalesShipHeader."Posting Date", FromCurrencyCode,
                                            ToCurrency, "Item Ledger Entry"."Sales Amount (Actual)");
                        end;
                    end else
                        if "Document Type" = "Document Type"::"Sales Return Receipt" then begin
                            SalesReturnRcpthdr.Get("Document No.");
                            ToCurrency := SalesReturnRcpthdr."Currency Code";
                            if ToCurrency <> '' then begin
                                SalesAmt_USD := CurrExchRate.ExchangeAmtFCYToFCY(SalesReturnRcpthdr."Posting Date", FromCurrencyCode,
                                                ToCurrency, "Item Ledger Entry"."Sales Amount (Actual)")
                            end;
                        end;
                    if ToCurrency = '' then
                        ToCurrency := FromCurrencyCode;
                    if SalesAmt_USD = 0 then
                        SalesAmt_USD := "Item Ledger Entry"."Sales Amount (Actual)";

                    Royalty_USD := (SalesAmt_USD * RoyaltyPrct) / 100;
                end;

                trigger OnPreDataItem()
                begin
                    if (FromDate <> 0D) And (ToDate <> 0D) then begin
                        SetRange("Posting Date", FromDate, ToDate);
                    end;
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(ShowTranDetail; ShowTranDetail)
                    {
                        ApplicationArea = all;
                        Caption = 'Show Trans. Detail';
                    }
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = all;
                        Caption = 'From Date';
                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = all;
                        Caption = 'To Date';
                    }
                    field(RoyaltyPrct; RoyaltyPrct)
                    {
                        Caption = 'Royalty %';
                        ApplicationArea = all;
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        FromDate := 0D;
        ToDate := 0D;
        RoyaltyPrct := 0;
        ShowTranDetail := false;
        ReportFilter := '';
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    trigger OnPreReport()
    begin
        if (FromDate = 0D) or (ToDate = 0D) then
            Error('Date Filters must have a value');
        if RoyaltyPrct = 0 then
            Error('Royalty % must have a value');
        ReportFilter := Item.GetFilters();
        if "Item Ledger Entry".GetFilters <> '' then
            ReportFilter += '  ' + "Item Ledger Entry".GetFilters();
    end;

    var
        FromDate: Date;
        ToDate: Date;
        RoyaltyPrct: Decimal;
        ShowTranDetail: Boolean;
        FromCurrencyCode: Code[20];
        SalesAmt_USD: Decimal;
        Royalty_USD: Decimal;
        CompInfo: Record "Company Information";
        ReportFilter: text;
        ToCurrency: Code[20];

}
