tableextension 52167 "AME Price List Header" extends "Price List Header"
{
    fields
    {
        modify(Status)
        {
            trigger OnBeforeValidate()
            begin
                if Rec.Status = Rec.Status::Active then begin

                    if (Rec."Price Type" = Rec."Price Type"::Sale) then
                        ValidateBeforeChangeforSale(Rec)
                    else
                        If Rec."Price Type" = Rec."Price Type"::Purchase then
                            ValidateBeforeChangeforPurch(Rec);
                end;
            end;
        }
    }

    procedure GetApplyToName() ApplyToName: Text
    var
        myInt: Integer;
        Customer: Record Customer;
        Vendor: Record Vendor;
        Contact: Record Contact;
        CustPriceGroup: Record "Customer Price Group";
        CustDiscGroup: Record "Customer Discount Group";
    begin
        case Rec."Source Type" of
            "Price Source Type"::Customer:
                begin
                    if Customer.Get("Source No.") then
                        ApplyToName := Customer.Name;
                end;
            "Price Source Type"::Vendor:
                begin
                    if Vendor.Get("Source No.") then
                        ApplyToName := Vendor.Name;
                end;
            "Price Source Type"::Contact:
                begin
                    if Contact.Get("Source No.") then
                        ApplyToName := Contact.Name;
                end;
            "Price Source Type"::"Customer Price Group":
                begin
                    if CustPriceGroup.Get("Source No.") then
                        ApplyToName := CustPriceGroup.Description;
                end;
            "Price Source Type"::"Customer Disc. Group":
                begin
                    if CustDiscGroup.Get("Source No.") then
                        ApplyToName := CustDiscGroup.Description;
                end;
        end;
    end;

    procedure ValidateBeforeChangeforSale(var PriceListHeader: Record "Price List Header")
    var
        PriceListLine: Record "Price List Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        CountBlankPrice := 0;
        SalesSetup.Get();
        PriceListLine.Reset();
        PriceListLine.SETCURRENTKEY("Price Type", "Source Type", "Source No.", "Asset No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity");
        PriceListLine.SetRange("Price List Code", PriceListHeader.Code);
        PriceListLine.SetRange("Price Type", PriceListLine."Price Type"::Sale);
        PriceListLine.SetRange("Asset Type", PriceListLine."Asset Type"::Item);
        if PriceListLine.FindSet() then
            repeat
                PriceListLine.TestField("Asset No.");
                if SalesSetup."AME UOM Req. for Price List" then
                    PriceListLine.TestField("Unit of Measure Code");
                if PriceListLine."Unit Price" = 0 then
                    CountBlankPrice += 1;
            until PriceListLine.Next() = 0;
        if CountBlankPrice <> 0 then begin
            if Not Confirm(StrSubstNo(PriceError, CountBlankPrice), false) then
                Error('Status can not be changed');
        end;
    end;

    procedure ValidateBeforeChangeforPurch(var PriceListHeader: Record "Price List Header")
    var
        PriceListLine: Record "Price List Line";
        PurchaseSetup: Record "Purchases & Payables Setup";

    begin
        CountBlankPrice := 0;
        PurchaseSetup.Get();
        PriceListLine.Reset();
        PriceListLine.SETCURRENTKEY("Price Type", "Source Type", "Source No.", "Asset No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity");
        PriceListLine.SetRange("Price List Code", PriceListHeader.Code);
        PriceListLine.SetRange("Price Type", PriceListLine."Price Type"::Purchase);
        PriceListLine.SetRange("Asset Type", PriceListLine."Asset Type"::Item);
        if PriceListLine.FindSet() then
            repeat
                PriceListLine.TestField("Asset No.");
                if PurchaseSetup."AME UOM Req. for Price List" then
                    PriceListLine.TestField("Unit of Measure Code");
                if PriceListLine."Direct Unit Cost" = 0 then
                    CountBlankPrice += 1;
            until PriceListLine.Next() = 0;
        if CountBlankPrice <> 0 then begin
            if Not Confirm(StrSubstNo(PriceError, CountBlankPrice), false) then
                Error('Status can not be changed');
        end;
    end;

    var
        PriceError: Label 'There are %1 blank unit price lines ,Would you like to proceed?';
        CountBlankPrice: Integer;
}
