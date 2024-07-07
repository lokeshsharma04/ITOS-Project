reportextension 52101 "AME Assembly BOMs" extends "Assembly BOMs"
{
    dataset
    {
        modify(Item)
        {
            RequestFilterFields = "No.", "Common Item No.", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Global Dimension 1 Code", "Global Dimension 2 Code";
        }
        modify(ItemFilter)
        {

        }
        add(Item)
        {
            column(Common_Item_No_; "Common Item No.") { }
            column(Tariff_No_; "Tariff No.") { }
            column(AME_Item_Category_1; "AME Item Category 1") { }
            column(AME_Item_Category_2; "AME Item Category 2") { }
            column(AME_Item_Category_3; "AME Item Category 3") { }
            column(AME_Item_Category_4; "AME Item Category 4") { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
        }

        add("BOM Component")
        {
            column(BOMCost; GetUnitCost("Bom Component")) { }
            column(BOMValue; "Quantity per" * GetUnitCost("Bom Component")) { }
            column(BOM_Item_Category_1; "AME Item Category 1") { }
            column(BOM_Item_Category_2; "AME Item Category 2") { }
            column(BOM_Item_Category_3; "AME Item Category 3") { }
            column(BOM_Item_Category_4; "AME Item Category 4") { }
        }
        modify("BOM Component")
        {
            RequestFilterFields = Type, "No.", Description, "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4";
        }
    }

    rendering
    {
        layout(BOMComponentExcel)
        {
            Type = Excel;
            Caption = 'BOM Components - Excel';
            LayoutFile = 'src/Reports/Layout/BOMComponents.xlsx';
        }
    }

    trigger OnPreReport()
    var

    begin
        if UserSetup.Get(UserId) then;
    end;

    local procedure GetUnitCost(BOMComponent: Record "BOM Component"): Decimal
    var
        ItemRec: Record Item;
        ResourceRec: Record Resource;
    begin
        if not UserSetup."ATOS Show Cost" then
            exit(0);

        if "BOM Component".Type = "BOM Component".Type::Item then begin
            if ItemRec.Get("BOM Component"."No.") then
                exit(ItemRec."Unit Cost");
        end else if "BOM Component".Type = "BOM Component".Type::Resource then begin
            if ResourceRec.Get("BOM Component"."No.") then
                exit(ResourceRec."Unit Cost");
        end;
    end;

    var
        UserSetup: Record "User Setup";

}
