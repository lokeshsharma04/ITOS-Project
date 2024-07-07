report 52150 "AME Order Vs Forecast"
{
    ApplicationArea = All;
    Caption = 'AME Order Vs Forecast';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = ForecastVSOrder;
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "Document Type", "No.", "Shipment Date", "Sell-to Customer No.", "Ship-to Country/Region Code", "Ship-to Code";
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = filter("Blanket Order" | Order));
            PrintOnlyIfDetail = true;

            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(AMEPriceDate; "AME Price Date")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(LastShipmentDate; "Last Shipment Date")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PromisedDeliveryDate; "Promised Delivery Date")
            {
            }
            column(RequestedDeliveryDate; "Requested Delivery Date")
            {
            }
            column(ShipmentDate; "Shipment Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CurrencyFactor; "Currency Factor")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(AMESOStatus; "AME SO Status")
            {
            }
            column(Status; Status)
            {
            }
            column(WorkDescription; "Work Description")
            {
            }
            column(BilltoCountryRegionCode; "Bill-to Country/Region Code")
            {
            }
            column(SelltoCountryRegionCode; "Sell-to Country/Region Code")
            {
            }
            column(ShiptoCountryRegionCode; "Ship-to Country/Region Code")
            {
            }
            column(VATCountryRegionCode; "VAT Country/Region Code")
            {
            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where(Type = const(Item), Quantity = filter(<> 00));

                RequestFilterFields = "No.", "Shipment Date", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4";

                column(AllocAccModifiedbyUser_SalesLine; "Alloc. Acc. Modified by User")
                {
                }
                column(AllocationAccountNo_SalesLine; "Allocation Account No.")
                {
                }
                column(AllowInvoiceDisc_SalesLine; "Allow Invoice Disc.")
                {
                }
                column(AllowItemChargeAssignment_SalesLine; "Allow Item Charge Assignment")
                {
                }
                column(AllowLineDisc_SalesLine; "Allow Line Disc.")
                {
                }
                column(AMEChargeDocumentNo_SalesLine; "AME Charge Document No.")
                {
                }
                column(AMECommercialInvNo_SalesLine; "AME Commercial Inv. No.")
                {
                }
                column(AMEItemCategory1_SalesLine; "AME Item Category 1")
                {
                }
                column(AMEItemCategory10_SalesLine; "AME Item Category 10")
                {
                }
                column(AMEItemCategory11_SalesLine; "AME Item Category 11")
                {
                }
                column(AMEItemCategory12_SalesLine; "AME Item Category 12")
                {
                }
                column(AMEItemCategory13_SalesLine; "AME Item Category 13")
                {
                }
                column(AMEItemCategory2_SalesLine; "AME Item Category 2")
                {
                }
                column(AMEItemCategory3_SalesLine; "AME Item Category 3")
                {
                }
                column(AMEItemCategory4_SalesLine; "AME Item Category 4")
                {
                }
                column(AMEItemCategory5_SalesLine; "AME Item Category 5")
                {
                }
                column(AMEItemCategory6_SalesLine; "AME Item Category 6")
                {
                }
                column(AMEItemCategory7_SalesLine; "AME Item Category 7")
                {
                }
                column(AMEItemCategory8_SalesLine; "AME Item Category 8")
                {
                }
                column(AMEItemCategory9_SalesLine; "AME Item Category 9")
                {
                }
                column(AMEPriceDate_SalesLine; "AME Price Date")
                {
                }
                column(AMEProdPostingType_SalesLine; "AME Prod. Posting Type")
                {
                }
                column(Amount_SalesLine; Amount)
                {
                }
                column(AmountIncludingVAT_SalesLine; "Amount Including VAT")
                {
                }
                column(ApplfromItemEntry_SalesLine; "Appl.-from Item Entry")
                {
                }
                column(AppltoItemEntry_SalesLine; "Appl.-to Item Entry")
                {
                }
                column(Area_SalesLine; "Area")
                {
                }
                column(ATOWhseOutstandingQty_SalesLine; "ATO Whse. Outstanding Qty.")
                {
                }
                column(ATOWhseOutstdQtyBase_SalesLine; "ATO Whse. Outstd. Qty. (Base)")
                {
                }
                column(ATOSDeletingfromHeader_SalesLine; "ATOS Deleting from Header")
                {
                }
                column(ATOSDocumentStatus_SalesLine; "ATOS Document Status")
                {
                }
                column(ATOSCreatedByUser_SalesLine; "ATOSCreatedBy User")
                {
                }
                column(ATOSModifiedByUser_SalesLine; "ATOSModified By User")
                {
                }
                column(AttachedDocCount_SalesLine; "Attached Doc Count")
                {
                }
                column(AttachedLinesCount_SalesLine; "Attached Lines Count")
                {
                }
                column(AttachedtoLineNo_SalesLine; "Attached to Line No.")
                {
                }
                column(BilltoCustomerNo_SalesLine; "Bill-to Customer No.")
                {
                }
                column(BinCode_SalesLine; "Bin Code")
                {
                }
                column(BlanketOrderLineNo_SalesLine; "Blanket Order Line No.")
                {
                }
                column(BlanketOrderNo_SalesLine; "Blanket Order No.")
                {
                }
                column(BOMItemNo_SalesLine; "BOM Item No.")
                {
                }
                column(CompletelyShipped_SalesLine; "Completely Shipped")
                {
                }
                column(CopiedFromPostedDoc_SalesLine; "Copied From Posted Doc.")
                {
                }
                column(CurrencyCode_SalesLine; "Currency Code")
                {
                }
                column(CustomerDiscGroup_SalesLine; "Customer Disc. Group")
                {
                }
                column(CustomerPriceGroup_SalesLine; "Customer Price Group")
                {
                }
                column(DeferralCode_SalesLine; "Deferral Code")
                {
                }
                column(DepruntilFAPostingDate_SalesLine; "Depr. until FA Posting Date")
                {
                }
                column(DepreciationBookCode_SalesLine; "Depreciation Book Code")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(Description2_SalesLine; "Description 2")
                {
                }
                column(DimensionSetID_SalesLine; "Dimension Set ID")
                {
                }
                column(DocumentNo_SalesLine; "Document No.")
                {
                }
                column(DocumentType_SalesLine; "Document Type")
                {
                }
                column(DropShipment_SalesLine; "Drop Shipment")
                {
                }
                column(DuplicateinDepreciationBook_SalesLine; "Duplicate in Depreciation Book")
                {
                }
                column(ExitPoint_SalesLine; "Exit Point")
                {
                }
                column(FAPostingDate_SalesLine; "FA Posting Date")
                {
                }
                column(GenBusPostingGroup_SalesLine; "Gen. Bus. Posting Group")
                {
                }
                column(GenProdPostingGroup_SalesLine; "Gen. Prod. Posting Group")
                {
                }
                column(GrossWeight_SalesLine; "Gross Weight")
                {
                }
                column(ICItemReferenceNo_SalesLine; "IC Item Reference No.")
                {
                }
                column(ICPartnerCode_SalesLine; "IC Partner Code")
                {
                }
                column(ICPartnerRefType_SalesLine; "IC Partner Ref. Type")
                {
                }
                column(ICPartnerReference_SalesLine; "IC Partner Reference")
                {
                }
                column(InvDiscAmounttoInvoice_SalesLine; "Inv. Disc. Amount to Invoice")
                {
                }
                column(InvDiscountAmount_SalesLine; "Inv. Discount Amount")
                {
                }
                column(ItemCategoryCode_SalesLine; "Item Category Code")
                {
                }
                column(ItemChargeQtytoHandle_SalesLine; "Item Charge Qty. to Handle")
                {
                }
                column(ItemReferenceNo_SalesLine; "Item Reference No.")
                {
                }
                column(ItemReferenceType_SalesLine; "Item Reference Type")
                {
                }
                column(ItemReferenceTypeNo_SalesLine; "Item Reference Type No.")
                {
                }
                column(ItemReferenceUnitofMeasure_SalesLine; "Item Reference Unit of Measure")
                {
                }
                column(JobContractEntryNo_SalesLine; "Job Contract Entry No.")
                {
                }
                column(JobNo_SalesLine; "Job No.")
                {
                }
                column(JobTaskNo_SalesLine; "Job Task No.")
                {
                }
                column(LineAmount_SalesLine; "Line Amount")
                {
                }
                column(LineDiscount_SalesLine; "Line Discount %")
                {
                }
                column(LineDiscountAmount_SalesLine; "Line Discount Amount")
                {
                }
                column(LineDiscountCalculation_SalesLine; "Line Discount Calculation")
                {
                }
                column(LineNo_SalesLine; "Line No.")
                {
                }
                column(LocationCode_SalesLine; "Location Code")
                {
                }
                column(NetWeight_SalesLine; "Net Weight")
                {
                }
                column(No_SalesLine; "No.")
                {
                }
                column(Nonstock_SalesLine; Nonstock)
                {
                }
                column(OriginallyOrderedNo_SalesLine; "Originally Ordered No.")
                {
                }
                column(OriginallyOrderedVarCode_SalesLine; "Originally Ordered Var. Code")
                {
                }
                column(OutofStockSubstitution_SalesLine; "Out-of-Stock Substitution")
                {
                }
                column(OutboundWhseHandlingTime_SalesLine; "Outbound Whse. Handling Time")
                {
                }
                column(OutstandingAmount_SalesLine; "Outstanding Amount")
                {
                }
                column(OutstandingAmountLCY_SalesLine; "Outstanding Amount (LCY)")
                {
                }
                column(OutstandingQtyBase_SalesLine; "Outstanding Qty. (Base)")
                {
                }
                column(OutstandingQuantity_SalesLine; "Outstanding Quantity")
                {
                }
                column(Planned_SalesLine; Planned)
                {
                }
                column(PlannedDeliveryDate_SalesLine; "Planned Delivery Date")
                {
                }
                column(PlannedShipmentDate_SalesLine; "Planned Shipment Date")
                {
                }
                column(PmtDiscountAmount_SalesLine; "Pmt. Discount Amount")
                {
                }
                column(PostingDate_SalesLine; "Posting Date")
                {
                }
                column(PostingGroup_SalesLine; "Posting Group")
                {
                }
                column(Prepayment_SalesLine; "Prepayment %")
                {
                }
                column(PrepaymentAmount_SalesLine; "Prepayment Amount")
                {
                }
                column(PrepaymentLine_SalesLine; "Prepayment Line")
                {
                }
                column(PrepaymentTaxAreaCode_SalesLine; "Prepayment Tax Area Code")
                {
                }
                column(PrepaymentTaxGroupCode_SalesLine; "Prepayment Tax Group Code")
                {
                }
                column(PrepaymentTaxLiable_SalesLine; "Prepayment Tax Liable")
                {
                }
                column(PrepaymentVAT_SalesLine; "Prepayment VAT %")
                {
                }
                column(PrepaymentVATDifference_SalesLine; "Prepayment VAT Difference")
                {
                }
                column(PrepaymentVATIdentifier_SalesLine; "Prepayment VAT Identifier")
                {
                }
                column(PrepmtAmtDeducted_SalesLine; "Prepmt Amt Deducted")
                {
                }
                column(PrepmtAmttoDeduct_SalesLine; "Prepmt Amt to Deduct")
                {
                }
                column(PrepmtVATDiffDeducted_SalesLine; "Prepmt VAT Diff. Deducted")
                {
                }
                column(PrepmtVATDifftoDeduct_SalesLine; "Prepmt VAT Diff. to Deduct")
                {
                }
                column(PrepmtAmountInvLCY_SalesLine; "Prepmt. Amount Inv. (LCY)")
                {
                }
                column(PrepmtAmountInvInclVAT_SalesLine; "Prepmt. Amount Inv. Incl. VAT")
                {
                }
                column(PrepmtAmtInclVAT_SalesLine; "Prepmt. Amt. Incl. VAT")
                {
                }
                column(PrepmtAmtInv_SalesLine; "Prepmt. Amt. Inv.")
                {
                }
                column(PrepmtLineAmount_SalesLine; "Prepmt. Line Amount")
                {
                }
                column(PrepmtPmtDiscountAmount_SalesLine; "Prepmt. Pmt. Discount Amount")
                {
                }
                column(PrepmtVATAmountInvLCY_SalesLine; "Prepmt. VAT Amount Inv. (LCY)")
                {
                }
                column(PrepmtVATBaseAmt_SalesLine; "Prepmt. VAT Base Amt.")
                {
                }
                column(PrepmtVATCalcType_SalesLine; "Prepmt. VAT Calc. Type")
                {
                }
                column(PriceCalculationMethod_SalesLine; "Price Calculation Method")
                {
                }
                column(Pricedescription_SalesLine; "Price description")
                {
                }
                column(Profit_SalesLine; "Profit %")
                {
                }
                column(PromisedDeliveryDate_SalesLine; "Promised Delivery Date")
                {
                }
                column(PurchOrderLineNo_SalesLine; "Purch. Order Line No.")
                {
                }
                column(PurchaseOrderNo_SalesLine; "Purchase Order No.")
                {
                }
                column(PurchasingCode_SalesLine; "Purchasing Code")
                {
                }
                column(QtyAssigned_SalesLine; "Qty. Assigned")
                {
                }
                column(QtyInvoicedBase_SalesLine; "Qty. Invoiced (Base)")
                {
                }
                column(QtyperUnitofMeasure_SalesLine; "Qty. per Unit of Measure")
                {
                }
                column(QtyRoundingPrecision_SalesLine; "Qty. Rounding Precision")
                {
                }
                column(QtyRoundingPrecisionBase_SalesLine; "Qty. Rounding Precision (Base)")
                {
                }
                column(QtyShippedBase_SalesLine; "Qty. Shipped (Base)")
                {
                }
                column(QtyShippedNotInvdBase_SalesLine; "Qty. Shipped Not Invd. (Base)")
                {
                }
                column(QtyShippedNotInvoiced_SalesLine; "Qty. Shipped Not Invoiced")
                {
                }
                column(QtytoAsmtoOrderBase_SalesLine; "Qty. to Asm. to Order (Base)")
                {
                }
                column(QtytoAssembletoOrder_SalesLine; "Qty. to Assemble to Order")
                {
                }
                column(QtytoAssign_SalesLine; "Qty. to Assign")
                {
                }
                column(QtytoInvoice_SalesLine; "Qty. to Invoice")
                {
                }
                column(QtytoInvoiceBase_SalesLine; "Qty. to Invoice (Base)")
                {
                }
                column(QtytoShip_SalesLine; "Qty. to Ship")
                {
                }
                column(QtytoShipBase_SalesLine; "Qty. to Ship (Base)")
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                }
                column(QuantityBase_SalesLine; "Quantity (Base)")
                {
                }
                column(QuantityInvoiced_SalesLine; "Quantity Invoiced")
                {
                }
                column(QuantityShipped_SalesLine; "Quantity Shipped")
                {
                }
                column(RecalculateInvoiceDisc_SalesLine; "Recalculate Invoice Disc.")
                {
                }
                column(RequestedDeliveryDate_SalesLine; "Requested Delivery Date")
                {
                }
                column(Reserve_SalesLine; Reserve)
                {
                }
                column(ReservedQtyBase_SalesLine; "Reserved Qty. (Base)")
                {
                }
                column(ReservedQuantity_SalesLine; "Reserved Quantity")
                {
                }
                column(ResponsibilityCenter_SalesLine; "Responsibility Center")
                {
                }
                column(RetQtyRcdNotInvdBase_SalesLine; "Ret. Qty. Rcd. Not Invd.(Base)")
                {
                }
                column(ReturnQtyRcdNotInvd_SalesLine; "Return Qty. Rcd. Not Invd.")
                {
                }
                column(ReturnQtyReceived_SalesLine; "Return Qty. Received")
                {
                }
                column(ReturnQtyReceivedBase_SalesLine; "Return Qty. Received (Base)")
                {
                }
                column(ReturnQtytoReceive_SalesLine; "Return Qty. to Receive")
                {
                }
                column(ReturnQtytoReceiveBase_SalesLine; "Return Qty. to Receive (Base)")
                {
                }
                column(ReturnRcdNotInvd_SalesLine; "Return Rcd. Not Invd.")
                {
                }
                column(ReturnRcdNotInvdLCY_SalesLine; "Return Rcd. Not Invd. (LCY)")
                {
                }
                column(ReturnReasonCode_SalesLine; "Return Reason Code")
                {
                }
                column(ReturnReceiptLineNo_SalesLine; "Return Receipt Line No.")
                {
                }
                column(ReturnReceiptNo_SalesLine; "Return Receipt No.")
                {
                }
                column(ReturnsDeferralStartDate_SalesLine; "Returns Deferral Start Date")
                {
                }
                column(SelectedAllocAccountNo_SalesLine; "Selected Alloc. Account No.")
                {
                }
                column(SelltoCustomerNo_SalesLine; "Sell-to Customer No.")
                {
                }
                column(ShipmentDate_SalesLine; "Shipment Date")
                {
                }
                column(ShipmentLineNo_SalesLine; "Shipment Line No.")
                {
                }
                column(ShipmentNo_SalesLine; "Shipment No.")
                {
                }
                column(ShippedNotInvLCYNoVAT_SalesLine; "Shipped Not Inv. (LCY) No VAT")
                {
                }
                column(ShippedNotInvoiced_SalesLine; "Shipped Not Invoiced")
                {
                }
                column(ShippedNotInvoicedLCY_SalesLine; "Shipped Not Invoiced (LCY)")
                {
                }
                column(ShippingAgentCode_SalesLine; "Shipping Agent Code")
                {
                }
                column(ShippingAgentServiceCode_SalesLine; "Shipping Agent Service Code")
                {
                }
                column(ShippingTime_SalesLine; "Shipping Time")
                {
                }
                column(ShortcutDimension1Code_SalesLine; "Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_SalesLine; "Shortcut Dimension 2 Code")
                {
                }
                column(SpecialOrder_SalesLine; "Special Order")
                {
                }
                column(SpecialOrderPurchLineNo_SalesLine; "Special Order Purch. Line No.")
                {
                }
                column(SpecialOrderPurchaseNo_SalesLine; "Special Order Purchase No.")
                {
                }
                column(SubstitutionAvailable_SalesLine; "Substitution Available")
                {
                }
                column(Subtype_SalesLine; Subtype)
                {
                }
                column(SystemCreatedEntry_SalesLine; "System-Created Entry")
                {
                }
                column(SystemCreatedAt_SalesLine; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_SalesLine; SystemCreatedBy)
                {
                }
                column(SystemId_SalesLine; SystemId)
                {
                }
                column(SystemModifiedAt_SalesLine; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_SalesLine; SystemModifiedBy)
                {
                }
                column(TaxAreaCode_SalesLine; "Tax Area Code")
                {
                }
                column(TaxCategory_SalesLine; "Tax Category")
                {
                }
                column(TaxGroupCode_SalesLine; "Tax Group Code")
                {
                }
                column(TaxLiable_SalesLine; "Tax Liable")
                {
                }
                column(TransactionSpecification_SalesLine; "Transaction Specification")
                {
                }
                column(TransactionType_SalesLine; "Transaction Type")
                {
                }
                column(TransportMethod_SalesLine; "Transport Method")
                {
                }
                column(Type_SalesLine; "Type")
                {
                }
                column(UnitCost_SalesLine; "Unit Cost")
                {
                }
                column(UnitCostLCY_SalesLine; "Unit Cost (LCY)")
                {
                }
                column(UnitofMeasure_SalesLine; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode_SalesLine; "Unit of Measure Code")
                {
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                }
                column(UnitVolume_SalesLine; "Unit Volume")
                {
                }
                column(UnitsperParcel_SalesLine; "Units per Parcel")
                {
                }
                column(UseDuplicationList_SalesLine; "Use Duplication List")
                {
                }
                column(VariantCode_SalesLine; "Variant Code")
                {
                }
                column(VAT_SalesLine; "VAT %")
                {
                }
                column(VATBaseAmount_SalesLine; "VAT Base Amount")
                {
                }
                column(VATBusPostingGroup_SalesLine; "VAT Bus. Posting Group")
                {
                }
                column(VATCalculationType_SalesLine; "VAT Calculation Type")
                {
                }
                column(VATClauseCode_SalesLine; "VAT Clause Code")
                {
                }
                column(VATDifference_SalesLine; "VAT Difference")
                {
                }
                column(VATIdentifier_SalesLine; "VAT Identifier")
                {
                }
                column(VATProdPostingGroup_SalesLine; "VAT Prod. Posting Group")
                {
                }
                column(WhseOutstandingQty_SalesLine; "Whse. Outstanding Qty.")
                {
                }
                column(WhseOutstandingQtyBase_SalesLine; "Whse. Outstanding Qty. (Base)")
                {
                }
                column(WorkTypeCode_SalesLine; "Work Type Code")
                {
                }
                column(ShipmentMonth; FORMAT("Shipment Date", 10, '<Month Text,3>-<Year4>')) { }
                column(Common_Item_No; ItemRec."Common Item No.") { }
                column(Tariff_No; ItemRec."Tariff No.") { }
                column(Item_Country_Region_of_Origin_Code; ItemRec."Country/Region of Origin Code") { }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(ItemRec);
                    if "Sales Line".Type = "Sales Line".Type::Item then
                        if ItemRec.Get("Sales Line"."No.") then;
                end;
            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
                    if not (SalesHeader."AME SO Status" in [SalesHeader."AME SO Status"::Confirmed, SalesHeader."AME SO Status"::Canceled]) then
                        CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
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
        layout(ForecastVSOrder)
        {
            Caption = 'Forecast VS Order';
            Summary = 'Forecast VS Order';
            Type = Excel;
            LayoutFile = 'src/Reports/Layout/OrderVSForecast.xlsx';
        }
    }


    var
        ItemRec: Record Item;
}
