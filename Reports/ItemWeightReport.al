report 52142 "AME Item Weight Report"
{
    ApplicationArea = All;
    Caption = 'Item Weight Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/ItemWeightReport.RDL';

    dataset
    {
        dataitem(Item; Item)
        {

            column(CompName; CompInfo.Name) { }
            column(Picture; CompInfo.Picture) { }
            column(No_; "No.") { }
            column(Description; Description) { }
            column(Base_Unit_of_Measure; "Base Unit of Measure") { }
            column(Tariff_No_; "Tariff No.") { }
            column(Country_Region_of_Origin_Code; "Country/Region of Origin Code") { }
            column(Net_Weight; "Net Weight") { }
            column(AME_Carton_UOM; "AME Carton UOM") { }
            column(Gross_Weight; "Gross Weight") { }
            column(CartonQty; CartonQty) { }
            column(Common_Item_No_; "Common Item No.") { }

            trigger OnAfterGetRecord()

            begin
                Clear(ItemUOM);
                Clear(CartonQty);
                if ItemUOM.Get(Item."No.", Item."AME Carton UOM") then
                    CartonQty := ItemUOM."Qty. per Unit of Measure";
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        Carton_Qty: Text;

    trigger OnPreReport()

    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        ItemUOM: Record "Item Unit of Measure";
        CartonQty: Decimal;
}
