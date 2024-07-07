report 52120 "AME Purchase Order Report"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Purchase Order Report.RDL';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")

        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(CompVATRegNo; ComInf."VAT Registration No.") { }

            column(VAT_Registration_No_; "VAT Registration No.") { }


            column(Document_Date; "Document Date") { }

            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }

            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.") { }

            column(VendorcountryName; VendorcountryName) { }

            column(Ship_to_Name; "Ship-to Name") { }

            column(Ship_to_Address; "Ship-to Address") { }
            column(ShipcountryName; ShipcountryName) { }

            column(Ship_to_City; "Ship-to City") { }
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(PaycountryName; PaycountryName) { }
            column(Document_Type; "Document Type") { }
            column(Currency_Code; "Currency Code") { }
            column(Payment_Terms_Code; PaymentTerms) { }
            column(Shipment_Method_Code; ShipmentMethod) { }
            column(Your_Reference; "Your Reference") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            column(AmtInWords; AmtInWords) { }
            column(OrderAddressCode; "Purchase Header"."Order Address Code") { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(No_item; "No.")
                {

                }

                column(Description; Description)
                {

                }
                column(Unit_of_Measure; "Unit of Measure Code") { }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }
                column(Line_Amount; "Line Amount") { }
                column(VAT__; "VAT %") { }
                column(SrNo; SrNo) { }
                column(TotalAmt; TotalAmt) { }
                column(VatAmt; VatAmt) { }

                trigger OnAfterGetRecord()
                var
                begin
                    SrNo += 1;
                    VatAmt := 0;
                    VatAmt := "VAT %" * "Line Amount" / 100;
                    TotalAmt := 0;
                    TotalAmt := ("Line Amount" + VatAmt);
                end;

            }
            trigger OnAfterGetRecord()
            var
            begin

                if VendorCountry.Get("Purchase Header"."Buy-from Country/Region Code") then begin
                    VendorcountryName := VendorCountry.Name;
                end;
                if ShipCountry.get("Purchase Header"."Ship-to Country/Region Code") then begin
                    ShipcountryName := ShipCountry.Name;
                end;
                if PayCountry.Get("Purchase Header"."Pay-to Country/Region Code") then begin
                    PaycountryName := PayCountry.Name;
                end;
                if Payment.Get("Purchase Header"."Payment Terms Code") then begin
                    PaymentTerms := Payment.Description;
                end;
                if Shipment.Get("Purchase Header"."Shipment Method Code") then begin
                    ShipmentMethod := Shipment.Description;
                end;

                "Purchase Header".CalcFields("Amount Including VAT");
                Utility.FormatNoText(AmtText, "Purchase Header"."Amount Including VAT", "Purchase Header"."Currency Code");
                AmtInWords := AmtText[1] + AmtText[2];

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
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
        trigger OnInit()
        var
        begin
            if Cominf.get() then;
            Cominf.CalcFields(Picture);
        end;
    }
    var
        SrNo: Integer;
        TotalAmt: Decimal;
        VatAmt: Decimal;

        Cominf: Record "Company Information";
        VendorCountry: Record "Country/Region";
        ShipCountry: Record "Country/Region";
        PayCountry: Record "Country/Region";
        VendorcountryName: Text[50];
        ShipcountryName: Text[50];
        PaycountryName: Text[50];
        Payment: Record "Payment Terms";
        PaymentTerms: Text[100];
        Shipment: Record "Shipment Method";
        ShipmentMethod: Text[100];
        AmtText: array[2] of Text[100];
        AmtInWords: Text[250];
        Utility: Codeunit Utility;


}
