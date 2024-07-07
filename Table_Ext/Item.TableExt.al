tableextension 52100 "AME Item" extends Item
{
    fields
    {
        field(52111; "AME Long Description 2"; Text[250])
        {
            Caption = 'Long Description';
            DataClassification = CustomerContent;

        }
        field(52112; "AME Carton UOM"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Carton UOM';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate()
            var
                ItemUnitOfMeasure: record "Item Unit of Measure";
            begin
                if rec.Type = Rec.Type::Inventory then
                    if "AME Carton UOM" <> '' then begin
                        ItemUnitOfMeasure.Get("No.", "AME Carton UOM");

                    end;
            end;
        }
        field(52113; "AME Carton Qty"; Decimal)
        {
            Caption = 'Carton Qty';
            FieldClass = FlowField;
            CalcFormula = lookup("Item Unit of Measure"."Qty. per Unit of Measure" where("Item No." = field("No."), Code = field("AME Carton UOM")));
        }


        field(52115; "AME Pallet qty"; Decimal)
        {
            Caption = 'Pallet qty';
            DataClassification = CustomerContent;

        }
        field(52116; "AME Min. Order Qty."; Decimal)
        {
            Caption = 'Min. Order Qty';
            DataClassification = CustomerContent;

        }
        field(52117; "AME Item Category 1"; Code[30])
        {
            Caption = 'Areen Category';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(0));
        }
        field(52118; "AME Item Category 2"; Code[30])
        {
            Caption = 'Areen Sub Category 1';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(1));
        }
        field(52119; "AME Item Category 3"; Code[30])
        {
            Caption = 'Areen Sub Category 2';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(2));
        }
        field(52120; "AME Item Category 4"; Code[30])
        {
            Caption = 'Areen Sub Category 3';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(3));
        }
        field(52121; "AME Item Category 5"; Code[30])
        {
            Caption = 'Pigeon Category';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(4));
        }
        field(52122; "AME Item Category 6"; Code[30])
        {
            Caption = 'Pigeon Sub Category 1';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(5));
        }
        field(52123; "AME Item Category 7"; Code[30])
        {
            Caption = 'Pigeon Sub Category 2';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(6));
        }
        field(52124; "AME Item Category 8"; Code[30])
        {
            Caption = 'Pigeon Sub Category 3';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(7));
        }
        field(52125; "AME Item Category 9"; Code[30])
        {
            Caption = 'Pigeon Sub Category 4';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(8));
        }
        field(52126; "AME Item Category 10"; Code[30])
        {
            Caption = 'Pigeon Sub Category 5';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(9));
        }
        field(52127; "AME Item Category 11"; Code[30])
        {
            Caption = 'Marketing Category';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(10));
        }
        field(52128; "AME Item Category 12"; Code[30])
        {
            Caption = 'Marketing Sub Category 1';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(11));
        }
        field(52129; "AME Item Category 13"; Code[30])
        {
            Caption = 'Marketing Sub Category 2';
            DataClassification = CustomerContent;
            TableRelation = "AME Item Category"."AME Code" where("AME Category Level" = filter(12));
        }
        field(52140; "AME Height"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Height';
        }
        field(52141; "AME Width"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Width';
        }
        field(52142; "AME Length"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Length';
        }

        modify("Common Item No.")
        {
            Caption = 'Barcode';
        }

        modify("Tariff No.")
        {
            Caption = 'HS Code';
        }
        field(52130; "AME BOQ Qty."; Decimal)
        {
            Caption = 'BOQ Quantity';
            DataClassification = ToBeClassified;
        }

    }

    procedure ValidateItemForTrans()
    var
        myInt: Integer;
    begin
        if Rec.Type = Rec.Type::Inventory then begin
            Rec.TestField("AME Carton UOM");
            Rec.TestField("Tariff No.");
        end;
    end;

    procedure GetAvailableInv(): Decimal
    var
        AvailableToPromise: Codeunit "Available to Promise";
        AvaInv: Decimal;
        ItemRec: Record Item;
    begin
        AvaInv := 0;

        ItemRec.SetCurrentKey("No.");
        ItemRec.SetRange("No.", Rec."No.");
        if ItemRec.FindFirst() then
            AvaInv := AvailableToPromise.CalcAvailableInventory(ItemRec);

        exit(AvaInv);


    end;

    procedure GetAvailableInv(var ItemRec: Record Item): Decimal
    var
        AvailableToPromise: Codeunit "Available to Promise";
        AvaInv: Decimal;
    begin
        AvaInv := 0;

        if ItemRec.FindFirst() then
            AvaInv := AvailableToPromise.CalcAvailableInventory(ItemRec);

        exit(AvaInv);


    end;

    procedure ValidateCartonQty(BaseQty: Decimal)
    var
        MaxQty: Decimal;
        MinQty: Decimal;
    begin
        ValidateCartonQty(BaseQty, MaxQty, MinQty);
    end;

    procedure ValidateBOQQty(BaseQty: Decimal)
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        BOQQTY: Decimal;
        QtyDiff: Decimal;
    begin
        if BaseQty = 0 then
            exit;

        if Rec."AME BOQ Qty." = 0 then
            exit;

        BOQQTY := Rec."AME BOQ Qty.";

        if BaseQty = BOQQTY then
            exit;

        if BaseQty < BOQQTY then
            Message(Text0003, BOQQTY)
        else begin
            QtyDiff := BaseQty MOD BOQQTY;
            if QtyDiff <> 0 then
                Message(Text0004, BaseQty - QtyDiff, BaseQty - QtyDiff + BOQQTY);
        end;
    end;


    procedure ValidateCartonQty(BaseQty: Decimal; var MaxQty: Decimal; var MinQty: Decimal)
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        PerCartonQty: Decimal;
        QtyDiff: Decimal;
    begin
        if BaseQty = 0 then
            exit;

        Rec.TestField("AME Carton UOM");
        if ItemUnitOfMeasure.Get("No.", "AME Carton UOM") then
            PerCartonQty := ItemUnitOfMeasure."Qty. per Unit of Measure"
        else
            Error('Item unit of measure not found!\Item: %1, UOM: %2', Rec."No.", Rec."AME Carton UOM");

        if BaseQty = PerCartonQty then
            exit;

        if BaseQty < PerCartonQty then
            Message(Text0001, PerCartonQty)
        else begin
            QtyDiff := BaseQty MOD PerCartonQty;
            if QtyDiff <> 0 then
                Message(Text0002, BaseQty - QtyDiff, BaseQty - QtyDiff + PerCartonQty);
        end;
    end;

    procedure GetCountryOfOriginName(): Text
    var
        Country: Record "Country/Region";
    begin
        if Rec."Country/Region of Origin Code" <> '' then
            if Country.Get(Rec."Country/Region of Origin Code") then
                exit(Country.Name);

        exit('');
    end;

    var
        myInt: Integer;
        Text0001: Label 'Entered quantity should be full carton qty.\Nearest full carton quantity : %1';
        Text0003: Label 'Entered quantity should be full BOQ Qty.\Nearest full BOQ Quantity : %1';
        Text0002: Label 'Entered quantity should be full carton qty.\Nearest full carton quantity: %1 or %2';
        Text0004: Label 'Entered quantity should be full BOQ Qty.\Nearest full BOQ Quantity: %1 or %2';

}




