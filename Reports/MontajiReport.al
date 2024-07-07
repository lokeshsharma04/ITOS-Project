report 52129 "AME Montaji Report"
{
    ApplicationArea = All;
    Caption = 'Montaji Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Montaji Report.RDL';
    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(CominfName; CompInfo.Name) { }
            column(CominfPic; CompInfo.Picture) { }
            column(CominfCountry; CountryReg) { }
            column(ShowDetail; HideItemWiseTotal) { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemTableView = sorting("Item No.");
                column(Item_No_; "Item No.") { }
                column(Description_WhseShipmentLine; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Qty___Base_; "Qty. (Base)") { }
                column(Carton_Qty_; "AME Carton Qty.") { }
                column(From_Carton_No_; "AME From Carton No.") { }
                column(To_Carton_No_; "AME To Carton No.") { }
                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = "Item No." = field("Item No."), "Location Code" = field("Location Code"), "Source ID" = field("Source No."), "Source Ref. No." = field("Source Line No.");
                    DataItemTableView = sorting("Item No.", "Lot No.") where("Source Type" = filter(37), "Source Subtype" = filter(1));

                    column(BatchNo; BatchNo) { }
                    column(MfgDate; MfgDate) { }
                    column(ExpiryDate; ExpiryDate) { }
                    column(Product_BarCode; Product_BarCode) { }
                    column(HSCode; HSCode) { }
                    column(Item_Qty; Item_Qty) { }
                    column(Item_Unit_Gross_Weight; Item_Unit_Gross_Weight) { }
                    column(Item_Total_Gross_Weight; Item_Total_Gross_Weight) { }
                    trigger OnAfterGetRecord()
                    var
                        LotInF: Record "Lot No. Information";
                        Item: Record Item;
                        CountryRegion: Record "Country/Region";
                    begin
                        ClearVar();
                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Reservation Entry"."Item No.");
                        LotInF.SetRange("Variant Code", "Reservation Entry"."Variant Code");
                        LotInF.SetRange("Lot No.", "Reservation Entry"."Lot No.");
                        if LotInF.FindFirst() then begin
                            BatchNo := LotInF.GetLotNoForPrint();
                            MfgDate := LotInF."Mfg. Date";
                            ExpiryDate := LotInF."Expiry Date";
                            if CountryRegion.Get(LotInF."Country of Origin") then
                                CountryReg := CountryRegion.Name;
                        end else
                            BatchNo := "Lot No.";

                        Item_Qty := ABS("Reservation Entry"."Quantity (Base)");
                        if Item.Get("Item No.") then begin
                            HSCode := Item."Tariff No.";
                            Item_Unit_Gross_Weight := Item."Gross Weight";
                            Item_Total_Gross_Weight := Item_Unit_Gross_Weight * Item_Qty;
                            Product_BarCode := Item."Common Item No.";
                        end;
                    end;
                }
                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    ReservationEntry: Record "Reservation Entry";
                begin
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Detail)
                {
                    field(ShowDetail; HideItemWiseTotal)
                    {
                        ApplicationArea = all;
                        Caption = 'Hide Detail';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    var
    begin
        if CompInfo.get() then;
        CompInfo.CalcFields(Picture);
    end;

    local procedure ClearVar()
    begin
        clear(HSCode);
        clear(BatchNo);
        clear(Item_Total_Gross_Weight);
        clear(Item_Unit_Gross_Weight);
        clear(BatchNo);
        clear(ExpiryDate);
        clear(MfgDate);
        Clear(Product_BarCode);
        Clear(Item_Qty);
        Clear(CountryReg);
    end;

    var
        Product_BarCode: code[20];
        CompInfo: Record "Company Information";
        HSCode: Code[20];
        ExpiryDate: Date;
        MfgDate: Date;
        BatchNo: Code[20];
        Item_Qty: Decimal;
        Item_Unit_Gross_Weight: Decimal;
        Item_Total_Gross_Weight: Decimal;
        HideItemWiseTotal: Boolean;
        CountryReg: code[20];
}
