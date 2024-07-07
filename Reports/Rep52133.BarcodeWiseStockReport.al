report 52141 "Barcode Wise Stock Report"
{
    ApplicationArea = All;
    Caption = 'Barcode Wise Stock Report';
    UsageCategory = ReportsAndAnalysis;
    // DefaultLayout = RDLC;
    // RDLCLayout = 'src/Reports/Layout/BarcodeWiseStockReport.RDL';
    DefaultRenderingLayout = BarcodeWiseStock;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture)
            { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            column(ReportCap; ReportCap) { }
            column(ReportFilter; ReportFilter) { }

            dataitem(item; item)
            {
                PrintOnlyIfDetail = true;
                RequestFilterFields = "Common Item No.", "No.", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Global Dimension 1 Code", "Global Dimension 2 Code", "Tariff No.";
                column(CommonItemNo_item; "Common Item No.")
                {
                    IncludeCaption = true;
                }
                column(ItemNo_; "No.") { }
                column(Common_Item_No_; "Common Item No.") { }
                column(Description; Description) { }
                column(UnitofMeasureCode; "Base Unit of Measure") { }
                column(Tariff_No_; "Tariff No.")
                {
                    IncludeCaption = true;
                }
                column(Qty__on_Sales_Order; "Qty. on Sales Order") { }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
                column(AME_Item_Category_1; "AME Item Category 1") { }
                column(AME_Item_Category_2; "AME Item Category 2") { }
                column(AME_Item_Category_3; "AME Item Category 3") { }
                column(AME_Item_Category_4; "AME Item Category 4") { }
                dataitem("Lot No. Information"; "Lot No. Information")
                {
                    DataItemLink = "Item No." = field("No.");
                    column(LotNo_; "Lot No.") { }
                    column(ExpirationDate; "Expiry Date") { }
                    column(PickQty; PickQty) { }
                    column(StockQty; StockQty) { }
                    column(BalanceAfterPick; BalanceAfterPick) { }
                    column(BE_No_; "BE No.") { }
                    column(BOE_Date; "BOE Date") { }
                    column(Mfg__Date; "Mfg. Date") { }
                    trigger OnAfterGetRecord()
                    var
                        ItemLedgEntry: Record "Item Ledger Entry";
                        WhseActivityLine: Record "Warehouse Activity Line";
                    begin
                        PickQty := 0;
                        StockQty := 0;
                        ItemLedgEntry.Reset();
                        ItemLedgEntry.SetRange("Item No.", item."No.");
                        ItemLedgEntry.SetRange("Lot No.", "Lot No. Information"."Lot No.");
                        ItemLedgEntry.SetRange(Open, true);
                        ItemLedgEntry.SetFilter("Remaining Quantity", '<>%1', 0);
                        if ItemLedgEntry.FindSet() then begin
                            // if "Expiry Date" = 0D then
                            "Expiry Date" := ItemLedgEntry."Expiration Date";
                            ItemLedgEntry.CalcSums("Remaining Quantity");
                            StockQty := ItemLedgEntry."Remaining Quantity";
                        end;

                        WhseActivityLine.Reset();
                        WhseActivityLine.SetRange("Activity Type", WhseActivityLine."Activity Type"::Pick);
                        WhseActivityLine.SetRange("Action Type", WhseActivityLine."Action Type"::Take);
                        WhseActivityLine.SetRange("Lot No.", "Lot No. Information"."Lot No.");
                        WhseActivityLine.SetRange("Item No.", Item."No.");
                        if WhseActivityLine.FindSet() then begin
                            WhseActivityLine.CalcSums("Qty. (Base)");
                            PickQty := WhseActivityLine."Qty. (Base)";
                        end;
                        BalanceAfterPick := StockQty - PickQty;
                    end;
                }
                trigger OnAfterGetRecord()
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
    rendering
    {
        layout(BarcodeWiseStock)
        {
            Type = Excel;
            Caption = 'Barcode Wise Stock - Excel';
            LayoutFile = 'src/Reports/Layout/BarcodeWiseStockReport.xlsx';
        }
        layout(BarcodeWiseStockPrint)
        {
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/BarcodeWiseStockReport.RDL';
            Caption = 'Barcode Wise Stock - Print';
        }
    }
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    trigger OnPreReport()
    begin
        ReportFilter := '';
        if item.GetFilters() <> '' then
            ReportFilter := item.GetFilters();
        if "Lot No. Information".GetFilters() <> '' then
            ReportFilter += ' ' + "Lot No. Information".GetFilters();
    end;

    var
        CompInfo: Record "Company Information";
        ReportCap: Label 'Barcode Wise Stock Report';
        ExpiryDate: Date;
        BatchNo: Code[20];
        PickQty: Decimal;
        StockQty: Decimal;
        BalanceAfterPick: Decimal;
        ReportFilter: text;

}
