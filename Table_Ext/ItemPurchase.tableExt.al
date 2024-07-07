tableextension 52103 "AME Purchase Price" extends "Purchase Price"
{
    trigger OnAfterInsert()
    var
    begin
        CloseOldPrices(Rec);
    end;

    local procedure CloseOldPrices(PurchasePrice: Record "Purchase Price")
    var
        PurchasePriceOldEntry: Record "Purchase Price";
    begin
        with PurchasePrice do begin
            PurchasePriceOldEntry.SETCURRENTKEY("Item No.", "Vendor No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity");
            PurchasePriceOldEntry.SETRANGE("Item No.", "Item No.");
            PurchasePriceOldEntry.SetRange("Vendor No.", "Vendor No.");
            PurchasePriceOldEntry.SETRANGE("Currency Code", "Currency Code");
            PurchasePriceOldEntry.SETRANGE("Variant Code", "Variant Code");
            PurchasePriceOldEntry.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
            PurchasePriceOldEntry.SETRANGE("Minimum Quantity", "Minimum Quantity");
            PurchasePriceOldEntry.SETFILTER("Starting Date", '<%1', "Starting Date");
            if PurchasePriceOldEntry.FindFirst() then
                repeat
                    if PurchasePriceOldEntry."Ending Date" = 0D then begin
                        PurchasePriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                        PurchasePriceOldEntry.Modify(true)
                    end;
                until PurchasePriceOldEntry.Next() = 0;

        end;

    end;
}