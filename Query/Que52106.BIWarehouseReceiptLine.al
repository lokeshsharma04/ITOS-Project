query 52106 "BI Warehouse Receipt Line"
{
    APIGroup = 'warehouse';
    APIPublisher = 'ITOSBusienssSolutions';
    APIVersion = 'v1.0';
    EntityName = 'warehouseReceiptLine';
    EntitySetName = 'warehouseReceiptLines';
    QueryType = API;

    elements
    {
        dataitem(warehouseReceiptLine; "Warehouse Receipt Line")
        {
            column(ameRemarks; "AME Remarks")
            {
            }
            column(actualQty; "Actual Qty")
            {
            }
            column(actualQtyBase; "Actual Qty (Base)")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(crossDockBinCode; "Cross-Dock Bin Code")
            {
            }
            column(crossDockZoneCode; "Cross-Dock Zone Code")
            {
            }
            column(cubage; Cubage)
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(damagedQty; "Damaged Qty")
            {
            }
            column(damagedQtyBase; "Damaged Qty (Base)")
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(excessQty; "Excess Qty")
            {
            }
            column(excessQtyBase; "Excess Qty (Base)")
            {
            }
            column(invoiceQty; "Invoice Qty")
            {
            }
            column(itemNo; "Item No.")
            {
            }
            column(landedCost; "Landed Cost %")
            {
            }
            column(landedCostAmt; "Landed Cost Amt.")
            {
            }
            column(lineAmount; "Line Amount")
            {
            }
            column(lineAmountLCY; "Line Amount (LCY)")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(no; "No.")
            {
            }
            column(notUpdBySrcDocPost; "Not upd. by Src. Doc. Post.")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
            {
            }
            column(overReceiptQuantity; "Over-Receipt Quantity")
            {
            }
            column(postingFromWhseRef; "Posting from Whse. Ref.")
            {
            }
            column(qtyBase; "Qty. (Base)")
            {
            }
            column(qtyOutstanding; "Qty. Outstanding")
            {
            }
            column(qtyOutstandingBase; "Qty. Outstanding (Base)")
            {
            }
            column(qtyReceived; "Qty. Received")
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
            column(qtyToCrossDock; "Qty. to Cross-Dock")
            {
            }
            column(qtyToCrossDockBase; "Qty. to Cross-Dock (Base)")
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
            column(shelfNo; "Shelf No.")
            {
            }
            column(shortQty; "Short Qty")
            {
            }
            column(shortQtyBase; "Short Qty (Base)")
            {
            }
            column(sortingSequenceNo; "Sorting Sequence No.")
            {
            }
            column(sourceDocument; "Source Document")
            {
            }
            column(sourceLineNo; "Source Line No.")
            {
            }
            column(sourceNo; "Source No.")
            {
            }
            column(sourceSubtype; "Source Subtype")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(startingDate; "Starting Date")
            {
            }
            column(status; Status)
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
            column(unitCost; "Unit Cost")
            {
            }
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(weight; Weight)
            {
            }
            column(zoneCode; "Zone Code")
            {
            }

            dataitem(Warehouse_Receipt_Header; "Warehouse Receipt Header")
            {
                DataItemLink = "No." = warehouseReceiptLine."No.";
                column(Posting_Date; "Posting Date") { }
                column(Document_Status; "Document Status") { }
                column(Expected_Receipt_Date; Expected_Receipt_Date) { }
                column(BOE_No_; "BOE No.") { }
                column(BOE_Date; "BOE Date") { }
                column(Supp_Invoice_No; Supp_Invoice_No) { }
                column(Supp_Invoice_Date; Supp_Invoice_Date) { }
                column(AME_Transport_Method; "AME Transport Method") { }
                column(Shipment_Status; "Shipment Status") { }

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
