report 52152 "All Stock & Pick"
{
    ApplicationArea = All;
    Caption = 'Item Stock & Picks';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = AllStockWithPick;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", Description, "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Global Dimension 1 Code", "Global Dimension 2 Code";
            DataItemTableView = sorting("No.") where(Type = const(Inventory));
            column(AMEItemCategory1; "AME Item Category 1")
            {
            }
            column(AMEItemCategory10; "AME Item Category 10")
            {
            }
            column(AMEItemCategory11; "AME Item Category 11")
            {
            }
            column(AMEItemCategory12; "AME Item Category 12")
            {
            }
            column(AMEItemCategory13; "AME Item Category 13")
            {
            }
            column(AMEItemCategory2; "AME Item Category 2")
            {
            }
            column(AMEItemCategory3; "AME Item Category 3")
            {
            }
            column(AMEItemCategory4; "AME Item Category 4")
            {
            }
            column(AMEItemCategory5; "AME Item Category 5")
            {
            }
            column(AMEItemCategory6; "AME Item Category 6")
            {
            }
            column(AMEItemCategory7; "AME Item Category 7")
            {
            }
            column(AMEItemCategory8; "AME Item Category 8")
            {
            }
            column(AMEItemCategory9; "AME Item Category 9")
            {
            }
            column(AMEBOQQty; "AME BOQ Qty.")
            {
            }
            column(AMECartonQty; "AME Carton Qty")
            {
            }
            column(AMECartonUOM; "AME Carton UOM")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(CommonItemNo; "Common Item No.")
            {
            }
            column(TariffNo; "Tariff No.")
            {
            }
            column(AMELongDescription2; "AME Long Description 2")
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(PurchasingBlocked; "Purchasing Blocked")
            {
            }
            column(SalesBlocked; "Sales Blocked")
            {
            }
            column(ATOSStatus; "ATOS Status")
            {
            }
            column(Description; Description) { }
            column(Description_2; "Description 2") { }
            column(No_; "No.") { }
            column(Base_Unit_of_Measure; "Base Unit of Measure") { }

            dataitem("Bin Content"; "Bin Content")
            {
                DataItemLink = "Item No." = field("No.");

                column(ATOComponentsPickQtyBase_BinContent; "ATO Components Pick Qty (Base)")
                {
                }
                column(ATOComponentsPickQty_BinContent; "ATO Components Pick Qty.")
                {
                }
                column(BinCode_BinContent; "Bin Code")
                {
                }
                column(BinRanking_BinContent; "Bin Ranking")
                {
                }
                column(BinTypeCode_BinContent; "Bin Type Code")
                {
                }
                column(BlockMovement_BinContent; "Block Movement")
                {
                }
                column(CrossDockBin_BinContent; "Cross-Dock Bin")
                {
                }
                column(Dedicated_BinContent; Dedicated)
                {
                }
                column(Default_BinContent; Default)
                {
                }
                column(Fixed_BinContent; "Fixed")
                {
                }
                column(ItemNo_BinContent; "Item No.")
                {
                }
                column(LocationCode_BinContent; "Location Code")
                {
                }
                column(MaxQty_BinContent; "Max. Qty.")
                {
                }
                column(MinQty_BinContent; "Min. Qty.")
                {
                }
                column(NegAdjmtQty_BinContent; "Neg. Adjmt. Qty.")
                {
                }
                column(NegativeAdjmtQtyBase_BinContent; "Negative Adjmt. Qty. (Base)")
                {
                }
                column(PickQty_BinContent; "Pick Qty.")
                {
                }
                column(PickQuantityBase_BinContent; "Pick Quantity (Base)")
                {
                }
                column(PosAdjmtQty_BinContent; "Pos. Adjmt. Qty.")
                {
                }
                column(PositiveAdjmtQtyBase_BinContent; "Positive Adjmt. Qty. (Base)")
                {
                }
                column(PutawayQty_BinContent; "Put-away Qty.")
                {
                }
                column(PutawayQuantityBase_BinContent; "Put-away Quantity (Base)")
                {
                }
                column(QtyperUnitofMeasure_BinContent; "Qty. per Unit of Measure")
                {
                }
                column(Quantity_BinContent; Quantity)
                {
                }
                column(QuantityBase_BinContent; "Quantity (Base)")
                {
                }
                column(SystemCreatedAt_BinContent; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_BinContent; SystemCreatedBy)
                {
                }
                column(SystemId_BinContent; SystemId)
                {
                }
                column(SystemModifiedAt_BinContent; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_BinContent; SystemModifiedBy)
                {
                }
                column(UnitofMeasureCode_BinContent; "Unit of Measure Code")
                {
                }
                column(VariantCode_BinContent; "Variant Code")
                {
                }
                column(WarehouseClassCode_BinContent; "Warehouse Class Code")
                {
                }
                column(ZoneCode_BinContent; "Zone Code")
                {
                }
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
        layout(AllStockWithPick)
        {
            Caption = 'All Item Stock & Picks';
            Type = Excel;
            LayoutFile = 'src/Reports/Layout/ItemStockPicks.xlsx';
        }
    }

}
