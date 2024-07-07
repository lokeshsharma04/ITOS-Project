report 52126 "AME Stock Ledger Report"
{
    ApplicationArea = All;
    Caption = 'Stock Ledger Report';

    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Stock Ledger Report.RDL';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;
            column(No_; "No.") { }
            column(Description_Item; Description) { }
            column(BaseUOM_Item; "Base Unit of Measure") { }
            column(FromDate; FromDate) { }
            column(Todate; Todate) { }
            column(CompanyName; COMPANYPROPERTY.DisplayName()) { }
            column(CompanyPicture; CompInfo.Picture) { }
            column(ReportDate; today()) { }
            column(OpeningBalance; OpeningBalance) { }
            column(ReportFilter; ReportFilter) { }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                column(SrNo; SrNo) { }
                column(EntryType_ItemLedgerEntry; "Entry Type") { }
                column(PostingDate_ItemLedgerEntry; "Posting Date") { }
                column(Item_No_; "Item No.") { }
                column(DocumentNo_ItemLedgerEntry; "Document No.") { }
                column(Customer_Supp; Customer_Supp) { }
                column(Rate; CostAmtActual) { }
                column(QtyRece; QtyReceived) { }
                column(QtyIssued; QtyIssued) { }
                column(ReceivedValue; ReceivedValue) { }
                column(IssuedValue; IssuedValue) { }
                column(Locator; Locator) { }
                column(Batch; Batch) { }
                column(BENo; BENo) { }
                column(ExpiryDate; ExpiryDate) { }
                column(Amount_Format; GLSetup."Amount Rounding Precision") { }
                column(Quantity; Quantity) { }
                trigger OnAfterGetRecord()
                var
                    LotInF: Record "Lot No. Information";

                begin
                    QtyReceived := 0;
                    ReceivedValue := 0;
                    QtyIssued := 0;
                    IssuedValue := 0;
                    BENo := '';
                    Batch := '';
                    Clear(ExpiryDate);
                    CostAmtActual := 0;
                    SrNo += 1;

                    "Item Ledger Entry".CalcFields("Cost Amount (Actual)");

                    if Quantity > 0 then begin
                        QtyReceived := "Item Ledger Entry".Quantity;
                        ReceivedValue := "Item Ledger Entry"."Cost Amount (Actual)";
                    end else begin
                        QtyIssued := Abs("Item Ledger Entry".Quantity);
                        IssuedValue := Abs("Item Ledger Entry"."Cost Amount (Actual)");
                    end;
                    if "Item Ledger Entry"."Cost Amount (Actual)" <> 0 then
                        CostAmtActual := Round("Item Ledger Entry"."Cost Amount (Actual)" / "Item Ledger Entry".Quantity, GLSetup."Unit-Amount Rounding Precision");
                    LotInF.Reset();
                    LotInF.SetRange("Item No.", "Item Ledger Entry"."Item No.");
                    LotInF.SetRange("Lot No.", "Item Ledger Entry"."Lot No.");
                    LotInF.SetRange("Variant Code", "Item Ledger Entry"."Variant Code");
                    if LotInF.FindFirst() then begin
                        BENo := LotInF."BE No.";
                        Batch := LotInF.GetLotNoForPrint();
                        ExpiryDate := LotInF."Expiry Date";
                    end else
                        Batch := "Item Ledger Entry"."Lot No.";
                    GetCustomerOrSupp("Item Ledger Entry");
                end;

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    "Item Ledger Entry".SetFilter("Posting Date", '%1..%2', FromDate, Todate);
                end;

            }
            trigger OnPreDataItem()
            begin
                SrNo := 0;
            end;

            trigger OnAfterGetRecord()
            var
                ItemLedgEntr: record "Item Ledger Entry";
                ItemRec: Record Item;
            begin
                // ItemRec.CopyFilters(Item);
                // ItemRec.SetFilter("Date Filter", '010101..%1', CalcDate('-1D', FromDate));
                // if ItemRec.FindFirst() then begin
                //     ItemRec.CalcFields(Inventory);
                //     OpeningBalance := ItemRec.Inventory;
                // end;

                OpeningBalance := 0;
                ItemLedgEntr.Reset();
                ItemLedgEntr.SetRange("Item No.", Item."No.");
                if Item.GetFilter("Location Filter") <> '' then
                    ItemLedgEntr.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                ItemLedgEntr.SetFilter("Posting Date", '010101..%1', CalcDate('-1D', FromDate));
                if ItemLedgEntr.FindSet() then begin
                    ItemLedgEntr.CalcSums(Quantity);
                    OpeningBalance := ItemLedgEntr.Quantity;
                end;

            end;
        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = all;
                        Caption = 'From Date';
                    }
                    field(ToDate; Todate)
                    {
                        ApplicationArea = all;
                        Caption = 'To Date';
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        Clear(ReportFilter);
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
        if GLSetup.Get() then;
    end;

    trigger OnPreReport()
    begin
        if (FromDate = 0D) or (Todate = 0D) then
            Error('Date Filter must have a value');
        if Item.GetFilters() <> '' then
            ReportFilter := Item.GetFilters();
        if "Item Ledger Entry".GetFilters <> '' then
            ReportFilter += '  , ' + "Item Ledger Entry".GetFilters();
    end;

    var
        CompInfo: Record "Company Information";
        FromDate: date;
        Todate: date;
        SrNo: Integer;
        Customer_Supp: text[250];
        QtyReceived: Decimal;
        ReceivedValue: Decimal;
        QtyIssued: Decimal;
        IssuedValue: Decimal;
        ExpiryDate: date;
        Batch: Code[20];
        BENo: Text[50];
        OpeningBalance: Decimal;
        Locator: Code[20];
        ReportFilter: Text;
        GLSetup: Record "General Ledger Setup";
        CostAmtActual: Decimal;

    local procedure GetCustomerOrSupp(ItemLedgerEntry: Record "Item Ledger Entry")
    begin

        Customer_Supp := '';
        ItemLedgerEntry.CalcFields("ATOS Customer Name", "ATOS Vendor Name");
        if ItemLedgerEntry."Source Type" = ItemLedgerEntry."Source Type"::Customer then
            Customer_Supp := ItemLedgerEntry."ATOS Customer Name" else
            if ItemLedgerEntry."Source Type" = ItemLedgerEntry."Source Type"::Vendor then
                Customer_Supp := ItemLedgerEntry."ATOS Vendor Name";

    end;
}
