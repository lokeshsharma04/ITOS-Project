query 52102 "BI Purchase Lines"
{
    APIGroup = 'purchase';
    APIPublisher = 'ITOSBusinessSolutions';
    APIVersion = 'v1.0';
    EntityName = 'purchaseLine';
    EntitySetName = 'purchaseLines';
    QueryType = API;

    elements
    {
        dataitem(purchaseLine; "Purchase Line")
        {
            column(aRcdNotInvExVATLCY; "A. Rcd. Not Inv. Ex. VAT (LCY)")
            {
            }
            column(ameItemCategory11; "AME Item Category 11")
            {
            }
            column(amePriceDate; "AME Price Date")
            {
            }
            column(ameRemarks; "AME Remarks")
            {
            }
            column(atosCreatedByUser; "ATOSCreatedBy User")
            {
            }
            column(atosModifiedByUser; "ATOSModified By User")
            {
            }
            column(allocAccModifiedByUser; "Alloc. Acc. Modified by User")
            {
            }
            column(allocationAccountNo; "Allocation Account No.")
            {
            }
            column(allowInvoiceDisc; "Allow Invoice Disc.")
            {
            }
            column(allowItemChargeAssignment; "Allow Item Charge Assignment")
            {
            }
            column(amount; Amount)
            {
            }
            column(amountIncludingVAT; "Amount Including VAT")
            {
            }
            column(amtRcdNotInvoiced; "Amt. Rcd. Not Invoiced")
            {
            }
            column(amtRcdNotInvoicedLCY; "Amt. Rcd. Not Invoiced (LCY)")
            {
            }
            column(applToItemEntry; "Appl.-to Item Entry")
            {
            }
            column("area"; "Area")
            {
            }
            column(attachedDocCount; "Attached Doc Count")
            {
            }
            column(attachedLinesCount; "Attached Lines Count")
            {
            }
            column(attachedToLineNo; "Attached to Line No.")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(blanketOrderLineNo; "Blanket Order Line No.")
            {
            }
            column(blanketOrderNo; "Blanket Order No.")
            {
            }
            column(budgetedFANo; "Budgeted FA No.")
            {
            }
            column(buyFromVendorNo; "Buy-from Vendor No.")
            {
            }
            column(completelyReceived; "Completely Received")
            {
            }
            column(copiedFromPostedDoc; "Copied From Posted Doc.")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(deferralCode; "Deferral Code")
            {
            }
            column(deprAcquisitionCost; "Depr. Acquisition Cost")
            {
            }
            column(deprUntilFAPostingDate; "Depr. until FA Posting Date")
            {
            }
            column(depreciationBookCode; "Depreciation Book Code")
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(dimensionSetID; "Dimension Set ID")
            {
            }
            column(directUnitCost; "Direct Unit Cost")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(dropShipment; "Drop Shipment")
            {
            }
            column(duplicateInDepreciationBook; "Duplicate in Depreciation Book")
            {
            }
            column(entryPoint; "Entry Point")
            {
            }
            column(expectedReceiptDate; "Expected Receipt Date")
            {
            }
            column(faPostingDate; "FA Posting Date")
            {
            }
            column(faPostingType; "FA Posting Type")
            {
            }
            column(finished; Finished)
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(grossWeight; "Gross Weight")
            {
            }
            column(icItemReferenceNo; "IC Item Reference No.")
            {
            }
            column(icPartnerCode; "IC Partner Code")
            {
            }
            column(icPartnerRefType; "IC Partner Ref. Type")
            {
            }
            column(icPartnerReference; "IC Partner Reference")
            {
            }
            column(inboundWhseHandlingTime; "Inbound Whse. Handling Time")
            {
            }
            column(indirectCost; "Indirect Cost %")
            {
            }
            column(insuranceNo; "Insurance No.")
            {
            }
            column(invDiscAmountToInvoice; "Inv. Disc. Amount to Invoice")
            {
            }
            column(invDiscountAmount; "Inv. Discount Amount")
            {
            }
            column(itemCategoryCode; "Item Category Code")
            {
            }
            column(itemChargeQtyToHandle; "Item Charge Qty. to Handle")
            {
            }
            column(itemReferenceNo; "Item Reference No.")
            {
            }
            column(itemReferenceType; "Item Reference Type")
            {
            }
            column(itemReferenceTypeNo; "Item Reference Type No.")
            {
            }
            column(itemReferenceUnitOfMeasure; "Item Reference Unit of Measure")
            {
            }
            column(jobCurrencyCode; "Job Currency Code")
            {
            }
            column(jobCurrencyFactor; "Job Currency Factor")
            {
            }
            column(jobLineAmount; "Job Line Amount")
            {
            }
            column(jobLineAmountLCY; "Job Line Amount (LCY)")
            {
            }
            column(jobLineDiscAmountLCY; "Job Line Disc. Amount (LCY)")
            {
            }
            column(jobLineDiscount; "Job Line Discount %")
            {
            }
            column(jobLineDiscountAmount; "Job Line Discount Amount")
            {
            }
            column(jobLineType; "Job Line Type")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(jobPlanningLineNo; "Job Planning Line No.")
            {
            }
            column(jobRemainingQty; "Job Remaining Qty.")
            {
            }
            column(jobRemainingQtyBase; "Job Remaining Qty. (Base)")
            {
            }
            column(jobTaskNo; "Job Task No.")
            {
            }
            column(jobTotalPrice; "Job Total Price")
            {
            }
            column(jobTotalPriceLCY; "Job Total Price (LCY)")
            {
            }
            column(jobUnitPrice; "Job Unit Price")
            {
            }
            column(jobUnitPriceLCY; "Job Unit Price (LCY)")
            {
            }
            column(leadTimeCalculation; "Lead Time Calculation")
            {
            }
            column(lineAmount; "Line Amount")
            {
            }
            column(lineDiscount; "Line Discount %")
            {
            }
            column(lineDiscountAmount; "Line Discount Amount")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(mpsOrder; "MPS Order")
            {
            }
            column(maintenanceCode; "Maintenance Code")
            {
            }
            column(netWeight; "Net Weight")
            {
            }
            column(no; "No.")
            {
            }
            column(nonDeductibleVAT; "Non-Deductible VAT %")
            {
            }
            column(nonDeductibleVATAmount; "Non-Deductible VAT Amount")
            {
            }
            column(nonDeductibleVATBase; "Non-Deductible VAT Base")
            {
            }
            column(nonDeductibleVATDiff; "Non-Deductible VAT Diff.")
            {
            }
            column(nonstock; Nonstock)
            {
            }
            column(operationNo; "Operation No.")
            {
            }
            column(orderDate; "Order Date")
            {
            }
            column(orderLineNo; "Order Line No.")
            {
            }
            column(orderNo; "Order No.")
            {
            }
            column(outstandingAmount; "Outstanding Amount")
            {
            }
            column(outstandingAmountLCY; "Outstanding Amount (LCY)")
            {
            }
            column(outstandingAmtExVATLCY; "Outstanding Amt. Ex. VAT (LCY)")
            {
            }
            column(outstandingQtyBase; "Outstanding Qty. (Base)")
            {
            }
            column(outstandingQuantity; "Outstanding Quantity")
            {
            }
            column(overReceiptApprovalStatus; "Over-Receipt Approval Status")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
            {
            }
            column(overReceiptQuantity; "Over-Receipt Quantity")
            {
            }
            column(overheadRate; "Overhead Rate")
            {
            }
            column(payToVendorNo; "Pay-to Vendor No.")
            {
            }
            column(plannedReceiptDate; "Planned Receipt Date")
            {
            }
            column(planningFlexibility; "Planning Flexibility")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
            {
            }
            column(postingGroup; "Posting Group")
            {
            }
            column(prepayment; "Prepayment %")
            {
            }
            column(prepaymentAmount; "Prepayment Amount")
            {
            }
            column(prepaymentLine; "Prepayment Line")
            {
            }
            column(prepaymentTaxAreaCode; "Prepayment Tax Area Code")
            {
            }
            column(prepaymentTaxGroupCode; "Prepayment Tax Group Code")
            {
            }
            column(prepaymentTaxLiable; "Prepayment Tax Liable")
            {
            }
            column(prepaymentVAT; "Prepayment VAT %")
            {
            }
            column(prepaymentVATDifference; "Prepayment VAT Difference")
            {
            }
            column(prepaymentVATIdentifier; "Prepayment VAT Identifier")
            {
            }
            column(prepmtAmtDeducted; "Prepmt Amt Deducted")
            {
            }
            column(prepmtAmtToDeduct; "Prepmt Amt to Deduct")
            {
            }
            column(prepmtVATDiffDeducted; "Prepmt VAT Diff. Deducted")
            {
            }
            column(prepmtVATDiffToDeduct; "Prepmt VAT Diff. to Deduct")
            {
            }
            column(prepmtAmountInvLCY; "Prepmt. Amount Inv. (LCY)")
            {
            }
            column(prepmtAmountInvInclVAT; "Prepmt. Amount Inv. Incl. VAT")
            {
            }
            column(prepmtAmtInclVAT; "Prepmt. Amt. Incl. VAT")
            {
            }
            column(prepmtAmtInv; "Prepmt. Amt. Inv.")
            {
            }
            column(prepmtLineAmount; "Prepmt. Line Amount")
            {
            }
            column(prepmtNonDeductVATAmount; "Prepmt. Non-Deduct. VAT Amount")
            {
            }
            column(prepmtNonDeductVATBase; "Prepmt. Non-Deduct. VAT Base")
            {
            }
            column(prepmtPmtDiscountAmount; "Prepmt. Pmt. Discount Amount")
            {
            }
            column(prepmtVATAmountInvLCY; "Prepmt. VAT Amount Inv. (LCY)")
            {
            }
            column(prepmtVATBaseAmt; "Prepmt. VAT Base Amt.")
            {
            }
            column(prepmtVATCalcType; "Prepmt. VAT Calc. Type")
            {
            }
            column(priceCalculationMethod; "Price Calculation Method")
            {
            }
            column(prodOrderLineNo; "Prod. Order Line No.")
            {
            }
            column(prodOrderNo; "Prod. Order No.")
            {
            }
            column(profit; "Profit %")
            {
            }
            column(promisedReceiptDate; "Promised Receipt Date")
            {
            }
            column(purchasingCode; "Purchasing Code")
            {
            }
            column(qtyAssigned; "Qty. Assigned")
            {
            }
            column(qtyInvoicedBase; "Qty. Invoiced (Base)")
            {
            }
            column(qtyRcdNotInvoiced; "Qty. Rcd. Not Invoiced")
            {
            }
            column(qtyRcdNotInvoicedBase; "Qty. Rcd. Not Invoiced (Base)")
            {
            }
            column(qtyReceivedBase; "Qty. Received (Base)")
            {
            }
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(qtyRoundingPrecisionBase; "Qty. Rounding Precision (Base)")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            column(qtyToAssign; "Qty. to Assign")
            {
            }
            column(qtyToInvoice; "Qty. to Invoice")
            {
            }
            column(qtyToInvoiceBase; "Qty. to Invoice (Base)")
            {
            }
            column(qtyToReceive; "Qty. to Receive")
            {
            }
            column(qtyToReceiveBase; "Qty. to Receive (Base)")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(quantityBase; "Quantity (Base)")
            {
            }
            column(quantityInvoiced; "Quantity Invoiced")
            {
            }
            column(quantityReceived; "Quantity Received")
            {
            }
            column(recalculateInvoiceDisc; "Recalculate Invoice Disc.")
            {
            }
            column(receiptLineNo; "Receipt Line No.")
            {
            }
            column(receiptNo; "Receipt No.")
            {
            }
            column(requestedReceiptDate; "Requested Receipt Date")
            {
            }
            column(reservedQtyBase; "Reserved Qty. (Base)")
            {
            }
            column(reservedQuantity; "Reserved Quantity")
            {
            }
            column(responsibilityCenter; "Responsibility Center")
            {
            }
            column(retQtyShpdNotInvdBase; "Ret. Qty. Shpd Not Invd.(Base)")
            {
            }
            column(returnQtyShipped; "Return Qty. Shipped")
            {
            }
            column(returnQtyShippedBase; "Return Qty. Shipped (Base)")
            {
            }
            column(returnQtyShippedNotInvd; "Return Qty. Shipped Not Invd.")
            {
            }
            column(returnQtyToShip; "Return Qty. to Ship")
            {
            }
            column(returnQtyToShipBase; "Return Qty. to Ship (Base)")
            {
            }
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(returnShipmentLineNo; "Return Shipment Line No.")
            {
            }
            column(returnShipmentNo; "Return Shipment No.")
            {
            }
            column(returnShpdNotInvd; "Return Shpd. Not Invd.")
            {
            }
            column(returnShpdNotInvdLCY; "Return Shpd. Not Invd. (LCY)")
            {
            }
            column(returnsDeferralStartDate; "Returns Deferral Start Date")
            {
            }
            column(routingNo; "Routing No.")
            {
            }
            column(routingReferenceNo; "Routing Reference No.")
            {
            }
            column(safetyLeadTime; "Safety Lead Time")
            {
            }
            column(salesOrderLineNo; "Sales Order Line No.")
            {
            }
            column(salesOrderNo; "Sales Order No.")
            {
            }
            column(salvageValue; "Salvage Value")
            {
            }
            column(selectedAllocAccountNo; "Selected Alloc. Account No.")
            {
            }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(specialOrder; "Special Order")
            {
            }
            column(specialOrderSalesLineNo; "Special Order Sales Line No.")
            {
            }
            column(specialOrderSalesNo; "Special Order Sales No.")
            {
            }
            column(subtype; Subtype)
            {
            }
            column(systemCreatedEntry; "System-Created Entry")
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(systemCreatedBy; SystemCreatedBy)
            {
            }
            column(systemId; SystemId)
            {
            }
            column(systemModifiedAt; SystemModifiedAt)
            {
            }
            column(systemModifiedBy; SystemModifiedBy)
            {
            }
            column(taxAreaCode; "Tax Area Code")
            {
            }
            column(taxGroupCode; "Tax Group Code")
            {
            }
            column(taxLiable; "Tax Liable")
            {
            }
            column(transactionSpecification; "Transaction Specification")
            {
            }
            column("transactionType"; "Transaction Type")
            {
            }
            column(transportMethod; "Transport Method")
            {
            }
            column("type"; "Type")
            {
            }
            column(unitCost; "Unit Cost")
            {
            }
            column(unitCostLCY; "Unit Cost (LCY)")
            {
            }
            column(unitPriceLCY; "Unit Price (LCY)")
            {
            }
            column(unitVolume; "Unit Volume")
            {
            }
            column(unitOfMeasure; "Unit of Measure")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(unitsPerParcel; "Units per Parcel")
            {
            }
            column(useDuplicationList; "Use Duplication List")
            {
            }
            column(useTax; "Use Tax")
            {
            }
            column(vat; "VAT %")
            {
            }
            column(vatBaseAmount; "VAT Base Amount")
            {
            }
            column(vatBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(vatCalculationType; "VAT Calculation Type")
            {
            }
            column(vatDifference; "VAT Difference")
            {
            }
            column(vatIdentifier; "VAT Identifier")
            {
            }
            column(vatProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(vendorItemNo; "Vendor Item No.")
            {
            }
            column(whseOutstandingQtyBase; "Whse. Outstanding Qty. (Base)")
            {
            }
            column(workCenterNo; "Work Center No.")
            {
            }

            dataitem(Purchase_Header; "Purchase Header")
            {
                DataItemLink = "No." = purchaseLine."Document No.", "Document Type" = purchaseLine."Document Type";
                column(Purch_Doc_No; "No.") { }
                column(Purch_Posting_Date; "Posting Date") { }
                column(Purch_Price_Date; "AME Price Date") { }
                column(Purch_Purch_Order_Type; "AME Purch. Order Type") { }
                column(Purch_Status; Status) { }
                column(Purch_Expected_Receipt_Date; "Expected Receipt Date") { }
                column(Purch_Order_Date; "Order Date") { }
                column(Currency_Code; "Currency Code") { }
                column(Purch_Order_Address_Code; "Order Address Code") { }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
