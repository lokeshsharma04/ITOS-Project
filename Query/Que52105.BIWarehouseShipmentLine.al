query 52105 "BI Warehouse Shipment Line"
{
    APIGroup = 'warheouse';
    APIPublisher = 'ItosBusinessSolutions';
    APIVersion = 'v1.0';
    EntityName = 'warehouseActivityLine';
    EntitySetName = 'warehouseActivityLines';
    QueryType = API;

    elements
    {
        dataitem(warehouseShipmentLine; "Warehouse Shipment Line")
        {
            column(ameAmount; "AME Amount")
            {
            }
            column(ameCartonQty; "AME Carton Qty.")
            {
            }
            column(ameFromCartonNo; "AME From Carton No.")
            {
            }
            column(ameToCartonNo; "AME To Carton No.")
            {
            }
            column(ameUnitCost; "AME Unit Cost")
            {
            }
            column(assembleToOrder; "Assemble to Order")
            {
            }
            column(binCode; "Bin Code")
            {
            }
            column(completelyPicked; "Completely Picked")
            {
            }
            column(cubage; Cubage)
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
            column(itemNo; "Item No.")
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
            column(pickQty; "Pick Qty.")
            {
            }
            column(pickQtyBase; "Pick Qty. (Base)")
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
            column(qtyPicked; "Qty. Picked")
            {
            }
            column(qtyPickedBase; "Qty. Picked (Base)")
            {
            }
            column(qtyRoundingPrecision; "Qty. Rounding Precision")
            {
            }
            column(qtyRoundingPrecisionBase; "Qty. Rounding Precision (Base)")
            {
            }
            column(qtyShipped; "Qty. Shipped")
            {
            }
            column(qtyShippedBase; "Qty. Shipped (Base)")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
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
            column(shelfNo; "Shelf No.")
            {
            }
            column(shipmentDate; "Shipment Date")
            {
            }
            column(shippingAdvice; "Shipping Advice")
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

            dataitem(Warehouse_Shipment_Header; "Warehouse Shipment Header")
            {
                DataItemLink = "No." = warehouseShipmentLine."No.";
                column(Posting_Date; "Posting Date") { }
                column(AME_Bill_of_Exit_Date; "AME Bill of Exit Date") { }
                column(AME_Bill_of_Exit_No_; "AME Bill of Exit No.") { }
                column(Shipment_Status; Status) { }
                column(Document_Status; "Document Status") { }
                column(AME_Ship__Confirm_Status; "AME Ship. Confirm Status") { }
                column(Shipment_Date; "Shipment Date") { }
                column(AME_Commercial_Invoice_No_; "AME Commercial Invoice No.") { }
                column(AME_Chamber_Charges; "AME Chamber Charges") { }
                column(Completely_Picked; "Completely Picked") { }
                column(External_Document_No_; "External Document No.") { }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
