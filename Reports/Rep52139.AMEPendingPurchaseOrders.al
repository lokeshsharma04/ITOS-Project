report 52139 "AME Pending Purchase Orders"
{
    ApplicationArea = All;
    Caption = 'Pending Purchase Orders';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Summary;

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order), "AME Purch. Order Type" = const(Trading));
            RequestFilterFields = "Buy-from Vendor No.", "Currency Code", "Your Reference", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Expected Receipt Date";
            PrintOnlyIfDetail = true;

            column(CompanyPicture; CompInfo.Picture) { }
            column(Filters; Filters) { }
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Order_No_; "No.") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Order_Address_Code; "Order Address Code") { }
            column(Order_Date; "Order Date") { }

            column(ReceiptMonth; FORMAT("Expected Receipt Date", 10, '<Month Text,3>-<Year4>'))
            {
            }
            column(Location_Code; "Location Code") { }
            column(Currency_Code; "Currency Code") { }
            column(Your_Reference; "Your Reference") { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where(Type = const(item), "Outstanding Quantity" = filter(> 0));
                RequestFilterFields = "No.", Description, "Expected Receipt Date", "AME Item Category 1", "AME Item Category 2", "AME Item Category 3", "AME Item Category 4", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";

                column(No_; "No.") { }
                column(Description; Description) { }
                column(Description_2; "Description 2") { }
                column(Barcode; Barcode) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Outstanding_Quantity; "Outstanding Quantity") { }
                column(Outstanding_Qty___Base_; "Outstanding Qty. (Base)") { }
                column(Qty__Received__Base_; "Qty. Received (Base)") { }
                column(Quantity_Received; "Quantity Received") { }
                column(RcvdAmt; RcvdAmt) { }
                column(UnitCost; UnitCost) { }
                column(Amount; Amount) { }
                column(Outstanding_Amount; "Outstanding Amount") { }
                column(AME_Item_Category_1; "AME Item Category 1") { }
                column(AME_Item_Category_2; "AME Item Category 2") { }
                column(AME_Item_Category_3; "AME Item Category 3") { }
                column(AME_Item_Category_4; "AME Item Category 4") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Amt__Rcd__Not_Invoiced; "Amt. Rcd. Not Invoiced") { }
                column(Amt__Rcd__Not_Invoiced__LCY_; "Amt. Rcd. Not Invoiced (LCY)") { }
                column(GitQty; GitQty) { }
                column(GitQtyBase; GitQtyBase) { }
                column(GItAmount; GItAmount) { }
                column(PendingAfterGITQty; PendingAfterGITQty) { }
                column(PendingAfterGITAmt; PendingAfterGITAmt) { }
                column(Expected_Receipt_Date; "Expected Receipt Date") { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(GitQty);
                    Clear(GitQtyBase);
                    Clear(WhseReceiptLine);
                    Clear(GItAmount);
                    Clear(UnitCost);
                    Clear(RcvdAmt);
                    Clear(PendingAfterGITAmt);
                    Clear(PendingAfterGITQty);
                    Clear(Barcode);
                    WhseReceiptLine.Reset();
                    WhseReceiptLine.SetCurrentKey("No.", "Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    WhseReceiptLine.SetRange("Item No.", "Purchase Line"."No.");
                    WhseReceiptLine.SetRange("Source Type", Database::"Purchase Line");
                    WhseReceiptLine.SetRange("Source Subtype", WhseReceiptLine."Source Subtype"::"1");
                    WhseReceiptLine.SetRange("Source No.", "Purchase Line"."Document No.");
                    WhseReceiptLine.SetRange("Source Line No.", "Purchase Line"."Line No.");
                    WhseReceiptLine.SetFilter("AME Shipment Status", '>0');
                    WhseReceiptLine.SetFilter("Qty. to Receive", '>0');
                    if WhseReceiptLine.FindSet() then begin
                        WhseReceiptLine.CalcSums("Qty. to Receive");
                        WhseReceiptLine.CalcSums("Qty. to Receive (Base)");
                        GitQty := WhseReceiptLine."Qty. to Receive";
                        GitQtyBase := WhseReceiptLine."Qty. to Receive (Base)";
                    end;

                    PendingAfterGITQty := "Outstanding Quantity" - GitQty;

                    if "Outstanding Quantity" <> 0 then
                        UnitCost := "Outstanding Amount" / "Outstanding Quantity";

                    UnitCost := Round(UnitCost, GLSetup."Unit-Amount Rounding Precision", '=');

                    GItAmount := GitQty * UnitCost;
                    RcvdAmt := "Quantity Received" * UnitCost;
                    PendingAfterGITAmt := PendingAfterGITQty * UnitCost;

                    if ItemRec.Get("Purchase Line"."No.") then
                        Barcode := ItemRec."Common Item No.";

                    if "Expected Receipt Date" = 0D then
                        "Expected Receipt Date" := PurchaseHeader."Order Date";

                end;
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
        layout(Default)
        {
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/PendingPOReport.rdl';
            Caption = 'Pending Purchase Order - Detailed';
        }
        layout(Summary)
        {
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/PendingPOSummary.rdl';
            Caption = 'Pending Purchase Order - Summary';
            //
        }
    }


    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if CompInfo.Get() then
            CompInfo.CalcFields(Picture);

        if PurchaseHeader.GetFilters() <> '' then
            Filters := StrSubstNo('%1: %2', PurchaseHeader.TableCaption, PurchaseHeader.GetFilters);

        if "Purchase Line".GetFilters() <> '' then begin
            if Filters <> '' then
                Filters += ',';
            Filters += StrSubstNo('%1: %2', "Purchase Line".TableCaption, "Purchase Line".GetFilters);
        end;

        if GLSetup.Get() then;

    end;

    var
        GitQty: Decimal;
        GitQtyBase: Decimal;
        GItAmount: Decimal;
        WhseReceiptLine: Record "Warehouse Receipt Line";
        CompInfo: Record "Company Information";
        Filters: Text;
        UnitCost: Decimal;
        GLSetup: Record "General Ledger Setup";
        RcvdAmt: Decimal;
        PendingAfterGITQty: Decimal;
        PendingAfterGITAmt: Decimal;
        Barcode: Text;
        ItemRec: Record Item;
}
