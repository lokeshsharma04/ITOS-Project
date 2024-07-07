report 52124 "AME Comm. Tax-Invoice Whse"
{
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Commercial Tax-Invoice';
    RDLCLayout = 'src/Reports/Layout/Commercial Tax-Invoice Whse.rdl';

    UsageCategory = ReportsAndAnalysis;

    dataset
    {

        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.");
            column(DocNo; "AME Commercial Invoice No.") { }
            column(AmtInWords; AmtInWords) { }
            column(companyinforamtionFax; companyinforamtion."Fax No.") { }
            column(External_Document_No_; "External Document No.") { }
            column(Compname; companyinforamtion.name) { }
            column(companyinforamtionCity; companyinforamtion.City) { }
            column(companyinforamtion; companyinforamtion."Country/Region Code") { }
            column(Compaddress; companyinforamtion.Address) { }
            column(Compaddress2; companyinforamtion."Address 2") { }
            column(CompCity; companyinforamtion.City) { }
            column(companyinforamtionCountry; companyinforamtion."Country/Region Code") { }
            column(compVatregno; companyinforamtion."VAT Registration No.") { }
            column(Comppostcode; companyinforamtion."Post Code") { }

            column(PostingDate_SalesInvoiceHeader; format("Posting Date", 0, '<Day> <Month Text> <Year4>')) { }
            column(companyinforamtionPicture; companyinforamtion.Picture) { }
            column(companyinforamtionPhone; companyinforamtion."Phone No.") { }
            column(DescriptionLine; DescriptionLine[1] + '' + DescriptionLine[2]) { }
            column(companyinforamtionBankName; companyinforamtion."Bank Name") { }
            column(companyinforamtionBankAccountNo; companyinforamtion."Bank Account No.") { }
            column(text1; text1) { }
            column(NO; NO) { }
            column(ShowBatchDetails; ShowBatchDetails) { }
            column(ShowMfgDate; ShowMfgDate) { }
            column(ShowBatchOrMgf; ShowBatchOrMgf) { }
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemLinkReference = "Warehouse Shipment Header";
                column(OrderNo_SalesInvoiceHeader; SalesHeader."No.") { }

                column(DocumentNo_SalesInvoiceLine; "No.") { }
                column(Description2_SalesInvoiceLine; "Description") { }
                column(LineNo_SalesInvoiceLine; SalesLine."Line No.") { }
                column(ItemNo_SalesInvoiceLine; SalesLine."No.") { }
                column(Quantity_SalesInvoiceLine; "Qty. to Ship") { }
                column(UnitPrice_SalesInvoiceLine; SalesLine."Unit Price") { }
                column(Amount_SalesInvoiceLine; "Qty. to Ship" * SalesLine."Unit Price") { }
                column(Description_SalesInvoiceLine; SalesLine.Description) { }
                column(LineDiscount_SalesInvoiceLine; SalesLine."Line Discount %") { }
                column(AmountIncludingVAT_SalesInvoiceLine; SalesLine."Amount Including VAT") { }
                column(VAT__; SalesLine."VAT %") { }
                column(srno; srno) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(totalvat; totalvat) { }
                column(totalvat1; totalvat1) { }
                column(format; format) { }
                column(format1; format1) { }
                column(format2; format2) { }
                column(totalvat11; totalvat) { }
                column(VAT_Registration_No_; SalesHeader."VAT Registration No.") { }
                column(Order_No_; SalesHeader."No.") { }
                column(Transport_Method; Transport.Description) { }
                column(Currency_Code; SalesHeader."Currency Code") { }
                column(Shipment_Method_Code; Shipment.Code) { }
                column(SelltoCustomerNo_SalesInvoiceHeader; SalesHeader."Sell-to Customer No.") { }
                column(Bill_to_Address; SalesHeader."Bill-to Address") { }
                column(Bill_to_Name; SalesHeader."Bill-to Name") { }
                column(Bill_to_City; SalesHeader."Bill-to City") { }
                column(Salesperson_Code; SalesHeader."Salesperson Code") { }
                column(countryregioncodeName; countryregioncode.Name) { }
                column(countryregionname; countryregioncode.Name) { }
                column(companyinforamtionCountryRegionCode; companyinforamtion."Country/Region Code") { }
                column(paymenttermsDescription; paymentterms.Description) { }
                column(Document_Date; SalesHeader."Document Date") { }
                column(BilltoName_SalesInvoiceHeader; SalesHeader."Bill-to Name") { }
                column(BilltoAddress_SalesInvoiceHeader; SalesHeader."Bill-to Address") { }
                column(BilltoAddress2_SalesInvoiceHeader; SalesHeader."Bill-to Address 2") { }
                column(DueDate_SalesInvoiceHeader; format("Due Date", 0, '<Day> <Month Text> <Year4>')) { }
                column(DocumentDate_SalesInvoiceHeader; format(SalesHeader."Document Date", 0, '<Day> <Month Text> <Year4>')) { }
                column(PaymentTermsCode_SalesInvoiceHeader; paymentterms.Code) { }
                column(BilltoCounty_SalesInvoiceHeader; SalesHeader."Bill-to County") { }
                column(BilltoPostCode_SalesInvoiceHeader; SalesHeader."Bill-to Post Code") { }
                column(BilltoContactNo_SalesInvoiceHeader; SalesHeader."Bill-to Contact No.") { }
                column(BilltoCity_SalesInvoiceHeader; SalesHeader."Bill-to City") { }
                column(ShiptoName_SalesInvoiceHeader; SalesHeader."Ship-to Name") { }
                column(ShiptoAddress_SalesInvoiceHeader; SalesHeader."Ship-to Address") { }
                column(ShiptoAddress2_SalesInvoiceHeader; SalesHeader."Ship-to Address 2") { }
                column(ShiptoCounty_SalesInvoiceHeader; SalesHeader."Ship-to County") { }
                column(ShiptoPostCode_SalesInvoiceHeader; SalesHeader."Ship-to Post Code") { }
                column(ShiptoContact_SalesInvoiceHeader; SalesHeader."Ship-to Contact") { }
                column(ShiptoCity_SalesInvoiceHeader; SalesHeader."Ship-to City") { }
                column(CountryName; Country.Name) { }
                column(CurrencyCode_SalesInvoiceHeader; SalesHeader."Currency Code") { }
                column(TotalQty; TotalQty) { }
                column(LineDisAmtSalesLine; SalesLine."Line Amount") { }
                column(TotalValue; TotalValue) { }
                column(TotalVatValue; TotalVatValue) { }
                column(HSCode; HSCode) { }
                column(Origin; Origin) { }

                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = "Item No." = field("Item No."), "Location Code" = field("Location Code"), "Source ID" = field("Source No."), "Source Ref. No." = field("Source Line No.");
                    DataItemTableView = where("Source Type" = filter(37), "Source Subtype" = filter(1));
                    column(Lot_No_; "Lot No.") { }
                    column(Serial_No_; "Serial No.") { }
                    column(Expiration_Date; "Expiration Date") { }
                    column(Mfg_Date; "Creation Date") { }
                    Column(TracSpec_Quantity__Base_; Abs("Quantity (Base)")) { }

                }

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    totalvat := 0;
                    totalvat1 := 0;
                    TotalQty := 0;
                end;

                trigger OnAfterGetRecord()
                var
                    recitem: record Item;
                    CountryReg: Record "Country/Region";
                begin
                    //TODO: to be checked why manual assignment
                    HSCode := '';
                    Origin := '';
                    srno += 1;
                    if SalesHeader.Get("Source Subtype", "Source No.") then begin
                        SalesHeader.CalcFields("Amount Including VAT");
                        Utility.FormatNoText(AmtText, SalesHeader."Amount Including VAT", SalesHeader."Currency Code");
                        AmtInWords := AmtText[1] + AmtText[2];

                        if paymentterms.get(SalesHeader."Payment Terms Code") then;
                        if countryregioncode.get(companyinforamtion."Country/Region Code") then;
                        if Country.Get(customer."Country/Region Code") then;
                        if Shipment.Get(SalesHeader."Shipment Method Code") then;
                        if Transport.Get(SalesHeader."Transport Method") then;
                        if SalesLine.Get("Source Subtype", "Source No.", "Source Line No.") then begin
                            totalvat := Round(SalesLine."VAT %" * SalesLine."Line Amount" / 100, 0.01);
                            TotalQty += "Warehouse Shipment Line"."Qty. to Ship";
                            TotalValue += SalesLine."Line Amount";
                            TotalVatValue += SalesLine."Amount Including VAT";
                            if RecItem.Get("Item No.") then begin
                                HSCode := RecItem."Tariff No.";
                                if CountryReg.Get(RecItem."Country/Region of Origin Code") then
                                    Origin := CountryReg.Name;
                            end;
                        end;

                    end;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                TotalValue := 0;
                TotalVatValue := 0;
            end;
        }

    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    Caption = 'Options';
                    field(ShowBatchDetails; ShowBatchDetails)
                    {
                        Caption = 'Show Batch Details';
                    }
                    field(ShowMfgDate; ShowMfgDate)
                    {
                        Caption = 'Show Mgf. Details';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        Clear(companyinforamtion);
        if companyinforamtion.get() then;
        companyinforamtion.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        ShowBatchOrMgf := ShowBatchDetails or ShowMfgDate;
    end;

    var
        myInt: Integer;
        Shipment: Record "Shipment Method";
        ShipmentName: Text[100];
        Transport: Record "Transport Method";
        TransportName: Text[100];
        companyinforamtion: Record "Company Information";
        countryregioncode: Record "Country/Region";
        Country: Record "Country/Region";
        customer: Record Customer;
        paymentterms: Record "Payment Terms";
        check: Report Check;
        srno: Integer;
        DescriptionLine: array[2] of Text[80];
        EndofDocument: Label ' End of Document.';
        totalvat: Decimal;
        totalvat1: Decimal;
        TotalAmount: Decimal;
        text1: Text;
        format: Text;
        format1: Text;
        format2: Text;
        noofcopies: Integer;
        noofloops: Integer;
        copytext: Text[30];
        outputno: Integer;
        formatdocument: Codeunit "Format Document";
        Hidecominf: Boolean;
        sales: Record "Sales Invoice Line";
        NO: Integer;
        companyinformationhide: Boolean;
        hidelinedetai: Boolean;
        AmtText: array[2] of Text[100];
        AmtInWords: Text[250];
        Utility: Codeunit Utility;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ShowBatchDetails: Boolean;
        ShowMfgDate: Boolean;
        ShowBatchOrMgf: Boolean;
        TotalQty: Decimal;
        TotalAmt: Decimal;
        TotalValue: Decimal;
        TotalVatValue: Decimal;
        Origin: text[50];
        HSCode: Code[20];
}