report 52115 "AME Tax-Invoice"
{
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Tax-Invoice';
    RDLCLayout = 'src/Reports/Layout/Tax-Invoice.rdl';

    UsageCategory = ReportsAndAnalysis;

    dataset
    {

        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.");
            column(DocNo; "No.")
            {
            }
            column(VAT_Registration_No_; "VAT Registration No.") { }
            column(Order_No_; "Order No.") { }

            column(AmtInWords; AmtInWords) { }
            column(CountryName; Country.Name) { }
            column(companyinforamtionFax;
            companyinforamtion."Fax No.")
            { }

            column(Transport_Method; TransportName) { }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Currency_Code; "Currency Code") { }
            column(Shipment_Method_Code; ShipmentName)
            { }

            column(SelltoCustomerNo_SalesInvoiceHeader; "Sell-to Customer No.") { }

            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_City; "Bill-to City") { }

            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(OrderNo_SalesInvoiceHeader; "Order No.")
            {
            }
            column(Compname; companyinforamtion.name)
            {

            }
            column(companyinforamtionCity; companyinforamtion.City) { }
            column(companyinforamtion; companyinforamtion."Country/Region Code") { }

            column(Compaddress; companyinforamtion.Address)
            {

            }
            column(Compaddress2; companyinforamtion."Address 2")
            {

            }
            column(CompCity; companyinforamtion.City)
            {

            }
            column(companyinforamtionCountry; companyinforamtion."Country/Region Code") { }
            column(compVatregno; companyinforamtion."VAT Registration No.")
            {

            }
            column(Comppostcode; companyinforamtion."Post Code")
            {

            }

            column(countryregionname; countryregioncode.Name)
            {

            }
            column(companyinforamtionCountryRegionCode; companyinforamtion."Country/Region Code")
            {

            }

            column(paymenttermsDescription; paymentterms.Description)
            {

            }
            column(Document_Date; "Document Date") { }
            column(DocumentDate_SalesInvoiceHeader; format("Document Date", 0, '<Day> <Month Text> <Year4>'))
            {
            }
            column(PostingDate_SalesInvoiceHeader; format("Posting Date", 0, '<Day> <Month Text> <Year4>'))
            {
            }
            column(DueDate_SalesInvoiceHeader; format("Due Date", 0, '<Day> <Month Text> <Year4>'))
            {
            }
            column(PaymentTermsCode_SalesInvoiceHeader; "Payment Terms Code")
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Bill-to Name")
            {
            }
            column(BilltoAddress_SalesInvoiceHeader; "Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesInvoiceHeader; "Bill-to Address 2")
            {
            }
            column(BilltoCounty_SalesInvoiceHeader; "Bill-to County")
            {
            }
            column(BilltoPostCode_SalesInvoiceHeader; "Bill-to Post Code")
            {
            }
            column(BilltoContactNo_SalesInvoiceHeader; "Bill-to Contact No.")
            {
            }
            column(BilltoCity_SalesInvoiceHeader; "Bill-to City")
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Ship-to Name")
            {
            }
            column(ShiptoAddress_SalesInvoiceHeader; "Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesInvoiceHeader; "Ship-to Address 2")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; "Ship-to County")
            {
            }
            column(ShiptoPostCode_SalesInvoiceHeader; "Ship-to Post Code")
            {
            }
            column(ShiptoContact_SalesInvoiceHeader; "Ship-to Contact")
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; "Ship-to City")
            {
            }
            column(companyinforamtionPicture; companyinforamtion.Picture)
            {

            }
            column(countryregioncodeName; countryregioncode.Name) { }
            column(companyinforamtionPhone; companyinforamtion."Phone No.") { }
            column(DescriptionLine; DescriptionLine[1] + '' + DescriptionLine[2])
            {

            }
            column(companyinforamtionBankName; companyinforamtion."Bank Name")
            {

            }

            column(companyinforamtionBankAccountNo; companyinforamtion."Bank Account No.")
            {

            }
            column(CurrencyCode_SalesInvoiceHeader; "Currency Code")
            {
            }
            column(text1; text1)
            {

            }
            column(NO; NO)
            {

            }
            column(AME_Commercial_Invoice_No_; "AME Commercial Invoice No.")
            { }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Invoice Header";
                //DataItemTableView = where("Line Discount %" = filter(> 0));

                column(DocumentNo_SalesInvoiceLine; "Document No.")
                {
                }
                column(Line_Discount__; "Line Discount %") { }
                column(Description2_SalesInvoiceLine; "Description")
                {
                }
                column(LineNo_SalesInvoiceLine; "No.")
                {
                }
                column(Quantity_SalesInvoiceLine; Quantity)
                {
                }
                column(UnitPrice_SalesInvoiceLine; "Unit Price")
                {
                }
                column(Amount_SalesInvoiceLine; Amount)
                {
                }
                column(Description_SalesInvoiceLine; Description)
                {
                }
                column(LineDiscount_SalesInvoiceLine; "Line Discount %")
                {
                }
                column(AmountIncludingVAT_SalesInvoiceLine; "Amount Including VAT")
                {
                }
                column(VAT__; "VAT %") { }
                column(Amount_Including_VAT; "Amount Including VAT") { }

                column(srno; srno)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }

                column(totalvat; totalvat)
                {

                }
                column(totalvat1; totalvat1)
                {

                }
                column(TotalAmount; TotalAmount)
                {

                }
                column(TotalAmountIncludingvat; TotalAmountIncludingvat)
                {

                }
                column(format; format)
                {

                }
                column(format1; format1)
                {

                }
                column(format2; format2)
                {

                }
                column(ChargeAmt; ChargeAmt) { }
                column(LineVat; LineVat) { }
                column(totalvat11; totalvat) { }
                trigger OnPreDataItem()
                begin
                    srno := 0;
                    totalvat := 0;
                    totalvat1 := 0;
                    TotalAmount := 0;
                    TotalAmountIncludingvat := 0;
                    ChargeAmt := 0;
                    LineVat := 0;
                    //  sales.SetFilter("Line Discount %", '<>0');

                end;

                trigger OnAfterGetRecord()
                var
                    SalesInvLine: Record "Sales Invoice Line";
                begin
                    SalesSeteup.Get();
                    if SalesSeteup."AME Chamber Charge Item" = "Sales Invoice Line"."No." then begin
                        CurrReport.Skip();
                    end;
                    SalesInvLine.Reset();
                    SalesInvLine.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
                    SalesInvLine.SetRange("No.", SalesSeteup."AME Chamber Charge Item");
                    if SalesInvLine.FindFirst() then
                        ChargeAmt := SalesInvLine."Line Amount";

                    LineVat := "Sales Invoice Line"."Amount Including VAT" - "Sales Invoice Line"."Line Amount";
                    totalvat := Round("Sales Invoice Line"."VAT %" * "Sales Invoice Line"."Line Amount" / 100, 2);
                    //TODO: to be checked why manual assignment
                    totalvat := 123456;
                    totalvat1 := 0;
                    srno += 1;
                end;

            }


            trigger OnPreDataItem()
            begin

            end;


            trigger OnAfterGetRecord()
            begin

                Clear(paymentterms);
                if paymentterms.get("Sales Invoice Header"."Payment Terms Code") then;


                Clear(countryregioncode);
                if countryregioncode.get(companyinforamtion."Country/Region Code") then;
                Clear(Country);
                if Country.Get(customer."Country/Region Code") then;
                if Shipment.Get("Sales Invoice Header"."Shipment Method Code") then begin
                    ShipmentName := Shipment.Description;
                end;
                if Transport.Get("Sales Invoice Header"."Transport Method") then begin
                    TransportName := Transport.Description;
                end;


                "Sales Invoice Header".CalcFields("Amount Including VAT");
                Utility.FormatNoText(AmtText, "Sales Invoice Header"."Amount Including VAT", "Sales Invoice Header"."Currency Code");
                AmtInWords := AmtText[1] + AmtText[2];

                "Sales Invoice Header".CalcFields("Amount Including VAT");
                Utility.FormatNoText(AmtText, "Sales Invoice Header"."Amount Including VAT", "Sales Invoice Header"."Currency Code");
                AmtInWords := AmtText[1] + AmtText[2];




            end;



            trigger OnPostDataItem()
            begin


            end;

        }







    }
    requestpage
    {

        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(option)
                {


                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnInitReport()
    begin
        Clear(companyinforamtion);
        if companyinforamtion.get() then;
        companyinforamtion.CalcFields(Picture);
        //companyinforamtion.picture
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
        TotalAmountIncludingvat: Decimal;
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
        ChargeAmt: Decimal;
        SalesSeteup: Record "Sales & Receivables Setup";
        LineVat: Decimal;

}