report 52101 "AME Finished Goods-Report"
{
    ApplicationArea = All;
    Caption = 'Finished Goods-Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Finished Goods  Report.RDL';
    dataset
    {
        dataitem("Posted Assembly Header"; "Posted Assembly Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(No_PostedAssemblyHeader; "No.")
            {
                IncludeCaption = true;
            }
            column(PrintDate; PrintDate) { }

            column(OrderNo_PostedAssemblyHeader; "Order No.")
            {
                IncludeCaption = true;
            }
            column(Posting_Date; "Posting Date") { }

            column(ItemNo_PostedAssemblyHeader; "Item No.") { }

            column(Description; Description) { }
            column(Quantity; Quantity) { }
            column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            column(Location_Code; "Location Code") { }
            column(cominfName; cominf.Name) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(cominfPic; cominf.Picture) { }
            column(IssuebyLbl; IssuebyLbl) { }
            column(ReceLbl; ReceLbl) { }
            column(ReportLbl; ReportLbl) { }
            column(Subcatlbl; Subcatlbl) { }
            column(NoofCarton; NoofCarton) { }
            column(FilterText; FilterText) { }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Entry Type" = filter("Assembly Output"));
                column(SrNo; SrNo) { }
                column(BtachNO; LotNO) { }
                column(ExpiryDate; "Expiration Date") { }
                column(BENo; BENo) { }
                trigger OnAfterGetRecord()
                var
                begin
                    SrNo := SrNo + 1;
                    NoofCarton := 0;
                    BENo := '';
                    LotNO := '';

                    LotInF.Reset();
                    LotInF.SetRange("Item No.", "Item Ledger Entry"."Item No.");
                    LotInF.SetRange("Lot No.", "Item Ledger Entry"."Lot No.");
                    if LotInF.FindFirst() then begin
                        BENo := LotInF."BE No.";
                        LotNO := LotInF.GetLotNoForPrint();
                    end;

                    IF ItemUOM.Get("Posted Assembly Header"."Item No.", "Posted Assembly Header"."Unit of Measure Code") then begin
                        CtnQty := ItemUOM."Qty. per Unit of Measure";
                    end;
                    if CtnQty <> 0 then
                        NoofCarton := "Posted Assembly Header"."Quantity (Base)" / CtnQty;
                end;


            }
            trigger OnAfterGetRecord()
            var
            begin
                PrintDate := Today;
            end;
        }
    }
    trigger OnInitReport()
    begin
        cominf.get();
        cominf.CalcFields(Picture);
    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        FilterText := "Posted Assembly Header".GetFilter("No.");
        if FilterText <> '' then
            FilterText += '';

    end;



    var
        FilterText: Text;
        LotInF: Record "Lot No. Information";
        CtnQty: Decimal;
        PrintDate: Date;
        NoofCarton: Integer;
        BtachNO: Integer;
        ExpiryDate: Date;
        RecItem: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        BENo: Text;
        LotNO: Text;
        cominf: Record "Company Information";
        SrNo: Integer;
        DateConstant: Text;
        PostingDateConstant: Text;
        ShowInternalInfo: Boolean;
        NoOfCopies: Integer;
        DimText: Text[120];
        DimText2: Text[120];
        DimLineNo: Integer;
        DimLineNo2: Integer;
        LastDimCode: Boolean;
        ReportLbl: Label 'Assembly Finished Goods Report';
        IssuebyLbl: Label 'Issued By';
        ReceLbl: Label 'Received By';
        Subcatlbl: Label 'Sub-Inventory:';
        workdate: Date;

}










