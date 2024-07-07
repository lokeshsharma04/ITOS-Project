query 52103 "BI Sales Line"
{
    APIGroup = 'purchase';
    APIPublisher = 'ITOSBusinessSolutions';
    APIVersion = 'v1.0';
    EntityName = 'salesLine';
    EntitySetName = 'salesLines';
    QueryType = API;

    elements
    {
        dataitem(salesLine; "Sales Line")
        {
            column(ameChargeDocumentNo; "AME Charge Document No.")
            {
            }
            column(ameCommercialInvNo; "AME Commercial Inv. No.")
            {
            }
            column(amePriceDate; "AME Price Date")
            {
            }
            column(ameProdPostingType; "AME Prod. Posting Type")
            {
            }
            column(atoWhseOutstandingQty; "ATO Whse. Outstanding Qty.")
            {
            }
            column(atoWhseOutstdQtyBase; "ATO Whse. Outstd. Qty. (Base)")
            {
            }
            column(atosDeletingFromHeader; "ATOS Deleting from Header")
            {
            }
            column(atosDocumentStatus; "ATOS Document Status")
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
            column(allowLineDisc; "Allow Line Disc.")
            {
            }
            column(amount; Amount)
            {
            }
            column(amountIncludingVAT; "Amount Including VAT")
            {
            }
            column(applFromItemEntry; "Appl.-from Item Entry")
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
            column(bomItemNo; "BOM Item No.")
            {
            }
            column(billToCustomerNo; "Bill-to Customer No.")
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
            column(completelyShipped; "Completely Shipped")
            {
            }
            column(copiedFromPostedDoc; "Copied From Posted Doc.")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(customerDiscGroup; "Customer Disc. Group")
            {
            }
            column(customerPriceGroup; "Customer Price Group")
            {
            }
            column(deferralCode; "Deferral Code")
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
            column(exitPoint; "Exit Point")
            {
            }
            column(faPostingDate; "FA Posting Date")
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
            column(jobContractEntryNo; "Job Contract Entry No.")
            {
            }
            column(jobNo; "Job No.")
            {
            }
            column(jobTaskNo; "Job Task No.")
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
            column(lineDiscountCalculation; "Line Discount Calculation")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(netWeight; "Net Weight")
            {
            }
            column(no; "No.")
            {
            }
            column(nonstock; Nonstock)
            {
            }
            column(originallyOrderedNo; "Originally Ordered No.")
            {
            }
            column(originallyOrderedVarCode; "Originally Ordered Var. Code")
            {
            }
            column(outOfStockSubstitution; "Out-of-Stock Substitution")
            {
            }
            column(outboundWhseHandlingTime; "Outbound Whse. Handling Time")
            {
            }
            column(outstandingAmount; "Outstanding Amount")
            {
            }
            column(outstandingAmountLCY; "Outstanding Amount (LCY)")
            {
            }
            column(outstandingQtyBase; "Outstanding Qty. (Base)")
            {
            }
            column(outstandingQuantity; "Outstanding Quantity")
            {
            }
            column(planned; Planned)
            {
            }
            column(plannedDeliveryDate; "Planned Delivery Date")
            {
            }
            column(plannedShipmentDate; "Planned Shipment Date")
            {
            }
            column(pmtDiscountAmount; "Pmt. Discount Amount")
            {
            }
            column(postingDate; "Posting Date")
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
            column(priceDescription; "Price description")
            {
            }
            column(profit; "Profit %")
            {
            }
            column(promisedDeliveryDate; "Promised Delivery Date")
            {
            }
            column(purchOrderLineNo; "Purch. Order Line No.")
            {
            }
            column(purchaseOrderNo; "Purchase Order No.")
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
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(qtyRoundingPrecisionBase; "Qty. Rounding Precision (Base)")
            {
            }
            column(qtyShippedBase; "Qty. Shipped (Base)")
            {
            }
            column(qtyShippedNotInvdBase; "Qty. Shipped Not Invd. (Base)")
            {
            }
            column(qtyShippedNotInvoiced; "Qty. Shipped Not Invoiced")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            column(qtyToAsmToOrderBase; "Qty. to Asm. to Order (Base)")
            {
            }
            column(qtyToAssembleToOrder; "Qty. to Assemble to Order")
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
            column(qtyToShip; "Qty. to Ship")
            {
            }
            column(qtyToShipBase; "Qty. to Ship (Base)")
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
            column(quantityShipped; "Quantity Shipped")
            {
            }
            column(recalculateInvoiceDisc; "Recalculate Invoice Disc.")
            {
            }
            column(requestedDeliveryDate; "Requested Delivery Date")
            {
            }
            column(reserve; Reserve)
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
            column(retQtyRcdNotInvdBase; "Ret. Qty. Rcd. Not Invd.(Base)")
            {
            }
            column(returnQtyRcdNotInvd; "Return Qty. Rcd. Not Invd.")
            {
            }
            column(returnQtyReceived; "Return Qty. Received")
            {
            }
            column(returnQtyReceivedBase; "Return Qty. Received (Base)")
            {
            }
            column(returnQtyToReceive; "Return Qty. to Receive")
            {
            }
            column(returnQtyToReceiveBase; "Return Qty. to Receive (Base)")
            {
            }
            column(returnRcdNotInvd; "Return Rcd. Not Invd.")
            {
            }
            column(returnRcdNotInvdLCY; "Return Rcd. Not Invd. (LCY)")
            {
            }
            column(returnReasonCode; "Return Reason Code")
            {
            }
            column(returnReceiptLineNo; "Return Receipt Line No.")
            {
            }
            column(returnReceiptNo; "Return Receipt No.")
            {
            }
            column(returnsDeferralStartDate; "Returns Deferral Start Date")
            {
            }
            column(selectedAllocAccountNo; "Selected Alloc. Account No.")
            {
            }
            column(sellToCustomerNo; "Sell-to Customer No.")
            {
            }
            column(shipmentDate; "Shipment Date")
            {
            }
            column(shipmentLineNo; "Shipment Line No.")
            {
            }
            column(shipmentNo; "Shipment No.")
            {
            }
            column(shippedNotInvLCYNoVAT; "Shipped Not Inv. (LCY) No VAT")
            {
            }
            column(shippedNotInvoiced; "Shipped Not Invoiced")
            {
            }
            column(shippedNotInvoicedLCY; "Shipped Not Invoiced (LCY)")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(shippingAgentServiceCode; "Shipping Agent Service Code")
            {
            }
            column(shippingTime; "Shipping Time")
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
            column(specialOrderPurchLineNo; "Special Order Purch. Line No.")
            {
            }
            column(specialOrderPurchaseNo; "Special Order Purchase No.")
            {
            }
            column(substitutionAvailable; "Substitution Available")
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
            column(taxCategory; "Tax Category")
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
            column(unitPrice; "Unit Price")
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
            column(vatClauseCode; "VAT Clause Code")
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
            column(whseOutstandingQty; "Whse. Outstanding Qty.")
            {
            }
            column(whseOutstandingQtyBase; "Whse. Outstanding Qty. (Base)")
            {
            }
            column(workTypeCode; "Work Type Code")
            {
            }

            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "No." = salesLine."Document No.", "Document Type" = salesLine."Document Type";

                column(Sales_Doc_No; "No.") { }
                column(Sales_Posting_Date; "Posting Date") { }
                column(Sales_Price_Date; "AME Price Date") { }
                //column(Sales_Sales_Order_Type; "AME Purch. Order Type") { }
                column(Sales_Status; Status) { }
                column(Sales_SO_Status; "AME SO Status") { }
                column(Sales_Shipment_Date; "Shipment Date") { }
                column(Sales_Order_Date; "Order Date") { }
                column(Ship_to_Code; "Ship-to Code") { }
                column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
                column(Currency_Code; "Currency Code") { }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
