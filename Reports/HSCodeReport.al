report 52113 "AME HS Code Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'HS Code Report';

    RDLCLayout = 'src/Reports/Layout/HSCodeReport.RDL';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            column(No_SalesInvoiceHeader; "No.")
            {
            }
            column(SelltoAddress_SalesInvoiceHeader; "Sell-to Address")
            {
            }
            column(SelltoPostCode_SalesInvoiceHeader; "Sell-to Post Code")
            {
            }
            column(SelltoCity_SalesInvoiceHeader; "Sell-to City")
            {
            }
            column(SelltoAddress2_SalesInvoiceHeader; "Sell-to Address 2")
            {
            }

            column(SelltoCustomerName_SalesInvoiceHeader; "Sell-to Customer Name")
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Currency Code")
            {
            }
            column(compName; CompInfo.Name)
            {
            }
            column(compPicture; CompInfo.Picture)
            { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Invoice Header";

                column(DocumentNo_SalesInvoiceLine; "Document No.")
                {
                }
                column(LineNo_SalesInvoiceLine; "Line No.")
                {
                }
                column(No_SalesInvoiceLine; "No.")
                {
                }
                column(Description_SalesInvoiceLine; Description)
                {
                }
                column(NetWeight_SalesInvoiceLine; ItemNetWeight)
                {
                }
                column(QuantityBase_SalesInvoiceLine; "Quantity (Base)")
                {
                }
                column(Line_Amount; "Line Amount") { }
                column(HSCode; HSCode)
                {
                }
                column(Origin; Origin)
                {
                }
                column(SrNo; SrNo)
                {
                }
                column(NoOfCTN; NoOfCTN) { }
                trigger OnAfterGetRecord()
                var
                    RecItem: Record Item;
                begin
                    HSCode := '';
                    Origin := '';
                    NoOfCTN := 0;
                    SrNo += 1;
                    if RecItem.Get("No.") then begin
                        HSCode := RecItem."Tariff No.";
                        if CountryReg.Get(RecItem."Country/Region of Origin Code") then
                            Origin := CountryReg.Name;
                        ItemNetWeight := RecItem."Net Weight";
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    SrNo := 0
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
                group(GroupName)
                {

                }
            }
        }
    }
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;

    end;



    var

        CompInfo: Record "Company Information";
        SrNo: Integer;
        Origin: text[50];
        HSCode: Code[20];
        ItemNetWeight: Decimal;
        CountryReg: Record "Country/Region";
        NoOfCTN: Decimal;
}