report 52123 "AME HS Code Report Whse"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'HS Code Report';

    RDLCLayout = 'src/Reports/Layout/HSCodeReportWhse.RDL';

    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";

            column(No_SalesInvoiceHeader; "AME Commercial Invoice No.") { }
            column(SelltoAddress_SalesInvoiceHeader; Sell_to_Address) { }
            column(SelltoPostCode_SalesInvoiceHeader; Post_Code) { }
            column(SelltoCity_SalesInvoiceHeader; Sell_to_City) { }
            column(SelltoAddress2_SalesInvoiceHeader; Sell_to_Address_2) { }
            column(SelltoCustomerName_SalesInvoiceHeader; Sell_to_Customer_Name) { }
            column(CurrencyCode_SalesInvoiceHeader; Currency_Code) { }
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture) { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemLinkReference = "Warehouse Shipment Header";
                column(DocumentNo_SalesInvoiceLine; "No.") { }
                column(LineNo_SalesInvoiceLine; "Line No.") { }
                column(No_SalesInvoiceLine; "Item No.") { }
                column(Description_SalesInvoiceLine; Description) { }
                column(NetWeight_SalesInvoiceLine; ItemNetWeight) { }
                column(QuantityBase_SalesInvoiceLine; "Qty. (Base)") { }
                column(Line_Amount; "AME Amount") { }
                column(HSCode; HSCode) { }
                column(Origin; Origin) { }
                column(SrNo; SrNo) { }
                column(NoOfCTN; NoOfCTN) { }
                trigger OnAfterGetRecord()
                var
                    RecItem: Record Item;
                begin
                    HSCode := '';
                    Origin := '';
                    NoOfCTN := 0;
                    SrNo += 1;
                    if RecItem.Get("Item No.") then begin
                        HSCode := RecItem."Tariff No.";
                        ItemNetWeight := RecItem."Net Weight";
                        if CountryReg.Get(RecItem."Country/Region of Origin Code") then
                            Origin := CountryReg.Name;
                    end;
                    if Sell_to_Customer_Name = '' then
                        FillSalesDocValue("Source No.");
                end;

                trigger OnPreDataItem()
                begin
                    SrNo := 0
                end;

            }
            trigger OnAfterGetRecord()
            begin
                "Warehouse Shipment Header".TestField("AME Commercial Invoice No.");
            end;
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
        ClearVar();
    end;

    local procedure ClearVar()
    begin
        Clear(Sell_to_Customer_Name);
        Clear(Sell_to_Address);
        Clear(Sell_to_Address_2);
        Clear(Currency_Code);
        Clear(Post_Code);
        Clear(Sell_to_City);
    end;

    local procedure FillSalesDocValue(SourceNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.Get(SalesHeader."Document Type"::Order, SourceNo) then begin
            Sell_to_Customer_Name := SalesHeader."Sell-to Customer Name";
            Sell_to_Address := SalesHeader."Sell-to Address";
            Sell_to_Address_2 := SalesHeader."Sell-to Address 2";
            Currency_Code := SalesHeader."Currency Code";
            Post_Code := SalesHeader."Sell-to Post Code";
            Sell_to_City := SalesHeader."Sell-to City";
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
        Sell_to_Customer_Name: Text[100];
        Sell_to_Address: Text[100];
        Sell_to_Address_2: Text[100];
        Currency_Code: Code[20];
        Post_Code: Code[20];
        Sell_to_City: Text[30];
        ExternalDocNo: Code[20];

}