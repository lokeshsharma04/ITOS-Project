report 52128 "AME Item Wise Stock Report"
{
    ApplicationArea = All;
    Caption = 'Item Wise Stock Report - Warehouse';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Item Wise Stock Report.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "AME Item Category 1", "AME Item Category 2", "AME Item Category 5", "AME Item Category 6", "AME Item Category 11", "AME Item Category 12";
            PrintOnlyIfDetail = true;

            column(CompanyPicture; CompInfo.Picture) { }
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(CommonItemNo_item; "Common Item No.")
            {
                IncludeCaption = true;
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
            column(AME_Item_Category_1; "AME Item Category 1") { }
            column(AME_Item_Category_2; "AME Item Category 2") { }
            column(AME_Item_Category_3; "AME Item Category 3") { }
            column(AME_Item_Category_4; "AME Item Category 4") { }
            column(ItemNo_BinContent; "No.")
            {
            }
            dataitem("Bin Content"; "Bin Content")
            {
                DataItemLink = "Item No." = field("No.");
                RequestFilterFields = "Zone Code", "Bin Code";
                PrintOnlyIfDetail = true;
                column(Location_Code; "Location Code")
                {
                }
                column(BinCode_BinContent; "Bin Code")
                {
                }

                column(UnitofMeasureCode_BinContent; "Unit of Measure Code")
                {
                }
                column(ZoneCode_BinContent; "Zone Code")
                {
                }
                column(ReportDate; today()) { }
                dataitem("Warehouse Entry"; "Warehouse Entry")
                {
                    DataItemLink = "Location Code" = field("Location Code"), "Bin Code" = field("Bin Code"), "Item No." = field("Item No."), "Variant Code" = field("Variant Code");
                    DataItemTableView = sorting("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Entry Type", "Lot No.", "Serial No.");
                    column(EntryType_WarehouseEntry; "Entry Type")
                    {
                    }
                    column(LotNo_WarehouseEntry; "Lot No.")
                    {
                    }
                    column(VarLotNo; VarLotNo) { }
                    column(Qty___Base_; "Qty. (Base)")
                    {
                    }
                    column(Quantity; Quantity)
                    {
                    }
                    column(BENo; BENo)
                    { }
                    column(Description_WarehouseEntry; ItemDesc)
                    {
                    }

                    column(BOEDate; BOEDate) { }
                    column(ExpiryDate; ExpiryDate) { }
                    trigger OnAfterGetRecord()
                    var
                        LotInf: Record "Lot No. Information";
                        Item: Record Item;
                    begin
                        Clear(BOEDate);
                        Clear(BENo);
                        Clear(VarLotNo);
                        Clear(ExpiryDate);



                        ItemDesc := Description;
                        IF ItemDesc = '' then BEGIN
                            if Item.Get("Warehouse Entry"."Item No.") then
                                ItemDesc := Item.Description;
                        END;

                        LotInF.Reset();
                        LotInF.SetRange("Item No.", "Warehouse Entry"."Item No.");
                        LotInF.SetRange("Lot No.", "Warehouse Entry"."Lot No.");
                        LotInF.SetRange("Variant Code", "Warehouse Entry"."Variant Code");
                        if LotInF.FindFirst() then begin
                            BENo := LotInf."BE No.";
                            BOEDate := LotInf."BOE Date";
                            VarLotNo := LotInf.GetLotNoForPrint();
                            ExpiryDate := LotInf."Expiry Date";
                        end else begin
                            VarLotNo := "Warehouse Entry"."Lot No.";
                            ExpiryDate := "Warehouse Entry"."Expiration Date";
                        end;

                        if (ExpiryBefore <> 0D) then begin
                            // If the user has selected to show only items with expiration dates before a certain date, we need to skip entries where
                            // expiry date is not entered.

                            if ExpiryDate = 0D then
                                CurrReport.Skip();

                            if (ExpiryDate > ExpiryBefore) then
                                CurrReport.Skip();
                        end;

                    end;
                }
            }
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field(ExpiryBefore; ExpiryBefore)
                    {
                        ApplicationArea = all;
                        Caption = 'Expiry Before Date';
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
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    var
        BENo: Text[50];
        BOEDate: Date;
        VarLotNo: Code[20];
        CompInfo: Record "Company Information";
        ExpiryDate: Date;
        ItemDesc: Text[100];
        ExpiryBefore: date;

}
