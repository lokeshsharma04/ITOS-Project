report 52143 "Item CO -Discrepancy"
{
    ApplicationArea = All;
    Caption = 'Country of Origin -Discrepancy';
    UsageCategory = ReportsAndAnalysis;

    DefaultRenderingLayout = Default;


    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            DataItemTableView = sorting("No.") where(Type = const(Inventory));
            RequestFilterFields = "No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "AME Item Category 1", "AME Item Category 2", "AME Item Category 5", "AME Item Category 6", "AME Item Category 11", "AME Item Category 12";

            column(CompName; CompInfo.Name)
            {

            }
            column(Picture; CompInfo.Picture)
            {

            }
            column(No_; "No.") { }
            column(Description; Description) { }

            column(Base_Unit_of_Measure; "Base Unit of Measure") { }
            column(Country_Region_of_Origin_Code; "Country/Region of Origin Code") { }
            column(ItemCountryName; ItemCountryName) { }
            column(Tariff_No_; "Tariff No.") { }
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
            column(Blocked; Blocked) { }
            dataitem("Lot No. Information"; "Lot No. Information")
            {
                DataItemLink = "Item No." = field("No.");
                RequestFilterFields = "Item No.", "Variant Code", "Lot No.", "Country of Origin";
                PrintOnlyIfDetail = true;

                column(Lot_No_; "Lot No.") { }
                column(Expiry_Date; "Expiry Date") { }

                column(Country_of_Origin; "Country of Origin") { }
                column(LotCountryName; LotCountryName) { }
                column(Stock; Stock) { }

                dataitem("Warehouse Entry"; "Warehouse Entry")
                {
                    DataItemLink = "Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.");
                    RequestFilterFields = "Zone Code", "Bin Code", "Bin Type Code";

                    column(Zone_Code; "Zone Code") { }
                    column(Bin_Code; "Bin Code") { }
                    column(Qty___Base_; "Qty. (Base)") { }
                    column(Quantity; Quantity) { }
                    column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                    column(AME_Assembly_Order_No_; "AME Assembly Order No.") { }
                    column(Journal_Batch_Name; "Journal Batch Name") { }
                    column(Whse__Document_No_; "Whse. Document No.") { }
                    column(Whse__Document_Type; "Whse. Document Type") { }
                    column(AME_Worksheet_Template_Name; "AME Worksheet Template Name") { }
                    column(AME_Worksheet_Batch_Name; "AME Worksheet Batch Name") { }
                }

                trigger OnAfterGetRecord()

                begin
                    Clear(LotCountryName);
                    Clear(Stock);
                    if CountryREc.Get("Lot No. Information"."Country of Origin") then
                        LotCountryName := CountryREc.Name;

                    if item."Country/Region of Origin Code" = "Lot No. Information"."Country of Origin" then
                        CurrReport.Skip();

                    // Clear(ILE);
                    // ILE.Reset();
                    // ile.SetCurrentKey("Entry No.");
                    // ILE.SetRange("Item No.", "Lot No. Information"."Item No.");
                    // if "Lot No. Information"."Variant Code" <> '' then
                    //     ile.SetRange("Variant Code", "Lot No. Information"."Variant Code");
                    // ile.SetRange("Lot No.", "Lot No. Information"."Lot No.");
                    // ile.SetFilter("Remaining Quantity", '>0');
                    // if ile.FindSet() then begin
                    //     ile.CalcSums("Remaining Quantity");
                    //     Stock := ile."Remaining Quantity";
                    // end;

                end;

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    "Lot No. Information".SetFilter("Country of Origin", '<>%1', Item."Country/Region of Origin Code");
                end;

            }

            trigger OnAfterGetRecord()

            begin
                Clear(ItemCountryName);
                if CountryREc.Get(Item."Country/Region of Origin Code") then
                    ItemCountryName := CountryREc.Name;
            end;
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
        layout(Default)
        {
            Type = RDLC;
            Caption = 'Default';
            LayoutFile = 'src/Reports/Layout/ItemCODescReport.RDL';
        }
        layout(Excel)
        {
            Type = Excel;
            Caption = 'Default';
            LayoutFile = 'src/Reports/Layout/ItemCODescReport.xlsx';
        }
    }

    var
        ItemCountryName: Text;
        LotCountryName: Text;
        CountryREc: Record "Country/Region";

    trigger OnPreReport()

    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        Stock: Decimal;
        ILE: Record "Item Ledger Entry";
}
