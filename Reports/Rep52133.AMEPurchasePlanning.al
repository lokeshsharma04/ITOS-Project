report 52140 "AME Purchase Planning"
{
    ApplicationArea = All;
    Caption = 'Purchase Planning';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    ExcelLayout = 'src/Reports/Layout/PurchasePlanning.xlsx';
    RDLCLayout = 'src/Reports/Layout/PurchasePlanning.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(CompanyName;
            COMPANYPROPERTY.DisplayName())
            {
            }
            column(ItemTableCaptItemFilter; TableCaption + ': ' + ItemFilter)
            {
            }

            column(ItemFilter; ItemFilter)
            {
            }
            column(PurchOrdLnPurchLnFilter; StrSubstNo(TableFilterTxt, PurchLineFilter))
            {
            }
            column(PurchLineFilter; PurchLineFilter)
            {
            }
            column(SalesLineTableCaptItemFilter; "Sales Line".TableCaption + ': ' + SalesLineFilter)
            {
            }
            column(AssemblyLineTableCaptItemFilter; "Assembly Line".TableCaption + ': ' + AssemblyLineFilter)
            {
            }
            column(WhseRcptLineTableCaptItemFilter; "Warehouse Receipt Line".TableCaption + ': ' + WarehouseRcptLineFilter)
            {
            }
            column(PickLineFilters; 'Pick Line: ' + PickLineFilters) { }
        }
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Description", "Assembly BOM", "Inventory Posting Group", "Statistics Group", "Bin Filter";
            DataItemTableView = sorting("No.") where(Type = const(Inventory));
            CalcFields = Inventory, "Qty. Picked";

            column(ItemNo; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(Inventory; Inventory) { }
            column(Qty__Picked; "Qty. Picked") { }
            column(Country_Region_of_Origin_Code; "Country/Region of Origin Code") { }
            column(Common_Item_No_; "Common Item No.") { }
            column(Tariff_No_; "Tariff No.") { }
            column(OutstandingAmt_PurchLine; "Purchase Line"."Outstanding Amount")
            {
            }
            column(VariantFilter_Item; "Variant Filter")
            {
            }
            column(LocationFilter_Item; "Location Filter")
            {
            }
            column(GlobalDim1Filter_Item; "Global Dimension 1 Filter")
            {
            }
            column(GlobalDim2Filter_Item; "Global Dimension 2 Filter")
            {
            }
            column(ItemBinFilter; "Bin Filter")
            {
            }
            column(InventoryPurchaseOrdersCaption; InventoryPurchaseOrdersCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(PurchHeaderPaytoNameCaption; PurchHeaderPaytoNameCaptionLbl)
            {
            }
            column(PurchaseLineExpectedReceiptDateCaption; PurchaseLineExpectedReceiptDateCaptionLbl)
            {
            }
            column(BackOrderQtyCaption; BackOrderQtyCaptionLbl)
            {
            }
            column(PurchaseLineLineDiscountCaption; PurchaseLineLineDiscountCaptionLbl)
            {
            }
            column(PurchaseLineInvDiscountAmountCaption; PurchaseLineInvDiscountAmountCaptionLbl)
            {
            }
            column(PurchaseLineOutstandingAmountCaption; PurchaseLineOutstandingAmountCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "No." = field("No."), "Variant Code" = field("Variant Filter"), "Location Code" = field("Location Filter"), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"), "Bin Code" = field("Bin Filter");
                DataItemTableView = sorting("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Expected Receipt Date") where(Type = const(Item), "Document Type" = const(Order), "Outstanding Quantity" = filter(<> 0));
                RequestFilterFields = "Expected Receipt Date";
                RequestFilterHeading = 'Purchase Order Line';
                column(DocumentNo_PurchaseLine; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(PattoName_PurchaseLine; PurchaseHeader."Pay-to Name")
                {
                }
                column(ExpReceiptDt_PurchaseLine; Format("Expected Receipt Date"))
                {
                }
                column(Quantity_PurchaseLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutStandingQty_PurchLine; "Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(Outstanding_Qty___Base_; "Outstanding Qty. (Base)")
                {
                    IncludeCaption = true;
                }
                column(BackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(BackOrderQty_Base; BackOrderQty_Base)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(DirectUnitCost_PurchLine; "Direct Unit Cost")
                {
                    IncludeCaption = true;
                }
                column(LineDiscount_PurchaseLine; "Line Discount %")
                {
                }
                column(InvDiscountAmt_PurchLine; "Inv. Discount Amount")
                {
                }
                column(OutstandingAmt1_PurchLine; "Outstanding Amount")
                {
                }
                column(Description1_Item; ItemDescription)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PurchaseHeader.Get("Document Type", "Document No.");
                    if PurchaseHeader."Currency Factor" <> 0 then
                        "Outstanding Amount" :=
                          Round(
                            CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                              WorkDate(), PurchaseHeader."Currency Code",
                              "Outstanding Amount", PurchaseHeader."Currency Factor"));
                    if "Expected Receipt Date" < WorkDate() then begin
                        BackOrderQty := "Outstanding Quantity";
                        BackOrderQty_Base := "Outstanding Qty. (Base)";
                    end else begin
                        BackOrderQty := 0;
                        BackOrderQty_Base := 0;
                    end;

                end;
            }

            dataitem("Warehouse Receipt Line"; "Warehouse Receipt Line")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = sorting("Item No.", "Location Code", "Variant Code") where("AME Shipment Status" = filter(> 0));
                column(GIT_No_; "No.") { }
                column(GIT_Qty__to_Receive__Base_; "Qty. to Receive (Base)") { }
                column(GIT_Qty__to_Receive; "Qty. to Receive") { }
                column(GIT_Qty__Outstanding__Base_; "Qty. Outstanding (Base)") { }
                column(GIT_Qty__Outstanding; "Qty. Outstanding") { }
                column(Due_Date; "Due Date") { }
            }
            dataitem("Assembly Line"; "Assembly Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Document Type" = const(Order), Type = const(Item), "Remaining Quantity (Base)" = filter(> 0));

                column(Assembly_Document_No_; "Document No.") { }
                column(Assembly_Line_No_; "Line No.") { }
                column(Assembly_Remaining_Quantity__Base_; "Remaining Quantity (Base)")
                {
                    IncludeCaption = true;
                }
                column(Assembly_Quantity__Base_; "Quantity (Base)")
                {
                    IncludeCaption = true;
                }
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "No." = field("No."), "Variant Code" = field("Variant Filter"), "Location Code" = field("Location Filter"), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"), "Bin Code" = field("Bin Filter");
                DataItemTableView = sorting("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date") where("Document Type" = const(Order), Type = const(Item), "Outstanding Quantity" = filter(<> 0));
                RequestFilterFields = "Shipment Date";
                RequestFilterHeading = 'Sales Order Line';
                column(SalesLineDocumentNo; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(SalesHeaderBilltoName; SalesHeader."Bill-to Name")
                {
                }
                column(ShipmentDate_SalesLine; Format("Shipment Date"))
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutstandingQty_SalesLine; "Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(SO_Outstanding_Qty___Base_; "Outstanding Qty. (Base)") { }
                column(SOBackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(SO_BackOrderQty_Base; BackOrderQty_Base)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(SalesLineUnitPrice; "Unit Price")
                {
                    IncludeCaption = true;
                }
                column(SalesLineLineDiscount; "Line Discount %")
                {
                }
                column(InvDiscountAmt_SalesLine; "Inv. Discount Amount")
                {
                }
                column(OutstandingAmt1_SalesLine; "Outstanding Amount")
                {
                }
                column(SalesLineDescription; Description)
                {
                }


                trigger OnAfterGetRecord()
                begin
                    SalesHeader.Get("Document Type", "Document No.");
                    if SalesHeader."Currency Factor" <> 0 then
                        "Outstanding Amount" :=
                          Round(
                            CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                              WorkDate(), SalesHeader."Currency Code", "Outstanding Amount",
                              SalesHeader."Currency Factor"));
                    if "Shipment Date" < WorkDate() then begin
                        BackOrderQty := "Outstanding Quantity";
                        BackOrderQty_Base := "Outstanding Qty. (Base)";
                    end else begin
                        BackOrderQty := 0;
                        BackOrderQty_Base := 0;
                    end;
                end;
            }
            dataitem("Warehouse Activity Line"; "Warehouse Activity Line")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = sorting("Activity Type", "No.", "Line No.") where("Activity Type" = const(Pick), "Action Type" = const(Take));

                column(No_; "No.") { }
                column(Pick_Qty__Outstanding__Base_; "Qty. Outstanding (Base)") { }
                column(Lot_No_; "Lot No.") { }
                column(Expiration_Date; "Expiration Date") { }
            }

            trigger OnAfterGetRecord()
            begin
                ItemDescription := Description;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GetFilters();
        PurchLineFilter := "Purchase Line".GetFilters();
        SalesLineFilter := "Sales Line".GetFilters();
        AssemblyLineFilter := "Assembly Line".GetFilters();
        WarehouseRcptLineFilter := "Warehouse Receipt Line".GetFilters();
        PickLineFilters := "Warehouse Activity Line".GetFilters();
    end;

    var
        CurrencyExchangeRate: Record "Currency Exchange Rate";
        PurchaseHeader: Record "Purchase Header";
        ItemFilter: Text;
        PurchLineFilter: Text;
        SalesLineFilter: Text;
        AssemblyLineFilter: Text;
        PickLineFilters: Text;
        WarehouseRcptLineFilter: Text;
        BackOrderQty: Decimal;
        BackOrderQty_Base: Decimal;
        ItemDescription: Text[100];

        TableFilterTxt: Label 'Purchase Order Line: %1', Comment = '%1 - table filters';
        InventoryPurchaseOrdersCaptionLbl: Label 'Inventory Purchase Orders';
        CurrReportPageNoCaptionLbl: Label 'Page';
        PurchHeaderPaytoNameCaptionLbl: Label 'Vendor';
        PurchaseLineExpectedReceiptDateCaptionLbl: Label 'Expected Receipt Date';
        BackOrderQtyCaptionLbl: Label 'Quantity on Back Order';
        PurchaseLineLineDiscountCaptionLbl: Label 'Line Disc. %';
        PurchaseLineInvDiscountAmountCaptionLbl: Label 'Inv. Discount Amount';
        PurchaseLineOutstandingAmountCaptionLbl: Label 'Amount on Order Incl. VAT';
        TotalCaptionLbl: Label 'Total';

    protected var

        SalesHeader: Record "Sales Header";

}