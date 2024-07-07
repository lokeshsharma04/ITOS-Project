report 52130 "AME Areen Stock Adjustment"
{
    Caption = 'Stock Adjustment';
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Stock Adjustment Report.rdl';
    ApplicationArea = Basic, Suite;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Item Register"; "Item Register")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(ItemRegFilterCopyText; TableCaption + ': ' + ItemRegFilter)
            {
            }
            column(ItemRegFilter; ItemRegFilter)
            {
            }
            column(No_ItemRegister; "No.")
            {
            }
            column(ItemRegQtyCaption; AreenStockAdjCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(ItemDescriptionCaption; ItemDescriptionCaptionLbl)
            {
            }
            column(No_ItemRegisterCaption; No_ItemRegisterCaptionLbl)
            {
            }
            column(CompanyPicture; CompInfo.Picture) { }
            column(Source_Code; "Source Code") { }
            column(ChargedAcc; ChargedAcc) { }
            column(FromDate; FromDate) { }
            column(ToDate; ToDate) { }
            column(ReportDate; workdate()) { }

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemTableView = sorting("Entry Type", "Item No.");

                column(PostingDate_ItemLedgEntry; "Posting Date")
                {
                }
                column(EntryType_ItemLedgEntry; "Entry Type")
                {
                    IncludeCaption = true;
                }
                column(ItemNo_ItemLedgEntry; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(ItemDescription; ItemDescription)
                {
                }
                column(Quantity_ItemLedgEntry; "Item Ledger Entry".Quantity)
                {
                }
                column(EntryNo_ItemLedgEntry; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(DocNo_ItemLedgEntry; "Document No.")
                {
                    IncludeCaption = true;
                }

                column(Transaction_Type; "Entry Type") { }
                column(Batch; lotNo) { }
                column(MainAccount; "Global Dimension 1 Code") { }
                column(Rate; UnitCost) { }
                column(Value; "Item Ledger Entry"."Cost Amount (Actual)") { }
                column(SrNo; SrNo) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                trigger OnAfterGetRecord()
                var
                    TransacType: Record "Transaction Type";
                    LotInF: Record "Lot No. Information";
                    GLSetup: Record "General Ledger Setup";
                begin
                    SrNo += 1;
                    ClearVar();
                    //GetQty_CostAndAmt();
                    LotInF.Reset();
                    LotInF.SetRange("Item No.", "Item No.");
                    LotInF.SetRange("Lot No.", "Lot No.");
                    LotInF.SetRange("Variant Code", "Variant Code");
                    if LotInF.FindFirst() then begin
                        LotNo := LotInF.GetLotNoForPrint();
                    end;

                    ItemDescription := Description;
                    if ItemDescription = '' then begin
                        if Item.Get("Item No.") then
                            ItemDescription := Item.Description;
                    end;
                    if GLSetup.Get() then
                        UnitCost := Round("Cost Amount (Actual)" / "Quantity", GLSetup."Unit-Amount Rounding Precision")
                    else
                        UnitCost := Round("Cost Amount (Actual)" / "Quantity", 0.01);
                    //TODO: Round as per GL setup
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Entry No.", "Item Register"."From Entry No.", "Item Register"."To Entry No.");
                    if (FromDate <> 0D) and (ToDate <> 0D) then begin
                        SetRange("Posting Date", FromDate, ToDate);
                    end;
                    SrNo := 0;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(FromDate; fromDate)
                {
                    ApplicationArea = Basic, Suite;
                    caption = 'From Date';
                }
                field(ToDate; Todate)
                {
                    ApplicationArea = Basic, Suite;
                    caption = 'To Date';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemRegFilter := "Item Register".GetFilters();
    end;

    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    local procedure ClearVar()
    begin
        UnitCost := 0;
        Qty := 0;
        TransDescription := '';
        LotNo := '';
        Cost_Amount_Actual := 0;
    end;

    // local procedure GetQty_CostAndAmt()
    // begin
    //     if "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Positive Adjmt." then begin
    //         Qty := Abs("Item Ledger Entry".Quantity);
    //         Cost_Amount_Actual := Abs("Item Ledger Entry"."Cost Amount (Actual)");
    //         if Qty <> 0 then
    //             UnitCost := Abs(("Item Ledger Entry"."Cost Amount (Actual)" / "Item Ledger Entry".Quantity));
    //     end else
    //         if "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Negative Adjmt." then begin
    //             Qty := "Item Ledger Entry".Quantity * -1;
    //             Cost_Amount_Actual := "Item Ledger Entry"."Cost Amount (Actual)" * -1;
    //             if Qty <> 0 then
    //                 UnitCost := ("Item Ledger Entry"."Cost Amount (Actual)" / "Item Ledger Entry".Quantity) * -1;
    //         end else begin
    //             Qty := "Item Ledger Entry".Quantity;
    //             Cost_Amount_Actual := "Item Ledger Entry"."Cost Amount (Actual)";
    //             if Qty <> 0 then
    //                 UnitCost := ("Item Ledger Entry"."Cost Amount (Actual)" / "Item Ledger Entry".Quantity);
    //         end;
    // end;

    var

        Item: Record Item;
        ItemRegFilter: Text;
        ItemDescription: Text[100];
        AreenStockAdjCaptionLbl: Label 'Stock Adjustment';
        CurrReportPageNoCaptionLbl: Label 'Page';
        PostingDateCaptionLbl: Label 'Posting Date';
        ItemDescriptionCaptionLbl: Label 'Description';
        No_ItemRegisterCaptionLbl: Label 'Register No.';

        TransDescription: Text[100];
        CompInfo: Record "Company Information";
        ChargedAcc: Code[20];
        FromDate: Date;
        ToDate: date;
        UnitCost: Decimal;
        SrNo: Integer;
        LotNo: Code[20];
        Qty: Decimal;
        Cost_Amount_Actual: Decimal;
}

