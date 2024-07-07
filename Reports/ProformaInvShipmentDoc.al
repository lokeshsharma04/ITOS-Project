report 52107 "Proforma Inv (Shipment Doc)"
{
    ApplicationArea = All;
    Caption = 'Proforma Inv (Shipment Doc)';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Proforma Inv (Shipment Doc).RDL';
    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(Location_Code; "Location Code") { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(CominfCountry; Cominf."Country/Region Code") { }
            column(cUSTnAME; cUSTnAME) { }
            column(CustADD; CustADD) { }
            column(cUSTcITY; cUSTcITY) { }
            column(yourRef; yourRef) { }
            column(TransprtM; TransprtM) { }

            column(CurrCode; CurrCode) { }
            column(CustNo; CustNo) { }

            column(ShipM; ShipM) { }
            column(pAYTEMcODE; pAYTEMcODE) { }
            column(CountryRegion; CountryRegion) { }
            column(AmtInWords; AmtInWords) { }
            column(Charges; "AME Chamber Charges") { }
            column(AME_Remarks; "AME Remarks") { }

            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                column(ItemNo_; "No.") { }
                column(Line_No_; "Line No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity; Quantity) { }
                column(Source_No_; "Source No.") { }
                column(Unit_Cost; "AME Unit Cost") { }
                column(Amount; "AME Amount") { }
                column(Discount; Discount) { }
                column(HSCode; HSCode) { }
                column(ItemCOO; ItemCOO) { }
                column(COOList; COOList) { }


                trigger OnAfterGetRecord()
                var
                begin
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    SalesHeader.SetRange("No.", "Warehouse Shipment Line"."Source No.");
                    if SalesHeader.FindFirst() then begin
                        cUSTnAME := SalesHeader."Sell-to Customer Name";
                        CustADD := SalesHeader."Sell-to Address";
                        cUSTcITY := SalesHeader."Sell-to City";
                        yourRef := SalesHeader."Your Reference";
                        ShipM := SalesHeader."Shipment Method Code";
                        TransprtM := SalesHeader."Transport Method";
                        CustNo := SalesHeader."Sell-to Customer No.";
                        CurrCode := SalesHeader."Currency Code";
                        PostingdATE := SalesHeader."Posting Date";
                        CountryRegion := SalesHeader."Sell-to Country/Region Code";
                        pAYTEMcODE := SalesHeader."Prepmt. Payment Terms Code";
                    end;

                    Clear(ItemCOO);
                    Clear(HSCode);
                    if ItemRec.Get("Item No.") then begin
                        HSCode := ItemRec."Tariff No.";

                        ItemCOO := ItemRec."Country/Region of Origin Code";
                        ItemCoo := Utility.GetCountryName(ItemCOO);
                        if ItemCOO <> '' then begin
                            if strpos(COOList, ItemCOO) = 0 then begin
                                if COOList <> '' then
                                    COOList += ', ';
                                COOList += ItemCOO;
                            end;
                        end;

                    end;

                end;

            }
            trigger OnAfterGetRecord()
            var
            begin

                // "Warehouse Shipment Header".CalcFields(l);
                // Utility.FormatNoText(AmtText, "Purchase Header"."Amount Including VAT", "Purchase Header"."Currency Code");
                // "Warehouse Shipment Line".CalcFields("AME Amount");
                // Utility.FormatNoText(AmtText, "Warehouse Shipment Line"."AME Amount", '');
                // AmtInWords := AmtText[1] + AmtText[2];


            end;



        }
    }
    trigger OnInitReport()
    var
    begin
        if Cominf.get() then;
        Cominf.CalcFields(Picture);
    end;

    var
        AmtText: array[2] of Text[100];
        AmtInWords: Text[250];
        Utility: Codeunit "AME Utility";
        Discount: Decimal;
        Charges: Decimal;
        CountryRegio: Record "Country/Region";
        ShipMcODE: Record "Shipment Method";
        TransTable: Record "Transport Method";

        PaymentTerms: Record "Payment Terms";
        Cominf: Record "Company Information";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";

        UOM: Text[50];
        CustADD: Text[100];
        cUSTnAME: Text[100];
        cUSTcITY: Text[30];
        pAYTEMcODE: Code[50];
        yourRef: Text[35];
        ShipM: Code[50];
        TransprtM: Code[50];
        CustNo: Code[20];
        CurrCode: Code[20];
        PostingdATE: Date;
        CountryRegion: Code[50];
        HSCode: Text;
        ItemCOO: Text;
        COOList: Text;
        ItemRec: Record Item;
}
