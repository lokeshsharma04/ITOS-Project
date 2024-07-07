xmlport 52100 "AME Item"
{
    Caption = 'Item';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(Root)
        {

            tableelement(Item; Item)
            {
                XmlName = 'Item';
                RequestFilterFields = "No.";

                textelement(ItemNo) { }
                textelement(Description1)
                {
                }
                textelement(LongDescription2)
                {
                }
                textelement(Baseuom)
                {
                }
                textelement(CartonUOM)
                {
                }
                textelement(CartonQty) { }
                textelement(ItemCategoryCode)
                {
                }
                textelement(ItemCategory1) { }
                textelement(ItemCategory2) { }
                textelement(ItemCategory3) { }
                textelement(ItemCategory4) { }
                textelement(ItemCategory5) { }
                textelement(ItemCategory6) { }
                textelement(ItemCategory7) { }
                textelement(ItemCategory8) { }
                textelement(ItemCategory9) { }
                textelement(ItemCategory10) { }
                textelement(ItemCategory11) { }
                textelement(ItemCategory12) { }
                textelement(ItemCategory13) { }
                textelement(GlobalDimension1Code)
                {
                }
                textelement(GlobalDimension2Code)
                {
                }
                textelement(MinOrderQty)
                {
                }
                textelement(Palletqty)
                {
                }
                textelement(CountryOfOrigin) { }
                textelement(HSCode)
                {
                }
                textelement(GTIN)
                {
                }
                textelement(Barcode) { }
                textelement(NetWeight)
                {
                }
                textelement(GrossWeight)
                {
                }
                textelement(UnitVolume)
                {
                }
                textelement(Replenishmentsystem)
                {
                }
                textelement(TemplateCode)
                {
                }
                textelement(Status) { }
                trigger OnBeforeInsertRecord()
                var
                    ItemRec: Record Item;
                    existingRec: Boolean;
                    ItemUOM: Record "Item Unit of Measure";
                begin
                    if FirstLine then begin
                        FirstLine := false;
                        currXMLport.Skip();
                    end;

                    count += 1;

                    ItemCode := ItemNo;
                    MyDialog.Update(1, ItemNo);
                    MyDialog.Update(2, count);
                    Clear(ItemRec);
                    if ItemRec.GEt(ItemNo) then begin
                        existingRec := true;
                    end else begin

                        if TemplateCode = '' then
                            Error('Template code must not be blank. Item No: %1', ItemNo);

                        ItemRec.Init();
                        ItemRec.Validate("No.", ItemNo);
                        ItemRec.Insert(true);
                        if ItemTempl.Get(TemplateCode) then
                            ItemTemplMgt.ApplyItemTemplate(ItemRec, ItemTempl)
                        else
                            Error('Item template %1 does not exists!', TemplateCode);
                    end;

                    ItemRec.SetStatusSkipCheck(true);


                    Evaluate(ItemRec.Description, Description1);
                    Evaluate(ItemRec."AME Long Description 2", LongDescription2);
                    Evaluate(ItemRec."Base Unit of Measure", Baseuom);

                    if CartonUOM <> '' then begin
                        if not ItemUOM.Get(ItemRec."No.", CartonUOM) then begin
                            Clear(ItemUOM);
                            ItemUOM.Init();
                            ItemUOM.Validate("Item No.", ItemRec."No.");
                            ItemUOM.Validate(Code, CartonUOM);
                            Evaluate(ItemUOM."Qty. per Unit of Measure", CartonQty);
                            ItemUOM.Insert(false);
                        end;

                        Evaluate(ItemRec."AME Carton UOM", CartonUOM);
                    end;
                    Evaluate(ItemRec."Item Category Code", ItemCategoryCode);
                    //
                    InsertItemCategory(ItemRec);


                    if MinOrderQty <> '' then
                        Evaluate(ItemRec."AME Min. Order Qty.", MinOrderQty);
                    if Palletqty <> '' then
                        Evaluate(ItemRec."AME Pallet qty", Palletqty);
                    Evaluate(ItemRec."Country/Region of Origin Code", CountryOfOrigin);
                    Evaluate(ItemRec."Tariff No.", HSCode);
                    Evaluate(ItemRec.GTIN, GTIN);
                    Evaluate(ItemRec."Common Item No.", Barcode);
                    if NetWeight <> '' then
                        Evaluate(ItemRec."Net Weight", NetWeight);
                    if GrossWeight <> '' then
                        Evaluate(ItemRec."Gross Weight", GrossWeight);
                    if UnitVolume <> '' then
                        Evaluate(ItemRec."Unit Volume", UnitVolume);

                    Evaluate(ItemRec."Replenishment System", Replenishmentsystem);
                    ItemRec.Validate("Global Dimension 1 Code", GlobalDimension1Code);
                    ItemRec.Validate("Global Dimension 2 Code", GlobalDimension2Code);

                    if UpperCase(Status) = UpperCase(Format(ItemRec."ATOS Status"::Released)) then begin
                        if ItemRec."ATOS Status" <> ItemRec."ATOS Status"::Released then begin
                            ItemClass.ReleaseItem(ItemRec);
                            ItemRec.Get(ItemRec."No.");
                        end else
                            Evaluate(ItemRec."ATOS Status", Status);
                    end else begin
                        Evaluate(ItemRec."ATOS Status", Status);
                    end;

                    ItemRec.Modify();

                    currXMLport.Skip();
                end;

            }
        }

    }
    trigger OnPreXmlPort()
    begin
        FirstLine := true;

        MyDialog.Open('Processing Item: #1###################\Count: #2############');
    end;

    trigger OnPostXmlPort()
    var
        myInt: Integer;
    begin
        MyDialog.Close();
    end;

    local procedure InsertItemCategory(var ItemRec: Record Item)
    begin
        if ItemCategory1 <> '' then
            ItemRec.Validate("AME Item Category 1", ItemCategory1);
        if ItemCategory2 <> '' then
            ItemRec.Validate("AME Item Category 2", ItemCategory2);
        if ItemCategory3 <> '' then
            ItemRec.Validate("AME Item Category 3", ItemCategory3);
        if ItemCategory4 <> '' then
            ItemRec.Validate("AME Item Category 4", ItemCategory4);
        if ItemCategory5 <> '' then
            ItemRec.Validate("AME Item Category 5", ItemCategory5);
        if ItemCategory6 <> '' then
            ItemRec.Validate("AME Item Category 6", ItemCategory6);
        if ItemCategory7 <> '' then
            ItemRec.Validate("AME Item Category 7", ItemCategory7);
        if ItemCategory8 <> '' then
            ItemRec.Validate("AME Item Category 8", ItemCategory8);
        if ItemCategory9 <> '' then
            ItemRec.Validate("AME Item Category 9", ItemCategory9);
        if ItemCategory10 <> '' then
            ItemRec.Validate("AME Item Category 10", ItemCategory10);
        if ItemCategory11 <> '' then
            ItemRec.Validate("AME Item Category 11", ItemCategory11);
        if ItemCategory12 <> '' then
            ItemRec.Validate("AME Item Category 12", ItemCategory12);
        if ItemCategory13 <> '' then
            ItemRec.Validate("AME Item Category 13", ItemCategory13);
    end;

    var
        count: Integer;
        FirstLine: Boolean;
        ItemTempl: Record "Item Templ.";
        ItemTemplMgt: Codeunit "Item Templ. Mgt.";
        ItemClass: Codeunit "ATOS Item Class";
        MyDialog: Dialog;
        ItemCode: Code[20];
}