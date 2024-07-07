report 52138 "AME Sales Lot Details Report"
{
    ApplicationArea = All;
    Caption = 'Sales Lot Details Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = SalesLotDetails;
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
            column(ShortByCustomerNo; ShortByCustomerNo) { }
            dataitem(SalesInvoiceHeader; "Sales Invoice Header")
            {
                PrintOnlyIfDetail = true;
                RequestFilterFields = "No.", "Sell-to Customer No.", "Currency Code", "Posting Date";
                column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
                column(Document_Number; "No.") { }
                column(Posting_Date; "Posting Date") { }
                column(CurrencyCode_SalesInvoiceHeader; "Currency Code") { }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.") where(Type = const(Item), "No." = filter(<> ''));
                    DataItemLink = "Document No." = field("No.");
                    RequestFilterFields = "No.", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";
                    PrintOnlyIfDetail = true;
                    column(CountryName; CountryName) { }
                    column(Description_SalesInvoiceLine; Description) { }
                    column(NetWeight; NetWeight) { DecimalPlaces = 5 : 5; }
                    column(Order_No_; "Order No.") { }
                    column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
                    column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                    column(OrderDate; OrderDate) { }
                    column(AME_Item_Category_1; "AME Item Category 1") { }
                    column(AME_Item_Category_2; "AME Item Category 2") { }
                    column(AME_Item_Category_3; "AME Item Category 3") { }
                    column(AME_Item_Category_4; "AME Item Category 4") { }
                    column(Amount; Amount) { }
                    column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group") { }
                    column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group") { }
                    column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                    column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                    dataitem("Value Entry"; "Value Entry")
                    {
                        DataItemLink = "Document No." = field("Document No."), "Document Line No." = field("Line No.");
                        DataItemTableView = sorting("Document No.", "Document Line No.", "Document Type") where("Document Type" = const("Sales Invoice"));
                        PrintOnlyIfDetail = true;
                        dataitem("Item Ledger Entry"; "Item Ledger Entry")
                        {
                            DataItemLink = "Entry No." = field("Item Ledger Entry No.");
                            RequestFilterFields = "Lot No.";
                            column(AMEBENo_ILE; "AME BE No.") { }
                            column(AMEBOEDate_ILE; "AME BOE Date") { }
                            column(AMECountryofOrigin_ILE; "AME Country of Origin") { }
                            column(AMEItemCategory1_ILE; "AME Item Category 1") { }
                            column(AMEItemCategory2_ILE; "AME Item Category 2") { }
                            column(AMEItemCategory3_ILE; "AME Item Category 3") { }
                            column(AMEItemCategory4_ILE; "AME Item Category 4") { }
                            column(AMEMfgDate_ItemLedgerEntry; "AME Mfg. Date") { }
                            column(ExpirationDate_ItemLedgerEntry; "Expiration Date") { }
                            column(Invoiced_Quantity; "Invoiced Quantity" * -1) { }
                            column(Item_No_; "Item No.") { }
                            column(Lot_No_; "Lot No.") { }
                            column(PackingSlipNo; "Document No.") { }
                            column(Sales_Amount__Actual_; "Sales Amount (Actual)") { }
                            //Brand is missing
                        }
                    }
                    trigger OnAfterGetRecord()
                    var
                        Customer: Record Customer;
                        CountryRegion: Record "Country/Region";
                        Item: Record Item;
                        SalesHeader: Record "Sales Header";
                        SalesLine: Record "Sales Line";
                    begin
                        CountryName := '';
                        NetWeight := 0;
                        Clear(OrderDate);
                        if Customer.Get("Sell-to Customer No.") then begin
                            if CountryRegion.Get(Customer."Country/Region Code") then
                                CountryName := CountryRegion.Name;
                        end;
                        if Item.Get("No.") then begin
                            NetWeight := Item."Net Weight";
                        end;
                        if SalesLine.Get(SalesLine."Document Type"::Order, "Order No.", "Order Line No.") then begin
                            SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
                            OrderDate := SalesHeader."Order Date";
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
                group(Filters)
                {
                    field(ShortByCustomerNo; ShortByCustomerNo)
                    {
                        ApplicationArea = all;
                        Caption = 'Short By Customer No.';
                    }
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
        // layout(OrderShipDetails)
        // {
        //     Caption = 'Order Shipment Details';
        //     Type = RDLC;
        //     LayoutFile = 'src/Reports/Layout/OrderShipmentDetails.RDL';
        // }
        layout(SalesLotDetails)
        {
            Caption = 'Sales Lot Details';
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/SalesLotDetails.RDL';
        }
        layout(SalesLotDetailsExcel)
        {
            Caption = 'Sales Lot Details - Excel';
            Type = Excel;
            LayoutFile = 'src/Reports/Layout/SalesLotDetails.xlsx';
        }
        // layout(SaberAndFaseh)
        // {
        //     Caption = 'Saber & Faseh';
        //     Type = RDLC;
        //     LayoutFile = 'src/Reports/Layout/SaberAndFaseh.RDL';
        // }
    }
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;

    end;

    var
        CompInfo: Record "Company Information";
        PackingSlipNo: Code[20];
        ShortByCustomerNo: Boolean;
        CountryName: text[100];
        NetWeight: Decimal;
        OrderDate: Date;
}
