report 52147 "AME Purchase Price List Report"
{
    ApplicationArea = All;
    Caption = 'Purchase Price List - Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = PurchasePriceListHistory;
    dataset
    {
        dataitem(PriceListHeader; "Price List Header")
        {
            DataItemTableView = sorting(Status, "Price Type", "Source Group", "Source Type", "Source No.", "Currency Code", "Starting Date", "Ending Date") where("Price Type" = const(Purchase), "Source Group" = const(Vendor));
            RequestFilterFields = Code, "Source Type", "Source No.", Status, "Starting Date";
            PrintOnlyIfDetail = true;
            column(AllowInvoiceDisc; "Allow Invoice Disc.")
            {
            }
            column(AllowLineDisc; "Allow Line Disc.")
            {
            }
            column(AllowUpdatingDefaults; "Allow Updating Defaults")
            {
            }
            column(AmountType; "Amount Type")
            {
            }
            column(AssigntoNo; "Assign-to No.")
            {
            }
            column(AssigntoParentNo; "Assign-to Parent No.")
            {
            }
            column(Code; "Code")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Description; Description)
            {
            }
            column(EndingDate; "Ending Date")
            {
            }
            column(FilterSourceNo; "Filter Source No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(ParentSourceNo; "Parent Source No.")
            {
            }
            column(PriceIncludesVAT; "Price Includes VAT")
            {
            }
            column(PriceType; "Price Type")
            {
            }
            column(SourceGroup; "Source Group")
            {
            }
            column(SourceID; "Source ID")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(SourceName; PriceListHeader.GetApplyToName()) { }
            column(SourceType; "Source Type")
            {
            }
            column(StartingDate; "Starting Date")
            {
            }
            column(Status; Status)
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(VATBusPostingGrPrice; "VAT Bus. Posting Gr. (Price)")
            {
            }

            dataitem("Price List Line"; "Price List Line")
            {
                RequestFilterFields = "Asset Type", "Asset No.", "Assign-to No.", "Currency Code", "Starting Date", "Ending Date", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "AME Prod. Global Dim. 1", "AME Prod. Global Dim. 2";
                DataItemLink = "Price List Code" = field(Code);
                DataItemTableView = sorting("Asset Type", "Asset No.", "Source Type", "Source No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity") where("Asset Type" = const(Item));

                column(AllowInvoiceDisc_PriceListLine; "Allow Invoice Disc.")
                {
                }
                column(AllowLineDisc_PriceListLine; "Allow Line Disc.")
                {
                }
                column(AMEItemCategory1_PriceListLine; "AME Item Category 1")
                {
                }
                column(AMEItemCategory10_PriceListLine; "AME Item Category 10")
                {
                }
                column(AMEItemCategory11_PriceListLine; "AME Item Category 11")
                {
                }
                column(AMEItemCategory12_PriceListLine; "AME Item Category 12")
                {
                }
                column(AMEItemCategory13_PriceListLine; "AME Item Category 13")
                {
                }
                column(AMEItemCategory2_PriceListLine; "AME Item Category 2")
                {
                }
                column(AMEItemCategory3_PriceListLine; "AME Item Category 3")
                {
                }
                column(AMEItemCategory4_PriceListLine; "AME Item Category 4")
                {
                }
                column(AMEItemCategory5_PriceListLine; "AME Item Category 5")
                {
                }
                column(AMEItemCategory6_PriceListLine; "AME Item Category 6")
                {
                }
                column(AMEItemCategory7_PriceListLine; "AME Item Category 7")
                {
                }
                column(AMEItemCategory8_PriceListLine; "AME Item Category 8")
                {
                }
                column(AMEItemCategory9_PriceListLine; "AME Item Category 9")
                {
                }
                column(AMEProdGlobalDim1_PriceListLine; "AME Prod. Global Dim. 1")
                {
                }
                column(AMEProdGlobalDim2_PriceListLine; "AME Prod. Global Dim. 2")
                {
                }
                column(AmountType_PriceListLine; "Amount Type")
                {
                }
                column(AssetID_PriceListLine; "Asset ID")
                {
                }
                column(AssetNo_PriceListLine; "Asset No.")
                {
                }
                column(AssetType_PriceListLine; "Asset Type")
                {
                }
                column(AssigntoNo_PriceListLine; "Assign-to No.")
                {
                }
                column(AssigntoParentNo_PriceListLine; "Assign-to Parent No.")
                {
                }
                column(CostFactor_PriceListLine; "Cost Factor")
                {
                }
                column(CurrencyCode_PriceListLine; "Currency Code")
                {
                }
                column(Description_PriceListLine; Description)
                {
                }
                column(DirectUnitCost_PriceListLine; "Direct Unit Cost")
                {
                }
                column(EndingDate_PriceListLine; "Ending Date")
                {
                }
                column(LineAmount_PriceListLine; "Line Amount")
                {
                }
                column(LineDiscount_PriceListLine; "Line Discount %")
                {
                }
                column(LineNo_PriceListLine; "Line No.")
                {
                }
                column(MinimumQuantity_PriceListLine; "Minimum Quantity")
                {
                }
                column(ParentSourceNo_PriceListLine; "Parent Source No.")
                {
                }
                column(PriceIncludesVAT_PriceListLine; "Price Includes VAT")
                {
                }
                column(PriceListCode_PriceListLine; "Price List Code")
                {
                }
                column(PriceType_PriceListLine; "Price Type")
                {
                }
                column(ProductNo_PriceListLine; "Product No.")
                {
                }
                column(SourceGroup_PriceListLine; "Source Group")
                {
                }
                column(SourceID_PriceListLine; "Source ID")
                {
                }
                column(SourceNo_PriceListLine; "Source No.")
                {
                }
                column(SourceType_PriceListLine; "Source Type")
                {
                }
                column(StartingDate_PriceListLine; "Starting Date")
                {
                }
                column(Status_PriceListLine; Status)
                {
                }
                column(SystemCreatedAt_PriceListLine; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_PriceListLine; SystemCreatedBy)
                {
                }
                column(SystemId_PriceListLine; SystemId)
                {
                }
                column(SystemModifiedAt_PriceListLine; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_PriceListLine; SystemModifiedBy)
                {
                }
                column(UnitCost_PriceListLine; "Unit Cost")
                {
                }
                column(UnitofMeasureCode_PriceListLine; "Unit of Measure Code")
                {
                }
                column(UnitofMeasureCodeLookup_PriceListLine; "Unit of Measure Code Lookup")
                {
                }
                column(UnitPrice_PriceListLine; "Unit Price")
                {
                }
                column(VariantCode_PriceListLine; "Variant Code")
                {
                }
                column(VariantCodeLookup_PriceListLine; "Variant Code Lookup")
                {
                }
                column(VATBusPostingGrPrice_PriceListLine; "VAT Bus. Posting Gr. (Price)")
                {
                }
                column(VATProdPostingGroup_PriceListLine; "VAT Prod. Posting Group")
                {
                }
                column(WorkTypeCode_PriceListLine; "Work Type Code")
                {
                }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if "Product No." = '' then
                        CurrReport.Skip();
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
        layout(PurchasePriceListHistory)
        {
            Caption = 'Purchase Price List History';
            Type = Excel;
            LayoutFile = 'src/Reports/Layout/PurchasePriceListHistory.xlsx';
        }
    }
}
