query 52104 "BI Whse Activity Line"
{
    APIGroup = 'Warehosue';
    APIPublisher = 'ITOSBusinessSolutions';
    APIVersion = 'v1.0';
    EntityName = 'warehouseActivityLine';
    EntitySetName = 'warehouseActivityLines';
    QueryType = API;

    elements
    {
        dataitem(warehouseActivityLine; "Warehouse Activity Line")
        {
            column(ameComments; "AME Comments")
            {
            }
            column(atoComponent; "ATO Component")
            {
            }
            column(actionType; "Action Type")
            {
            }
            column(activityType; "Activity Type")
            {
            }
            column(assembleToOrder; "Assemble to Order")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(binRanking; "Bin Ranking")
            {
            }
            column(binTypeCode; "Bin Type Code")
            {
            }
            column(breakbulk; Breakbulk)
            {
            }
            column(breakbulkNo; "Breakbulk No.")
            {
            }
            column(crossDockInformation; "Cross-Dock Information")
            {
            }
            column(cubage; Cubage)
            {
            }
            column(dedicated; Dedicated)
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(destinationNo; "Destination No.")
            {
            }
            column(destinationType; "Destination Type")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(expirationDate; "Expiration Date")
            {
            }
            column(itemNo; "Item No.")
            {
            }
            column(lineNo; "Line No.")
            {
            }
            column(locationCode; "Location Code")
            {
            }
            column(lotNo; "Lot No.")
            {
            }
            column(lotNoBlocked; "Lot No. Blocked")
            {
            }
            column(no; "No.")
            {
            }
            column(originalBreakbulk; "Original Breakbulk")
            {
            }
            column(overReceiptCode; "Over-Receipt Code")
            {
            }
            column(overReceiptQuantity; "Over-Receipt Quantity")
            {
            }
            column(packageNo; "Package No.")
            {
            }
            column(qtyBase; "Qty. (Base)")
            {
            }
            column(qtyHandled; "Qty. Handled")
            {
            }
            column(qtyHandledBase; "Qty. Handled (Base)")
            {
            }
            column(qtyOutstanding; "Qty. Outstanding")
            {
            }
            column(qtyOutstandingBase; "Qty. Outstanding (Base)")
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
            column(qtyToHandle; "Qty. to Handle")
            {
            }
            column(qtyToHandleBase; "Qty. to Handle (Base)")
            {
            }
            column(quantity; Quantity)
            {
            }
            column(reasonCode; "Reason Code")
            {
            }
            column(serialNo; "Serial No.")
            {
            }
            column(serialNoBlocked; "Serial No. Blocked")
            {
            }
            column(shelfNo; "Shelf No.")
            {
            }
            column(shipmentMethodCode; "Shipment Method Code")
            {
            }
            column(shippingAdvice; "Shipping Advice")
            {
            }
            column(shippingAgentCode; "Shipping Agent Code")
            {
            }
            column(shippingAgentServiceCode; "Shipping Agent Service Code")
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
            column(sourceSublineNo; "Source Subline No.")
            {
            }
            column(sourceSubtype; "Source Subtype")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(specialEquipmentCode; "Special Equipment Code")
            {
            }
            column(startingDate; "Starting Date")
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
            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(warrantyDate; "Warranty Date")
            {
            }
            column(weight; Weight)
            {
            }
            column(whseDocumentLineNo; "Whse. Document Line No.")
            {
            }
            column(whseDocumentNo; "Whse. Document No.")
            {
            }
            column(whseDocumentType; "Whse. Document Type")
            {
            }
            column(zoneCode; "Zone Code")
            {
            }

            dataitem(Warehouse_Actiivity_Header; "Warehouse Activity Header")
            {
                //DataItemLink = "Activity Type" = warehouseActivityLine."Activity Type";
                DataItemLink = Type = warehouseActivityLine."Activity Type", "No." = warehouseActivityLine."No.";

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
