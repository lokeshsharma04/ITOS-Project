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
            column(PackingListno; "Warehouse Shipment Header"."No.") { }
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

            column(PostingDate_SalesHeader; format("Posting Date", 0, '<Day> <Month Text> <Year4>')) { }
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
            column(AME_Chamber_Charges; "AME Chamber Charges")
            {
                AutoFormatType = 1;
            }
            column(AME_Remarks; "AME Remarks") { }
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemLinkReference = "Warehouse Shipment Header";
                column(OrderNo_SalesHeader; SalesHeader."No.") { }

                column(DocumentNo_SalesLine; "No.") { }
                column(Description2_SalesLine; "Description") { }
                column(LineNo_SalesLine; SalesLine."Line No.") { }
                column(ItemNo_SalesLine; SalesLine."No.") { }
                column(Quantity_SalesLine; "Qty. to Ship") { }
                column(UnitPrice_SalesLine; SalesLine."Unit Price")
                {
                    AutoFormatExpression = SalesLine."Currency Code";
                    AutoFormatType = 1;
                }
                column(Gross_Amt; Gross_Amt) { }
                column(NetValue; NetValue) { }
                column(Description_SalesLine; SalesLine.Description) { }
                column(LineDiscount_SalesLine; SalesLine."Line Discount %") { }
                column(AmountIncludingVAT_SalesLine; VatValue) { }
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
                column(SelltoCustomerNo_SalesHeader; SalesHeader."Sell-to Customer No.") { }
                column(Bill_to_Address; SalesHeader."Bill-to Address") { }
                column(Bill_to_Name; SalesHeader."Bill-to Name") { }
                column(Bill_to_City; SalesHeader."Bill-to City") { }
                column(Salesperson_Code; SalesHeader."Salesperson Code") { }
                column(countryregioncodeName; countryregioncode.Name) { }
                column(countryregionname; countryregioncode.Name) { }
                column(companyinforamtionCountryRegionCode; companyinforamtion."Country/Region Code") { }
                column(paymenttermsDescription; paymentterms.Description) { }
                column(Document_Date; SalesHeader."Document Date") { }
                column(BilltoName_SalesHeader; SalesHeader."Bill-to Name") { }
                column(BilltoAddress_SalesHeader; SalesHeader."Bill-to Address") { }
                column(BilltoAddress2_SalesHeader; SalesHeader."Bill-to Address 2") { }
                column(DueDate_SalesHeader; format("Due Date", 0, '<Day> <Month Text> <Year4>')) { }
                column(DocumentDate_SalesHeader; format(SalesHeader."Document Date", 0, '<Day> <Month Text> <Year4>')) { }
                column(PaymentTermsCode_SalesHeader; paymentterms.Code) { }
                column(BilltoCounty_SalesHeader; SalesHeader."Bill-to County") { }
                column(BilltoPostCode_SalesHeader; SalesHeader."Bill-to Post Code") { }
                column(BilltoContactNo_SalesHeader; SalesHeader."Bill-to Contact No.") { }
                column(BilltoCity_SalesHeader; SalesHeader."Bill-to City") { }
                column(ShiptoName_SalesHeader; SalesHeader."Ship-to Name") { }
                column(ShiptoAddress_SalesHeader; SalesHeader."Ship-to Address") { }
                column(ShiptoAddress2_SalesHeader; SalesHeader."Ship-to Address 2") { }
                column(ShiptoCounty_SalesHeader; SalesHeader."Ship-to County") { }
                column(ShiptoPostCode_SalesHeader; SalesHeader."Ship-to Post Code") { }
                column(ShiptoContact_SalesHeader; SalesHeader."Ship-to Contact") { }
                column(ShiptoCity_SalesHeader; SalesHeader."Ship-to City") { }
                column(CountryName; Country.Name) { }
                column(CurrencyCode_SalesHeader; SalesHeader."Currency Code") { }

                column(LineDisAmtSalesLine; LineAmt) { }

                column(HSCode; HSCode) { }

                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = "Item No." = field("Item No."), "Location Code" = field("Location Code"), "Source ID" = field("Source No."), "Source Ref. No." = field("Source Line No.");
                    DataItemTableView = where("Source Type" = filter(37), "Source Subtype" = filter(1));
                    column(Lot_No_; LotNO) { }
                    column(Serial_No_; "Serial No.") { }
                    column(Expiration_Date; "Expiration Date") { }
                    column(ExpiryDate; ExpiryDate) { }
                    column(Mfg_Date; MfgDate) { }
                    Column(TracSpec_Quantity__Base_; Abs("Quantity")) { }
                    column(Origin; Origin) { }


                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        LotNO := '';
                        Clear(MfgDate);
                        Clear(ExpiryDate);
                        Clear(Origin);
                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Reservation Entry"."Item No.");
                        LotInF.SetRange("Lot No.", "Reservation Entry"."Lot No.");
                        LotInF.SetRange("Variant Code", "Reservation Entry"."Variant Code");
                        if LotInF.FindFirst() then begin
                            LotNO := LotInF.GetLotNoForPrint();
                            MfgDate := LotInF."Mfg. Date";
                            ExpiryDate := LotInF."Expiry Date";
                            AmeUtility.UpdateCountryOfOriginList(LotInF."Country of Origin", Origin, CooList);
                        end;
                    end;
                }

                trigger OnPreDataItem()
                begin
                    srno := 0;
                    totalvat := 0;
                    totalvat1 := 0;
                    TotalQty := 0;
                    TotalVatValue := 0;
                    TotalValue := 0;
                end;

                trigger OnAfterGetRecord()
                var
                    recitem: record Item;
                begin
                    //TODO: to be checked why manual assignment
                    ClearVariable();
                    srno += 1;
                    if SalesHeader.Get("Source Subtype", "Source No.") then begin
                        SalesHeader.CalcFields("Amount Including VAT");
                        DivisionName := SalesHeader.GetDivisionName();

                        if paymentterms.get(SalesHeader."Payment Terms Code") then;
                        if countryregioncode.get(companyinforamtion."Country/Region Code") then;
                        if Country.Get(customer."Country/Region Code") then;
                        if Shipment.Get(SalesHeader."Shipment Method Code") then;
                        if Transport.Get(SalesHeader."Transport Method") then;
                        if SalesLine.Get("Source Subtype", "Source No.", "Source Line No.") then begin
                            totalvat := Round(SalesLine."VAT %" * SalesLine."Line Amount" / 100, 0.01);
                            SalesLine.CalculateValuesForQty("Warehouse Shipment Line"."Qty. to Ship", Gross_amt, DiscountAmt, LineAmt, VatValue, NetValue);

                            TotalQty += "Warehouse Shipment Line"."Qty. to Ship";
                            TotalValue += LineAmt;
                            TotalVatValue += NetValue;

                            if RecItem.Get("Item No.") then begin
                                HSCode := RecItem."Tariff No.";
                            end;
                        end;

                    end;
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = where(Number = const(1));
                column(CooList; CooList) { }
                column(TotalQty; TotalQty) { }
                column(TotalValue; TotalValue) { }
                column(TotalVatValue; TotalVatValue) { }
                column(AmtInWords; AmtInWords) { }
                column(DivisionName; DivisionName) { }
                column(TotalCharges; TotalCharges) { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin

                    Utility.FormatNoText(AmtText, TotalVatValue + TotalCharges, SalesHeader."Currency Code");
                    AmtInWords := AmtText[1] + AmtText[2];

                end;
            }
            trigger OnAfterGetRecord()
            begin
                TotalQty := 0;
                TotalValue := 0;
                TotalVatValue := 0;
                TotalCharges := 0;

                TotalCharges := "AME Chamber Charges";

                Clear(DivisionName);
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

    local procedure ClearVariable()
    begin
        HSCode := '';
        totalvat := 0;
        LineAmt := 0;
        AmtInWords := '';
        Origin := '';
        Gross_amt := 0;
        DiscountAmt := 0;
        VatValue := 0;
        NetValue := 0;
        Clear(paymentterms);
        Clear(countryregioncode);
        Clear(Country);
        Clear(Shipment);
        Clear(Transport);
        Clear(SalesLine);
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
        LineAmt: Decimal;
        Gross_amt: Decimal;
        DiscountAmt: Decimal;
        VatValue: Decimal;
        NetValue: Decimal;
        LotInF: Record "Lot No. Information";
        LotNo: Text;
        MfgDate: Date;
        ExpiryDate: Date;
        CountryReg: Record "Country/Region";
        CooList: Text;
        AmeUtility: Codeunit "AME Utility";
        DivisionName: Text;
        TotalCharges: Decimal;

}