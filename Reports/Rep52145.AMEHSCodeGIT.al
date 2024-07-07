report 52151 "AME HS Code - GIT"
{
    ApplicationArea = All;
    Caption = 'HS Code - GIT';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = HSCodeGIT;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.", "Buy-from Vendor No.", "Buy-from Vendor Name", "Currency Code";
            DataItemTableView = sorting("No.", "Document Type") where("Document Type" = const(Order));
            PrintOnlyIfDetail = true;

            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Currency_Code; "Currency Code") { }
            column(Order_Date; "Order Date") { }
            column(AME_Price_Date; "AME Price Date") { }
            column(AME_Purch__Order_Type; "AME Purch. Order Type") { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where(Type = const(Item), "Outstanding Quantity" = filter(<> 0));
                PrintOnlyIfDetail = true;
                RequestFilterFields = "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Expected Receipt Date", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4";

                column(AMEItemCategory1_PurchaseLine; "AME Item Category 1")
                {
                }
                column(AMEItemCategory2_PurchaseLine; "AME Item Category 2")
                {
                }
                column(AMEItemCategory3_PurchaseLine; "AME Item Category 3")
                {
                }
                column(AMEItemCategory4_PurchaseLine; "AME Item Category 4")
                {
                }
                column(ShortcutDimension1Code_PurchaseLine; "Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_PurchaseLine; "Shortcut Dimension 2 Code")
                {
                }
                column(No_PurchaseLine; "No.")
                {
                }
                column(Description_PurchaseLine; Description)
                {
                }
                column(Quantity_PurchaseLine; Quantity)
                {
                }
                column(QuantityBase_PurchaseLine; "Quantity (Base)")
                {
                }
                column(OutstandingQuantity_PurchaseLine; "Outstanding Quantity")
                {
                }
                column(OutstandingQtyBase_PurchaseLine; "Outstanding Qty. (Base)")
                {
                }
                column(ExpectedReceiptDate_PurchaseLine; "Expected Receipt Date")
                {
                }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Common_Item_No; ItemRec."Common Item No.") { }
                column(Net_Weight; ItemRec."Net Weight") { }
                column(Gross_Weight; ItemRec."Gross Weight") { }
                column(Tariff_No; ItemRec."Tariff No.") { }
                column(Carton_Qty; ItemRec."AME Carton Qty") { }
                column(Carton_UOM; ItemRec."AME Carton UOM") { }
                column(Item_Country_Region_of_Origin_Code; ItemRec."Country/Region of Origin Code") { }
                column(NetUnitCost; NetUnitCost) { }

                dataitem("Warehouse Receipt Line"; "Warehouse Receipt Line")
                {
                    DataItemLink = "Source No." = field("Document No."), "Source Line No." = field("Line No.");
                    DataItemTableView = sorting("No.", "Line No.") where("Source Type" = const(39), "Source Subtype" = const(1), "AME Shipment Status" = filter(> 0));


                    column(ActualQty_WarehouseReceiptLine; "Actual Qty")
                    {
                    }
                    column(ActualQtyBase_WarehouseReceiptLine; "Actual Qty (Base)")
                    {
                    }
                    column(AMEItemCategory1_WarehouseReceiptLine; "AME Item Category 1")
                    {
                    }
                    column(AMEItemCategory10_WarehouseReceiptLine; "AME Item Category 10")
                    {
                    }
                    column(AMEItemCategory11_WarehouseReceiptLine; "AME Item Category 11")
                    {
                    }
                    column(AMEItemCategory12_WarehouseReceiptLine; "AME Item Category 12")
                    {
                    }
                    column(AMEItemCategory13_WarehouseReceiptLine; "AME Item Category 13")
                    {
                    }
                    column(AMEItemCategory2_WarehouseReceiptLine; "AME Item Category 2")
                    {
                    }
                    column(AMEItemCategory3_WarehouseReceiptLine; "AME Item Category 3")
                    {
                    }
                    column(AMEItemCategory4_WarehouseReceiptLine; "AME Item Category 4")
                    {
                    }
                    column(AMEItemCategory5_WarehouseReceiptLine; "AME Item Category 5")
                    {
                    }
                    column(AMEItemCategory6_WarehouseReceiptLine; "AME Item Category 6")
                    {
                    }
                    column(AMEItemCategory7_WarehouseReceiptLine; "AME Item Category 7")
                    {
                    }
                    column(AMEItemCategory8_WarehouseReceiptLine; "AME Item Category 8")
                    {
                    }
                    column(AMEItemCategory9_WarehouseReceiptLine; "AME Item Category 9")
                    {
                    }
                    column(AMERemarks_WarehouseReceiptLine; "AME Remarks")
                    {
                    }
                    column(AMEShipmentStatus_WarehouseReceiptLine; "AME Shipment Status")
                    {
                    }
                    column(AMEVendorName_WarehouseReceiptLine; "AME Vendor Name")
                    {
                    }
                    column(AMEVendorNo_WarehouseReceiptLine; "AME Vendor No.")
                    {
                    }
                    column(BinCode_WarehouseReceiptLine; "Bin Code")
                    {
                    }
                    column(CrossDockBinCode_WarehouseReceiptLine; "Cross-Dock Bin Code")
                    {
                    }
                    column(CrossDockZoneCode_WarehouseReceiptLine; "Cross-Dock Zone Code")
                    {
                    }
                    column(Cubage_WarehouseReceiptLine; Cubage)
                    {
                    }
                    column(CurrencyCode_WarehouseReceiptLine; "Currency Code")
                    {
                    }
                    column(DamagedQty_WarehouseReceiptLine; "Damaged Qty")
                    {
                    }
                    column(DamagedQtyBase_WarehouseReceiptLine; "Damaged Qty (Base)")
                    {
                    }
                    column(Description_WarehouseReceiptLine; Description)
                    {
                    }
                    column(Description2_WarehouseReceiptLine; "Description 2")
                    {
                    }
                    column(DueDate_WarehouseReceiptLine; "Due Date")
                    {
                    }
                    column(ExcessQty_WarehouseReceiptLine; "Excess Qty")
                    {
                    }
                    column(ExcessQtyBase_WarehouseReceiptLine; "Excess Qty (Base)")
                    {
                    }
                    column(InvoiceQty_WarehouseReceiptLine; "Invoice Qty")
                    {
                    }
                    column(ItemNo_WarehouseReceiptLine; "Item No.")
                    {
                    }
                    column(LandedCost_WarehouseReceiptLine; "Landed Cost %")
                    {
                    }
                    column(LandedCostAmt_WarehouseReceiptLine; "Landed Cost Amt.")
                    {
                    }
                    column(LineAmount_WarehouseReceiptLine; "Line Amount")
                    {
                    }
                    column(LineAmountLCY_WarehouseReceiptLine; "Line Amount (LCY)")
                    {
                    }
                    column(LineNo_WarehouseReceiptLine; "Line No.")
                    {
                    }
                    column(LocationCode_WarehouseReceiptLine; "Location Code")
                    {
                    }
                    column(No_WarehouseReceiptLine; "No.")
                    {
                    }
                    column(NotupdbySrcDocPost_WarehouseReceiptLine; "Not upd. by Src. Doc. Post.")
                    {
                    }
                    column(OverReceiptCode_WarehouseReceiptLine; "Over-Receipt Code")
                    {
                    }
                    column(OverReceiptQuantity_WarehouseReceiptLine; "Over-Receipt Quantity")
                    {
                    }
                    column(PostingfromWhseRef_WarehouseReceiptLine; "Posting from Whse. Ref.")
                    {
                    }
                    column(QtyBase_WarehouseReceiptLine; "Qty. (Base)")
                    {
                    }
                    column(QtyOutstanding_WarehouseReceiptLine; "Qty. Outstanding")
                    {
                    }
                    column(QtyOutstandingBase_WarehouseReceiptLine; "Qty. Outstanding (Base)")
                    {
                    }
                    column(QtyperUnitofMeasure_WarehouseReceiptLine; "Qty. per Unit of Measure")
                    {
                    }
                    column(QtyReceived_WarehouseReceiptLine; "Qty. Received")
                    {
                    }
                    column(QtyReceivedBase_WarehouseReceiptLine; "Qty. Received (Base)")
                    {
                    }
                    column(QtyRoundingPrecision_WarehouseReceiptLine; "Qty. Rounding Precision")
                    {
                    }
                    column(QtyRoundingPrecisionBase_WarehouseReceiptLine; "Qty. Rounding Precision (Base)")
                    {
                    }
                    column(QtytoCrossDock_WarehouseReceiptLine; "Qty. to Cross-Dock")
                    {
                    }
                    column(QtytoCrossDockBase_WarehouseReceiptLine; "Qty. to Cross-Dock (Base)")
                    {
                    }
                    column(QtytoReceive_WarehouseReceiptLine; "Qty. to Receive")
                    {
                    }
                    column(QtytoReceiveBase_WarehouseReceiptLine; "Qty. to Receive (Base)")
                    {
                    }
                    column(Quantity_WarehouseReceiptLine; Quantity)
                    {
                    }
                    column(ShelfNo_WarehouseReceiptLine; "Shelf No.")
                    {
                    }
                    column(ShortQty_WarehouseReceiptLine; "Short Qty")
                    {
                    }
                    column(ShortQtyBase_WarehouseReceiptLine; "Short Qty (Base)")
                    {
                    }
                    column(SortingSequenceNo_WarehouseReceiptLine; "Sorting Sequence No.")
                    {
                    }
                    column(SourceDocument_WarehouseReceiptLine; "Source Document")
                    {
                    }
                    column(SourceLineNo_WarehouseReceiptLine; "Source Line No.")
                    {
                    }
                    column(SourceNo_WarehouseReceiptLine; "Source No.")
                    {
                    }
                    column(SourceSubtype_WarehouseReceiptLine; "Source Subtype")
                    {
                    }
                    column(SourceType_WarehouseReceiptLine; "Source Type")
                    {
                    }
                    column(StartingDate_WarehouseReceiptLine; "Starting Date")
                    {
                    }
                    column(Status_WarehouseReceiptLine; Status)
                    {
                    }
                    column(SystemCreatedAt_WarehouseReceiptLine; SystemCreatedAt)
                    {
                    }
                    column(SystemCreatedBy_WarehouseReceiptLine; SystemCreatedBy)
                    {
                    }
                    column(SystemId_WarehouseReceiptLine; SystemId)
                    {
                    }
                    column(SystemModifiedAt_WarehouseReceiptLine; SystemModifiedAt)
                    {
                    }
                    column(SystemModifiedBy_WarehouseReceiptLine; SystemModifiedBy)
                    {
                    }
                    column(UnitCost_WarehouseReceiptLine; "Purchase Line"."Direct Unit Cost")
                    {
                    }
                    column(UnitofMeasureCode_WarehouseReceiptLine; "Unit of Measure Code")
                    {
                    }
                    column(VariantCode_WarehouseReceiptLine; "Variant Code")
                    {
                    }
                    column(Weight_WarehouseReceiptLine; Weight)
                    {
                    }
                    column(ZoneCode_WarehouseReceiptLine; "Zone Code")
                    {
                    }
                    column(NoOfCarton; NoOfCarton) { }

                    dataitem("Warehouse Receipt Header"; "Warehouse Receipt Header")
                    {
                        DataItemLink = "No." = field("No.");
                        RequestFilterFields = "BL_No", "Supp_Invoice_No", "Supp_Invoice_Date", "Expected_Receipt_Date";

                        column(AMETransportMethod_WarehouseReceiptHeader;
                        "AME Transport Method")
                        {
                        }
                        column(AssignedUserID_WarehouseReceiptHeader; "Assigned User ID")
                        {
                        }
                        column(AssignmentDate_WarehouseReceiptHeader; "Assignment Date")
                        {
                        }
                        column(AssignmentTime_WarehouseReceiptHeader; "Assignment Time")
                        {
                        }
                        column(BinCode_WarehouseReceiptHeader; "Bin Code")
                        {
                        }
                        column(BL_No_WarehouseReceiptHeader; BL_No)
                        {
                        }
                        column(BOEDate_WarehouseReceiptHeader; "BOE Date")
                        {
                        }
                        column(BOENo_WarehouseReceiptHeader; "BOE No.")
                        {
                        }
                        column(Comment_WarehouseReceiptHeader; Comment)
                        {
                        }
                        column(CreatePostedHeader_WarehouseReceiptHeader; "Create Posted Header")
                        {
                        }
                        column(CrossDockBinCode_WarehouseReceiptHeader; "Cross-Dock Bin Code")
                        {
                        }
                        column(CrossDockZoneCode_WarehouseReceiptHeader; "Cross-Dock Zone Code")
                        {
                        }
                        column(DocumentStatus_WarehouseReceiptHeader; "Document Status")
                        {
                        }
                        column(Expected_Receipt_Date_WarehouseReceiptHeader; Expected_Receipt_Date)
                        {
                        }
                        column(LastReceivingNo_WarehouseReceiptHeader; "Last Receiving No.")
                        {
                        }
                        column(LocationCode_WarehouseReceiptHeader; "Location Code")
                        {
                        }
                        column(No_WarehouseReceiptHeader; "No.")
                        {
                        }
                        column(NoSeries_WarehouseReceiptHeader; "No. Series")
                        {
                        }
                        column(PostingDate_WarehouseReceiptHeader; "Posting Date")
                        {
                        }
                        column(ReceivingNo_WarehouseReceiptHeader; "Receiving No.")
                        {
                        }
                        column(ReceivingNoSeries_WarehouseReceiptHeader; "Receiving No. Series")
                        {
                        }
                        column(ShipmentStatus_WarehouseReceiptHeader; "Shipment Status")
                        {
                        }
                        column(SortingMethod_WarehouseReceiptHeader; "Sorting Method")
                        {
                        }
                        column(Supp_Invoice_Date_WarehouseReceiptHeader; Supp_Invoice_Date)
                        {
                        }
                        column(Supp_Invoice_No_WarehouseReceiptHeader; Supp_Invoice_No)
                        {
                        }
                        column(SystemCreatedAt_WarehouseReceiptHeader; SystemCreatedAt)
                        {
                        }
                        column(SystemCreatedBy_WarehouseReceiptHeader; SystemCreatedBy)
                        {
                        }
                        column(SystemId_WarehouseReceiptHeader; SystemId)
                        {
                        }
                        column(SystemModifiedAt_WarehouseReceiptHeader; SystemModifiedAt)
                        {
                        }
                        column(SystemModifiedBy_WarehouseReceiptHeader; SystemModifiedBy)
                        {
                        }
                        column(VendorShipmentNo_WarehouseReceiptHeader; "Vendor Shipment No.")
                        {
                        }
                        column(ZoneCode_WarehouseReceiptHeader; "Zone Code")
                        {
                        }
                    }

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        Clear(NoOfCarton);

                        if ItemRec."AME Carton Qty" <> 0 then
                            NoOfCarton := "Warehouse Receipt Line"."Qty. to Receive (Base)" / ItemRec."AME Carton Qty";
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(ItemRec);
                    Clear(NetUnitCost);
                    if "Purchase Line".Type = "Purchase Line".Type::Item then begin
                        ItemRec.Get("Purchase Line"."No.");
                        ItemRec.CalcFields("AME Carton Qty");
                    end;


                    if "Purchase Line"."Outstanding Quantity" <> 0 then
                        NetUnitCost := "Purchase Line"."Outstanding Amount" / "Purchase Line"."Outstanding Quantity";
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
        layout(HSCodeGIT)
        {
            Caption = 'HS Code - GIT (Excel)';
            Type = Excel;
            LayoutFile = 'src/Reports/Layout/HSCodeGIT.xlsx';
        }
    }

    var
        ItemRec: Record Item;
        NoOfCarton: Decimal;
        NetUnitCost: Decimal;
}
