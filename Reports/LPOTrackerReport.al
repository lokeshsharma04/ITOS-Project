report 52131 "AME LPO Tracker Report"
{
    Caption = 'LPO Tracker Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'src/Reports/Layout/LPO Tracker Report.rdl';
    ApplicationArea = Basic, Suite;
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("Posting Date");
            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName()) { }
            column(ReportDate; workdate()) { }
            column(No_PurchaseHeader; "No.") { }

            column(Amount_PurchaseHeader; Amount) { }

            column(AmtRcdNotInvoicedLCY_PurchaseHeader; AmtRecNotInv) { }
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
            trigger OnAfterGetRecord()
            begin
                PurchaseHeader.CalcFields("Amt. Rcd. Not Invoiced (LCY)");
                AmtRecNotInv := PurchaseHeader."Amt. Rcd. Not Invoiced (LCY)";
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
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
        AmtRecNotInv := 0;
    end;

    var
        CompInfo: Record "Company Information";
        ReportCap: Label 'LPO Tracker Report';
        AmtRecNotInv: Decimal;
}
