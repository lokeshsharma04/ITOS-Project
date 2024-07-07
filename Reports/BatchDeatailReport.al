report 52119 "AME Batch&Expiry Details Rep"
{
    ApplicationArea = All;
    Caption = 'Batch & Expiry Details Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Batch & Expiry Details Report.RDL';
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

            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                PrintOnlyIfDetail = true;
                column(SRnO; SRnO) { }
                dataitem("Warehouse Activity Line"; "Warehouse Activity Line")
                {
                    DataItemLink = "Whse. Document No." = field("No."), "Whse. Document Line No." = field("Line No.");

                    DataItemTableView = where("Action Type" = filter(Take));
                    column(Item_No_; "Item No.") { }
                    column(Description; Description) { }
                    column(Unit_of_Measure_Code; "Unit of Measure Code") { }

                    column(Qty__Handled; "Qty. to Handle") { }
                    column(Lot_No_; LotNO) { }
                    column(Expiration_Date; "Expiration Date") { }
                    column(MfgDate; MfgDate) { }

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        Clear(LotNo);
                        Clear(MfgDate);
                        Clear(LotInF);
                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Warehouse Activity Line"."Item No.");
                        LotInF.SetRange("Lot No.", "Warehouse Activity Line"."Lot No.");
                        LotInF.SetRange("Variant Code", "Warehouse Activity Line"."Variant Code");
                        if LotInF.FindFirst() then begin
                            LotNO := LotInF.GetLotNoForPrint();
                            MfgDate := LotInF."Mfg. Date";
                            if StrPos(BOEList, LotInF."BE No.") = 0 then begin
                                if BOEList <> '' then
                                    BOEList += ',';

                                BOEList += LotInF."BE No.";
                            end;
                        end else
                            LotNo := "Warehouse Activity Line"."Lot No.";
                    end;
                }
                trigger OnAfterGetRecord()
                var
                begin
                    LotNO := '';
                    SRnO += 1;
                    clear(MfgDate);
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
        Cominf: Record "Company Information";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustAdd1: Text[100];
        cUSTnAME: Text[100];
        cUSTcITY: Text[30];
        CustNo: Code[20];
        BOEList: Text;
}
