query 52101 "AME Item Ledger Entries"
{
    Caption = 'Item Ledger Entries';

    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(AMEProdPostingType; "AME Prod. Posting Type")
            {
            }
            column(ATOSCustomerName; "ATOS Customer Name")
            {
            }
            column(ATOSVendorName; "ATOS Vendor Name")
            {
            }
            column(AppliedEntrytoAdjust; "Applied Entry to Adjust")
            {
            }
            column(AppliestoEntry; "Applies-to Entry")
            {
            }
            column("Area"; "Area")
            {
            }
            column(AssembletoOrder; "Assemble to Order")
            {
            }
            column(CompletelyInvoiced; "Completely Invoiced")
            {
            }
            column(Correction; Correction)
            {
            }
            column(CostAmountActual; "Cost Amount (Actual)")
            {
            }
            column(CostAmountActualACY; "Cost Amount (Actual) (ACY)")
            {
            }
            column(CostAmountExpected; "Cost Amount (Expected)")
            {
            }
            column(CostAmountExpectedACY; "Cost Amount (Expected) (ACY)")
            {
            }
            column(CostAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            {
            }
            column(CostAmountNonInvtblACY; "Cost Amount (Non-Invtbl.)(ACY)")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(DerivedfromBlanketOrder; "Derived from Blanket Order")
            {
            }
            column(Description; Description)
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentLineNo; "Document Line No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DropShipment; "Drop Shipment")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(EntryType; "Entry Type")
            {
            }
            column(EntryExitPoint; "Entry/Exit Point")
            {
            }
            column(ExpirationDate; "Expiration Date")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(InvoicedQuantity; "Invoiced Quantity")
            {
            }
            column(ItemCategoryCode; "Item Category Code")
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(ItemReferenceNo; "Item Reference No.")
            {
            }
            column(ItemTracking; "Item Tracking")
            {
            }
            column(JobNo; "Job No.")
            {
            }
            column(JobPurchase; "Job Purchase")
            {
            }
            column(JobTaskNo; "Job Task No.")
            {
            }
            column(LastInvoiceDate; "Last Invoice Date")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(LotNo; "Lot No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Nonstock; Nonstock)
            {
            }
            column(Open; Open)
            {
            }
            column(OrderLineNo; "Order Line No.")
            {
            }
            column(OrderNo; "Order No.")
            {
            }
            column(OrderType; "Order Type")
            {
            }
            column(OriginallyOrderedNo; "Originally Ordered No.")
            {
            }
            column(OriginallyOrderedVarCode; "Originally Ordered Var. Code")
            {
            }
            column(OutofStockSubstitution; "Out-of-Stock Substitution")
            {
            }
            column(PackageNo; "Package No.")
            {
            }
            column(Positive; Positive)
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(ProdOrderCompLineNo; "Prod. Order Comp. Line No.")
            {
            }
            column(PurchaseAmountActual; "Purchase Amount (Actual)")
            {
            }
            column(PurchaseAmountExpected; "Purchase Amount (Expected)")
            {
            }
            column(PurchasingCode; "Purchasing Code")
            {
            }
            column(QtyperUnitofMeasure; "Qty. per Unit of Measure")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(RemainingQuantity; "Remaining Quantity")
            {
            }
            column(ReservedQuantity; "Reserved Quantity")
            {
            }
            column(ReturnReasonCode; "Return Reason Code")
            {
            }
            column(SalesAmountActual; "Sales Amount (Actual)")
            {
            }
            column(SalesAmountExpected; "Sales Amount (Expected)")
            {
            }
            column(SerialNo; "Serial No.")
            {
            }
            column(ShippedQtyNotReturned; "Shipped Qty. Not Returned")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(ShortcutDimension6Code; "Shortcut Dimension 6 Code")
            {
            }
            column(ShortcutDimension7Code; "Shortcut Dimension 7 Code")
            {
            }
            column(ShortcutDimension8Code; "Shortcut Dimension 8 Code")
            {
            }
            column(ShptMethodCode; "Shpt. Method Code")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(SourceType; "Source Type")
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
            column(TransactionSpecification; "Transaction Specification")
            {
            }
            column("TransactionType"; "Transaction Type")
            {
            }
            column(TransportMethod; "Transport Method")
            {
            }
            column(UnitofMeasureCode; "Unit of Measure Code")
            {
            }
            column(VariantCode; "Variant Code")
            {
            }
            column(WarrantyDate; "Warranty Date")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
