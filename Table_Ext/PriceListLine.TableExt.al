tableextension 52160 "AME Price List Line" extends "Price List Line"
{
    fields
    {
        field(52125; "AME Item Category 1"; Code[30])
        {
            Caption = 'Areen Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 1" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(0));
        }
        field(52126; "AME Item Category 2"; Code[30])
        {
            Caption = 'Areen Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 2" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(1));
        }
        field(52127; "AME Item Category 3"; Code[30])
        {
            Caption = 'Areen Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 3" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(2));
        }
        field(52128; "AME Item Category 4"; Code[30])
        {
            Caption = 'Areen Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 4" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(3));
        }
        field(52129; "AME Item Category 5"; Code[30])
        {
            Caption = 'Pigeon Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 5" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(4));
        }
        field(52130; "AME Item Category 6"; Code[30])
        {
            Caption = 'Pigeon Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 6" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(5));
        }
        field(52131; "AME Item Category 7"; Code[30])
        {
            Caption = 'Pigeon Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 7" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(6));
        }
        field(52132; "AME Item Category 8"; Code[30])
        {
            Caption = 'Pigeon Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 8" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(7));
        }
        field(52133; "AME Item Category 9"; Code[30])
        {
            Caption = 'Pigeon Sub Category 4';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 9" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(8));
        }
        field(52134; "AME Item Category 10"; Code[30])
        {
            Caption = 'Pigeon Sub Category 5';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 10" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(9));
        }
        field(52135; "AME Item Category 11"; Code[30])
        {
            Caption = 'Marketing Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 11" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(10));
        }
        field(52136; "AME Item Category 12"; Code[30])
        {
            Caption = 'Marketing Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 12" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(11));
        }
        field(52137; "AME Item Category 13"; Code[30])
        {
            Caption = 'Marketing Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 13" where("No." = field("Product No.")));
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(12));
        }
        field(52150; "AME Prod. Global Dim. 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."Global Dimension 1 Code" where("No." = field("Product No.")));
        }
        field(52151; "AME Prod. Global Dim. 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."Global Dimension 2 Code" where("No." = field("Product No.")));
        }
    }
    trigger OnAfterInsert()
    begin
        ClosePrices();
    end;

    trigger OnAfterModify()
    var
    begin
        if (rec."Starting Date" <> xRec."Starting Date") or (rec."Asset No." <> xRec."Asset No.") then
            ClosePrices();
    end;

    procedure ClosePrices()
    var
    begin
        if Rec."Price Type" = Rec."Price Type"::Sale then
            CloseOldSalesPrices(Rec)
        else
            If Rec."Price Type" = Rec."Price Type"::Purchase then
                CloseOldPurchPrices(Rec);
    end;

    procedure CloseOldPurchPrices(PurchasePrice: Record "Price List Line")
    var
        PurchasePriceOldEntry: Record "Price List Line";
    begin
        if PurchasePrice."Asset Type" <> PurchasePrice."Asset Type"::Item then
            exit;

        PurchasePriceOldEntry.SETCURRENTKEY("Price Type", "Source Type", "Source No.", "Asset No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity");
        PurchasePriceOldEntry.SetRange("Price List Code", PurchasePrice."Price List Code");

        PurchasePriceOldEntry.SetRange("Price Type", PurchasePriceOldEntry."Price Type"::Purchase);
        PurchasePriceOldEntry.SetRange("Source Type", PurchasePrice."Source Type");
        PurchasePriceOldEntry.SetRange("Source No.", PurchasePrice."Source No.");
        PurchasePriceOldEntry.SetRange("Asset Type", PurchasePriceOldEntry."Asset Type");
        PurchasePriceOldEntry.SETRANGE("Asset No.", PurchasePrice."Asset No.");
        PurchasePriceOldEntry.SETRANGE("Currency Code", PurchasePrice."Currency Code");
        PurchasePriceOldEntry.SETRANGE("Variant Code", PurchasePrice."Variant Code");
        PurchasePriceOldEntry.SETRANGE("Unit of Measure Code", PurchasePrice."Unit of Measure Code");
        PurchasePriceOldEntry.SETRANGE("Minimum Quantity", PurchasePrice."Minimum Quantity");
        PurchasePriceOldEntry.SETFILTER("Starting Date", '<%1', PurchasePrice."Starting Date");
        if PurchasePriceOldEntry.FindFirst() then
            repeat
                if PurchasePriceOldEntry."Ending Date" = 0D then begin
                    PurchasePriceOldEntry."Ending Date" := CALCDATE('-1D', PurchasePrice."Starting Date");
                    PurchasePriceOldEntry.Modify(true)
                end;
            until PurchasePriceOldEntry.Next() = 0;
    end;

    procedure CloseOldSalesPrices(SalesPrice: Record "Price List Line")
    var
        SalesPriceOldEntry: Record "Price List Line";
        Customer: Record Customer;
    begin
        if SalesPrice."Asset Type" <> SalesPrice."Asset Type"::Item then
            exit;
        SalesPriceOldEntry.SETCURRENTKEY("Price Type", "Source Type", "Source No.", "Asset No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity");
        SalesPriceOldEntry.SetRange("Price List Code", SalesPrice."Price List Code");
        SalesPriceOldEntry.SetRange("Price Type", SalesPriceOldEntry."Price Type"::Sale);
        SalesPriceOldEntry.SetRange("Source Type", SalesPrice."Source Type");
        SalesPriceOldEntry.SetRange("Source No.", SalesPrice."Source No.");
        SalesPriceOldEntry.SetRange("Asset Type", SalesPriceOldEntry."Asset Type");
        SalesPriceOldEntry.SETRANGE("Asset No.", SalesPrice."Asset No.");
        SalesPriceOldEntry.SETRANGE("Currency Code", SalesPrice."Currency Code");
        SalesPriceOldEntry.SETRANGE("Variant Code", SalesPrice."Variant Code");
        SalesPriceOldEntry.SETRANGE("Unit of Measure Code", SalesPrice."Unit of Measure Code");
        SalesPriceOldEntry.SETRANGE("Minimum Quantity", SalesPrice."Minimum Quantity");
        SalesPriceOldEntry.SETFILTER("Starting Date", '<%1', SalesPrice."Starting Date");
        if SalesPriceOldEntry.FindFirst() then
            repeat
                if SalesPriceOldEntry."Ending Date" = 0D then begin
                    SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', SalesPrice."Starting Date");
                    SalesPriceOldEntry.Modify(true)
                end;
            until SalesPriceOldEntry.Next() = 0;

        if SalesPrice."Source Type" = SalesPrice."Source Type"::"Customer Price Group" then begin
            SalesPriceOldEntry.SetRange("Source Type", SalesPrice."Source Type"::Customer);
            SalesPriceOldEntry.SetRange("Source No.");

            Clear(Customer);
            Customer.SetCurrentKey("No.");
            Customer.SetRange("Customer Price Group", SalesPrice."Source No.");
            if Customer.FindFirst() then
                repeat
                    SalesPriceOldEntry.SetRange("Source No.", Customer."No.");
                    if SalesPriceOldEntry.FindFirst() then
                        repeat
                            if SalesPriceOldEntry."Ending Date" = 0D then begin
                                SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                                SalesPriceOldEntry.Modify(true);
                            end;
                        until SalesPriceOldEntry.Next() = 0;
                until Customer.Next() = 0;
        end;

        if Salesprice."Source Type" = Salesprice."Source Type"::"All Customers" then begin
            SalesPriceOldEntry.SetRange("Source Type");
            SalesPriceOldEntry.SetRange("Source No.");
            if SalesPriceOldEntry.FindFirst() then
                repeat
                    if SalesPriceOldEntry."Ending Date" = 0D then begin
                        SalesPriceOldEntry."Ending Date" := CALCDATE('-1D', "Starting Date");
                        SalesPriceOldEntry.Modify(true);
                    end;
                until SalesPriceOldEntry.Next() = 0;
        end;

    end;
}
