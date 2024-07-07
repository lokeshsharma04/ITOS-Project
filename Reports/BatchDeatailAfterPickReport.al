report 52125 "AME Batch Detail After Pick"
{
    ApplicationArea = All;
    Caption = 'Batch & Expiry Details Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/BatchExpiryDetailAfterPickReport.RDL';
    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(CominfCountry; Cominf."Country/Region Code") { }
            column(cUSTnAME; cUSTnAME) { }
            column(CustAdd1; CustAdd1) { }
            column(cUSTcITY; cUSTcITY) { }
            column(AME_Commercial_Invoice_No_; "AME Commercial Invoice No.") { }

            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                column(SRnO; SRnO) { }
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Warehouse Shipment Line"."Unit of Measure Code") { }

                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = "Item No." = field("Item No."), "Location Code" = field("Location Code"), "Source ID" = field("Source No."), "Source Ref. No." = field("Source Line No.");
                    // DataItemTableView = where("Source Type" = filter(37), "Source Subtype" = filter(1));


                    column(Qty__Handled; Abs("Reservation Entry".Quantity)) { }
                    column(Lot_No_; LotNO) { }
                    column(Expiration_Date; ExpiryDate) { }
                    column(MfgDate; MfgDate) { }

                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        "Reservation Entry".SetRange("Source Type", "Warehouse Shipment Line"."Source Type");
                        "Reservation Entry".SetRange("Source Subtype", "Warehouse Shipment Line"."Source Subtype");
                    end;

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        LotNO := '';
                        Clear(MfgDate);
                        Clear(ExpiryDate);
                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Reservation Entry"."Item No.");
                        LotInF.SetRange("Lot No.", "Reservation Entry"."Lot No.");
                        LotInF.SetRange("Variant Code", "Reservation Entry"."Variant Code");
                        if LotInF.FindFirst() then begin
                            LotNO := LotInF.GetLotNoForPrint();
                            MfgDate := LotInF."Mfg. Date";
                            ExpiryDate := LotInF."Expiry Date";
                        end;
                    end;
                }
                trigger OnAfterGetRecord()
                var
                begin
                    LotNO := '';
                    SRnO += 1;
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    SalesHeader.SetRange("No.", "Warehouse Shipment Line"."Source No.");
                    if SalesHeader.FindFirst() then begin
                        cUSTnAME := SalesHeader."Sell-to Customer Name";
                        CustADD1 := SalesHeader."Sell-to Address";
                        cUSTcITY := SalesHeader."Sell-to City";
                        CustNo := SalesHeader."Sell-to Customer No.";
                    end;

                end;


            }
            trigger OnAfterGetRecord()
            var
            begin

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

        SRnO: Integer;
        LotInF: Record "Lot No. Information";
        LotNo: Text;
        MfgDate: Date;
        ExpiryDate: Date;
        Cominf: Record "Company Information";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustAdd1: Text[100];
        cUSTnAME: Text[100];
        cUSTcITY: Text[30];
        CustNo: Code[20];
}
