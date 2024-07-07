report 52132 "AME Posted Purch. Tracker Rep"
{
    Caption = 'Posted Purchase Tracker Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'src/Reports/Layout/Posted Purchase Tracker Report.rdl';
    ApplicationArea = Basic, Suite;
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("Posting Date");
            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name") { }
            column(CompanyName; COMPANYPROPERTY.DisplayName()) { }
            column(ReportDate; workdate()) { }
            column(No_PurchaseHeader; "No.") { }
            column(Amount_PurchaseHeader; Amount) { }
            column(AmtRcdNotInvoicedLCY_PurchaseHeader; "Remaining Amount") { }
            column(AmountIncludingVAT_PurchaseHeader; "Amount Including VAT") { }
            column(CurrencyCode_PurchaseHeader; "Currency Code") { }
            column(PostingDate_PurchaseHeader; "Posting Date") { }
            column(ShortcutDimension1Code_PurchaseHeader; "Shortcut Dimension 1 Code") { }
            column(ShortcutDimension2Code_PurchaseHeader; "Shortcut Dimension 2 Code") { }
            column(PostingDescription_PurchaseHeader; "AME Description") { }
            column(OrderDate_PurchaseHeader; "Order Date") { }
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture) { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            column(ReportCap; ReportCap) { }
            column(Due_Date; "Due Date") { }
            column(Order_No_; "Order No.") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }


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
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    var
        CompInfo: Record "Company Information";
        AmtRecNotInv: Decimal;
        ReportCap: Label 'Posted Purchase Tracker Report';
}
