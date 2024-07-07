report 52122 "AME Pick Slip Report"
{
    ApplicationArea = All;
    Caption = 'Pick Slip Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Pick Slip Report.RDL';
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) where(Number = const(1));
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CustomerName; CustomerName) { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            dataitem("Warehouse Activity Header"; "Warehouse Activity Header")
            {
                RequestFilterFields = "No.";
                column(No_; "No.") { }
                column(PrintAddtional; PrintAddtional) { }
                column(Starting_Date; AssemblyStartDate) { }
                column(AssemblyItemNo; AssemblyItemNo) { }
                column(AssemblyItemName; AssemblyItemName) { }
                column(AssemblyQtytoCons; AssemblyQtytoCons) { }
                column(NoOfCartons; NoOfCartons) { }
                column(WorkOrderNo; WorkOrderNo) { }
                dataitem("Warehouse Activity Line"; "Warehouse Activity Line")
                {
                    DataItemLink = "Activity Type" = field(Type), "No." = field("No.");
                    DataItemTableView = where("Action Type" = const(Take));
                    column(Item_No_; "Item No.") { }
                    column(Description; Description) { }
                    column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                    column(PickQty; "Qty. to Handle (Base)") { }
                    column(BatchCode; LotNO) { }
                    column(SubInventory; "Zone Code") { }
                    column(Loc; "Bin Code") { }
                    column(SalesOrder; "Source No.") { }
                    column(Expiration_Date; "Expiration Date") { }
                    column(ShelfLife; ShelfLife) { }
                    column(MfgDate; MfgDate) { }
                    column(BENo; BENo) { }
                    column(CountryOrigin; CountryOrigin) { }
                    column(CtnQty; CtnQty) { }
                    column(Totalqty; Totalctn) { }
                    column(SRnO; SRnO) { }
                    column(NetWeight; NetWeight) { }
                    column(GrossWeight; GrossWeight) { }
                    trigger OnAfterGetRecord()
                    var
                    begin
                        SRnO += 1;
                        BENo := '';
                        LotNO := '';
                        CountryOrigin := '';
                        CustomerName := '';
                        Totalctn := 0;
                        NetWeight := 0;
                        GrossWeight := 0;
                        CtnQty := 0;
                        Clear(MfgDate);
                        Clear(CountryOrigin);
                        Clear(ShelfLife);

                        ShelfLife := "Expiration Date" - Today();

                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Warehouse Activity Line"."Item No.");
                        LotInF.SetRange("Lot No.", "Warehouse Activity Line"."Lot No.");
                        LotInF.SetRange("Variant Code", "Warehouse Activity Line"."Variant Code");
                        if LotInF.FindFirst() then begin
                            BENo := LotInF."BE No.";
                            MfgDate := LotInF."Mfg. Date";
                            CountryOrigin := LotInF."Country of Origin";
                            LotNO := LotInF.GetLotNoForPrint();
                        end else begin
                            LotNO := "Warehouse Activity Line"."Lot No."
                        end;
                        if SalesHeader2.GEt(SalesHeader2."Document Type"::Order, "Warehouse Activity Line"."Source No.") then begin
                            CustomerName := SalesHeader2."Sell-to Customer Name";
                        end;

                        if RecItem.Get("Warehouse Activity Line"."Item No.") then begin
                            if RecItem."Net Weight" <> 0 then
                                NetWeight := "Warehouse Activity Line"."Qty. to Handle (Base)" * RecItem."Net Weight";
                            if RecItem."Gross Weight" <> 0 then
                                GrossWeight := "Warehouse Activity Line"."Qty. to Handle (Base)" * RecItem."Gross Weight";
                        end;

                        IF ItemUOM.Get(RecItem."No.", RecItem."AME Carton UOM") then begin
                            CtnQty := ItemUOM."Qty. per Unit of Measure";
                        end;
                        if CtnQty <> 0 then
                            Totalctn := "Qty. to Handle (Base)" / CtnQty;
                    end;
                }
                trigger OnAfterGetRecord()
                var
                    WarehouseActLine: Record "Warehouse Activity Line";
                    AssemblyHeader: Record "Assembly Header";
                begin
                    PrintAddtional := false;
                    AssemblyItemNo := '';
                    AssemblyItemName := '';
                    AssemblyQtytoCons := 0;
                    NoOfCartons := 0;
                    WorkOrderNo := '';
                    Clear(AssemblyStartDate);
                    WarehouseActLine.Reset();
                    WarehouseActLine.SetRange("Activity Type", "Warehouse Activity Header".Type);
                    WarehouseActLine.SetRange("No.", "Warehouse Activity Header"."No.");
                    WarehouseActLine.SetRange("Source Document", WarehouseActLine."Source Document"::"Assembly Consumption");
                    if WarehouseActLine.FindFirst() then begin
                        if AssemblyHeader.Get(AssemblyHeader."Document Type"::Order, WarehouseActLine."Source No.") then begin
                            PrintAddtional := true;
                            WorkOrderNo := AssemblyHeader."No.";
                            AssemblyItemNo := AssemblyHeader."Item No.";
                            AssemblyItemName := AssemblyHeader.Description;
                            AssemblyQtytoCons := AssemblyHeader."Quantity to Assemble (Base)";
                            AssemblyStartDate := AssemblyHeader."Starting Date";
                            if AssemblyQtytoCons <> 0 then
                                NoOfCartons := AssemblyQtytoCons / AssemblyHeader."Qty. per Unit of Measure";
                        end;
                    end;
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

    }
    trigger OnInitReport()
    var
    BEGIN
        if Cominf.get() then;
        Cominf.CalcFields(Picture);
    END;

    var
        CustomerName: Text[100];
        SalesHeader2: Record "Sales Header";
        Cominf: Record "Company Information";
        LotInF: Record "Lot No. Information";
        MfgDate: Date;
        CountryOrigin: Code[50];
        BENo: Text[50];
        LotNO: Text;
        RecItem: Record Item;
        NetWeight: Decimal;
        GrossWeight: Decimal;
        CtnQty: Decimal;
        Totalctn: Decimal;
        SRnO: Integer;
        ItemUOM: Record "Item Unit of Measure";
        PrintAddtional: Boolean;
        AssemblyItemNo: Code[20];
        AssemblyItemName: Text[100];
        AssemblyQtytoCons: Decimal;
        NoOfCartons: Decimal;
        AssemblyStartDate: Date;
        WorkOrderNo: Code[20];
        ShelfLife: Integer;
}
