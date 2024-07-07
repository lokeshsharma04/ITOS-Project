report 52144 "AME Pending Sales Order Report"
{
    ApplicationArea = All;
    Caption = 'Pending Sales Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = PeningSOReportExcel;
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture) { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            dataitem(SalesHeader; "Sales Header")
            {
                RequestFilterFields = "Document Type", "Sell-to Customer No.", "Shipment Date", "Ship-to Code", "Ship-to Country/Region Code", "Currency Code";
                PrintOnlyIfDetail = true;
                column(No_; "No.") { }
                column(Line_SSD_Month; "Posting Date") { }
                column(SelltoCustomerNo_SalesLine; "Sell-to Customer No.") { }
                column(SelltoCustomerName_SalesHeader; "Sell-to Customer Name") { }
                column(Shipment_Date; "Shipment Date") { }
                column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
                column(Status; Status) { }
                column(AME_SO_Status; "AME SO Status") { }
                column(External_Document_No_; "External Document No.") { }
                column(AME_Price_Date; "AME Price Date") { }
                column(Order_Date; "Order Date") { }
                column(Document_Date; "Document Date") { }
                column(Work_Description; SalesHeader.GetWorkDescription()) { }
                column(Payment_Terms_Code; "Payment Terms Code") { }
                column(Currency_Code; "Currency Code") { }
                dataitem("Sales Line"; "Sales Line")
                {
                    RequestFilterFields = "No.", Description, "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Shipment Date";
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                    DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Outstanding Quantity" = filter(<> 0));
                    column(UnitPrice_SalesLine; "Unit Price") { }
                    column(Description_SalesLine; Description) { }
                    column(Item_Code; "No.") { }
                    column(PostingDate_SalesLine; "Posting Date") { }
                    column(Shipment_Date_Line; "Shipment Date") { }
                    column(AME_Price_Date_Line; "AME Price Date") { }
                    column(AME_Item_Category_1; "AME Item Category 1") { }
                    column(AME_Item_Category_2; "AME Item Category 2") { }
                    column(AME_Item_Category_3; "AME Item Category 3") { }
                    column(AME_Item_Category_4; "AME Item Category 4") { }
                    column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                    column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                    column(Ordered_Qty; Quantity) { }
                    column(Ordered_Qty_Base; "Quantity (Base)") { }
                    column(Outstanding_Quantity; "Outstanding Quantity") { }
                    column(Outstanding_Qty___Base_; "Outstanding Qty. (Base)") { }
                    column(Outstanding_Amount; "Outstanding Amount") { }
                    column(QtyShippedBase_SalesLine; "Qty. Shipped (Base)") { }
                    column(QuantityShipped_SalesLine; "Quantity Shipped") { }
                    column(Ordered_Value; Quantity * NetUnitPrice) { }
                    column(LineAmount_SalesLine; "Line Amount") { }
                    column(shipped_Value; ShippedValue) { }
                    column(PickQty; PickQty) { }
                    column(PickQtyBase; PickQtyBase) { }
                    column(PickValue; PickValue) { }
                    column(PickedQty; PickedQty) { }
                    column(PickedQtyBase; PickedQtyBase) { }
                    column(PickedValue; PickedValue) { }
                    column(TotalPickQty; TotalPickQty) { }
                    column(TotalPickQtyBase; TotalPickQtyBase) { }
                    column(TotalPickValue; TotalPickValue) { }
                    column(PendingAfterPickQty; PendingAfterPickQty) { }
                    column(PendingAfterPickQtyBase; PendingAfterPickQtyBase) { }
                    column(PendingAmountAfterPick; PendingAmountAfterPick) { }
                    column(BackOrderQty; BackOrderQty) { }
                    column(BackOrderQtyBase; BackOrderQtyBase) { }
                    column(BackOrderValue; BackOrderValue) { }
                    column(NetUnitPrice; NetUnitPrice) { }
                    column(HS_Code; ItemRec."Tariff No.") { }
                    column(Common_Item_No; ItemRec."Common Item No.") { }
                    trigger OnAfterGetRecord()
                    var
                        WhseActivityHeader: Record "Warehouse Activity Header";
                        WhseActivityLine: Record "Warehouse Activity Line";
                        RegistrdWhseActivityLine: Record "Registered Whse. Activity Line";
                    begin
                        PickQty := 0;
                        PickedQty := 0;
                        PickValue := 0;
                        PickedValue := 0;
                        NetUnitPrice := 0;
                        ShippedValue := 0;
                        Clear(BackOrderQty);
                        Clear(BackOrderQtyBase);
                        Clear(BackOrderValue);
                        Clear(ItemRec);

                        if "Sales Line".Type = "Sales Line".Type::Item then begin
                            if ItemRec.Get("Sales Line"."No.") then;

                        end;

                        if "Sales Line"."Outstanding Qty. (Base)" <> 0 then
                            NetUnitPrice := Round("Sales Line"."Outstanding Amount" / "Sales Line"."Outstanding Quantity", GLSetup."Unit-Amount Rounding Precision", '=');

                        ShippedValue := "Quantity Shipped" * NetUnitPrice;

                        WhseActivityLine.Reset();
                        WhseActivityLine.SetRange("Source Document", WhseActivityLine."Source Document"::"Sales Order");
                        WhseActivityLine.SetRange("Activity Type", WhseActivityLine."Activity Type"::Pick);
                        WhseActivityLine.SetRange("Source No.", "Document No.");
                        WhseActivityLine.SetRange("Source Line No.", "Line No.");
                        WhseActivityLine.SetRange("Item No.", "Sales Line"."No.");
                        WhseActivityLine.SetRange("Action Type", WhseActivityLine."Action Type"::Take);
                        if WhseActivityLine.FindFirst() then begin
                            PickQtyBase := WhseActivityLine."Qty. Outstanding (Base)";
                            PickQty := WhseActivityLine."Qty. Outstanding";
                            PickValue := PickQty * NetUnitPrice;
                        end;

                        TotalPickQty := PickQty + PickedQty;
                        TotalPickQtyBase := PickQtyBase + PickedQtyBase;
                        TotalPickValue := PickValue + PickedValue;

                        PendingAfterPickQty := "Sales Line"."Outstanding Quantity" - TotalPickQty;
                        PendingAfterPickQtyBase := "Sales Line"."Outstanding Qty. (Base)" - TotalPickQtyBase;
                        PendingAmountAfterPick := PendingAfterPickQty * NetUnitPrice;

                        if "Shipment Date" < Today() then begin
                            BackOrderQty := PendingAfterPickQty;
                            BackOrderQtyBase := PendingAfterPickQtyBase;
                            BackOrderValue := PendingAmountAfterPick;
                        end;
                    end;

                }
            }
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
    rendering
    {
        layout(PeningSOReportPrint)
        {
            Type = RDLC;
            Caption = 'Pening Sales Order - Print';
            Summary = 'Pening Sales Order - Print';
            LayoutFile = 'src/Reports/Layout/PendingSalesOrderReport.RDL';
        }
        layout(PeningSOReportExcel)
        {
            Type = Excel;
            Caption = 'Pening Sales Order - Excel';
            Summary = 'Pening Sales Order - Excel';
            LayoutFile = 'src/Reports/Layout/PendingSalesOrderReport.xlsx';
        }
    }

    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;

    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if GLSetup.Get() then;
    end;

    var
        PickedQty: Decimal;
        PickedQtyBase: Decimal;
        PickQty: Decimal;
        PickQtyBase: Decimal;
        CompInfo: Record "Company Information";
        BackOrderQty: Decimal;
        BackOrderQtyBase: Decimal;
        PickValue: Decimal;
        PickedValue: Decimal;
        BackOrderValue: Decimal;
        NetUnitPrice: Decimal;
        GLSetup: Record "General Ledger Setup";
        PendingAfterPickQty: Decimal;
        PendingAfterPickQtyBase: Decimal;
        PendingAmountAfterPick: Decimal;
        ShippedValue: Decimal;
        ItemRec: Record Item;
        TotalPickQty: Decimal;
        TotalPickQtyBase: Decimal;
        TotalPickValue: Decimal;
}
