report 52118 "AME Packing List Report"
{
    ApplicationArea = All;
    Caption = 'Packing List Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Packing List Report.RDL';
    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(CominfCountry; Cominf."Country/Region Code") { }
            column(cUSTnAME; cUSTnAME) { }
            column(CustAdd1; CustAdd1) { }
            column(CustAdd2; CustAdd2) { }
            column(cUSTcITY; cUSTcITY) { }
            column(yourRef; yourRef) { }
            column(TransprtM; TransprtM) { }
            column(CustNo; CustNo) { }
            column(ExternalNo; ExternalNo) { }
            column(ShipAdd1; ShipAdd1) { }
            column(ShipAdd2; ShipAdd2) { }
            column(ShipCity; ShipCity) { }
            column(AME_Remarks; "AME Remarks") { }

            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                column(Item_No_; "Item No.") { }
                column(SRnO; SRnO) { }

                column(Line_No_; "Line No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Qty__to_Ship; "Qty. (Base)") { }
                column(Carton_Qty_; "AME Carton Qty.") { }
                column(From_Carton_No_; "AME From Carton No.") { }
                column(To_Carton_No_; "AME To Carton No.") { }
                column(TotalCtn; TotalCtn) { }
                column(NetWeight; NetWeight) { }
                column(GrossWeight; GrossWeight) { }
                column(Volume; Volume) { }
                column(DivisionName; DivisionName) { }


                trigger OnAfterGetRecord()
                var
                    ReservationEntry: Record "Reservation Entry";
                    LotInfo: Record "Lot No. Information";
                begin
                    NetWeight := 0;
                    GrossWeight := 0;
                    Volume := 0;
                    SRnO += 1;
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    SalesHeader.SetRange("No.", "Warehouse Shipment Line"."Source No.");
                    if SalesHeader.FindFirst() then begin
                        cUSTnAME := SalesHeader."Sell-to Customer Name";
                        CustADD1 := SalesHeader."Sell-to Address";
                        CustAdd2 := SalesHeader."Sell-to Address 2";
                        cUSTcITY := SalesHeader."Sell-to City";
                        yourRef := SalesHeader."Your Reference";
                        TransprtM := SalesHeader."Transport Method";
                        CustNo := SalesHeader."Sell-to Customer No.";
                        ExternalNo := SalesHeader."External Document No.";
                        ShipAdd1 := SalesHeader."Ship-to Address";
                        ShipAdd2 := SalesHeader."Ship-to Address 2";
                        ShipCity := SalesHeader."Ship-to City";
                        DivisionName := SalesHeader.GetDivisionName();
                    end;
                    if RecItem.Get("Warehouse Shipment Line"."Item No.") then begin
                        if "AME Carton Qty." <> 0 then
                            TotalCtn := "Warehouse Shipment Line"."Qty. (Base)" / "AME Carton Qty.";
                        if RecItem."Net Weight" <> 0 then
                            NetWeight := "Warehouse Shipment Line"."Qty. (Base)" * RecItem."Net Weight";
                        if RecItem."Gross Weight" <> 0 then
                            GrossWeight := "Warehouse Shipment Line"."Qty. (Base)" * RecItem."Gross Weight";
                        if RecItem."Unit Cost" <> 0 then
                            Volume := "Warehouse Shipment Line"."Qty. (Base)" * RecItem."Unit Volume";
                    end;

                    ReservationEntry.Reset();
                    ReservationEntry.SetCurrentKey("Entry No.");
                    ReservationEntry.SetRange("Source Type", "Warehouse Shipment Line"."Source Type");
                    ReservationEntry.SetRange("Source Subtype", "Warehouse Shipment Line"."Source Subtype");
                    ReservationEntry.SetRange("Source Ref. No.", "Warehouse Shipment Line"."Source Line No.");
                    if ReservationEntry.FindFirst() then
                        repeat
                            if ReservationEntry."Lot No." <> '' then begin
                                if LotInfo.Get(ReservationEntry."Lot No.") then begin
                                    if StrPos(BOEList, ReservationEntry."Lot No.") = 0 then begin
                                        if BOEList <> '' then
                                            BOEList += ',';
                                        BOEList += LotInfo."BE No.";
                                    end;
                                end;
                            end;
                        until ReservationEntry.Next() = 0;
                end;

            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = where(Number = const(1));

                column(BOEList; BOEList) { }
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

        RecItem: Record Item;
        SRnO: Integer;
        TotalCtn: Decimal;
        GrossWeight: Decimal;
        NetWeight: Decimal;

        Volume: Decimal;
        Charges: Decimal;
        ShipMcODE: Record "Shipment Method";
        TransTable: Record "Transport Method";

        PaymentTerms: Record "Payment Terms";
        Cominf: Record "Company Information";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        rate: Decimal;
        Amount: Decimal;
        UOM: Text[50];
        CustAdd1: Text[100];
        CustAdd2: Text[100];
        cUSTnAME: Text[100];
        cUSTcITY: Text[30];
        ShipAdd1: Text[100];
        ShipAdd2: Text[100];
        ShipCity: Text[30];
        pAYTEMcODE: Code[50];
        yourRef: Text[35];
        ExternalNo: Code[50];
        TransprtM: Code[50];
        CustNo: Code[20];
        CurrCode: Code[20];
        PostingdATE: Date;
        CountryRegion: Code[50];
        DivisionName: Text;
        BOEList: Text;
}
