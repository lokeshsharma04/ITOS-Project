
tableextension 52102 "AME Sales Price" extends "Sales Price"
{

    trigger OnAfterInsert()
    var
    begin
        CloseOldPrices(Rec);
    end;

    local procedure CloseOldPrices(SalesPrice: Record "Sales Price")
    var
        SalesPriceOldEntry: Record "Sales Price";
        Customer: Record Customer;
    begin
        with SalesPrice do begin
            SalesPriceOldEntry.SETCURRENTKEY("Item No.", "Sales Type", "Sales Code", "Starting Date", "Currency Code",
                                              "Variant Code", "Unit of Measure Code", "Minimum Quantity");
            SalesPriceOldEntry.SETRANGE("Item No.", "Item No.");
            SalesPriceOldEntry.SETRANGE("Sales Type", "Sales Type");
            SalesPriceOldEntry.SETRANGE("Sales Code", "Sales Code");
            SalesPriceOldEntry.SETRANGE("Currency Code", "Currency Code");
            SalesPriceOldEntry.SETRANGE("Variant Code", "Variant Code");
            SalesPriceOldEntry.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
            SalesPriceOldEntry.SETRANGE("Minimum Quantity", "Minimum Quantity");
            SalesPriceOldEntry.SETFILTER("Starting Date", '<%1', "Starting Date");
            if SalesPriceOldEntry.FindFirst() then
                repeat
                    if SalesPriceOldEntry."Ending Date" = 0D then begin
                        SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                        SalesPriceOldEntry.Modify(true)
                    end;
                until SalesPriceOldEntry.Next() = 0;

            if "Sales Type" = "Sales Type"::"Customer Price Group" then begin
                SalesPriceOldEntry.SetRange("Sales Type", "Sales Type"::Customer);
                SalesPriceOldEntry.SetRange("Sales Code");

                Clear(Customer);
                Customer.SetCurrentKey("No.");
                Customer.SetRange("Customer Price Group", "Sales Code");
                if Customer.FindFirst() then
                    repeat
                        SalesPriceOldEntry.SetRange("Sales Code", Customer."No.");
                        if SalesPriceOldEntry.FindFirst() then
                            repeat
                                if SalesPriceOldEntry."Ending Date" = 0D then begin
                                    SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                                    SalesPriceOldEntry.Modify(true);
                                end;
                            until SalesPriceOldEntry.Next() = 0;
                    until Customer.Next() = 0;
            end;

            if "Sales Type" = "Sales Type"::"All Customers" then begin
                SalesPriceOldEntry.SetRange("Sales Type");
                SalesPriceOldEntry.SetRange("Sales Code");
                if SalesPriceOldEntry.FindFirst() then
                    repeat
                        if SalesPriceOldEntry."Ending Date" = 0D then begin
                            SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                            SalesPriceOldEntry.Modify(true);
                        end;
                    until SalesPriceOldEntry.Next() = 0;
            end;

        end;

    end;
}
