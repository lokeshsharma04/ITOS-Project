report 52114 "AME Warehouse Put-Away"
{
    ApplicationArea = All;
    Caption = 'AME Warehouse Put-Away';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Warehouse Put Away.RDL';
    dataset
    {
        dataitem("Warehouse Activity Header"; "Warehouse Activity Header")
        {
            RequestFilterFields = "No.";
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(VendorName; VendorName) { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(No_; "No.") { }
            column(Posting_Date; PostingDate) { }
            column(CtnQTYCaption; CtnQTYCaption) { }
            column(TotalCtnsCaption; TotalCtnsCaption) { }
            column(ShortCaption; ShortCaption) { }
            column(ExcsCaption; ExcsCaption) { }
            column(DmgCaption; DmgCaption) { }
            column(ActRcptCaption; ActRcptCaption) { }
            column(BatchNo; BatchNoCaption) { }
            column(COCaption; COCaption) { }
            column(LOCATORCaption; LOCATORCaption) { }
            column(RemarksCaption; RemarksCaption) { }
            column(ReceiptNo; ReceiptNo) { }
            dataitem("Warehouse Activity Line"; "Warehouse Activity Line")
            {
                DataItemLink = "Activity Type" = field(Type), "No." = field("No.");
                DataItemTableView = where("Activity Type" = filter(1));
                column(Action_Type; "Action Type") { }
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity; Quantity) { }
                column(BatchCode; LotNO) { }
                column(SubInventory; "Zone Code") { }
                column(Loc; "Bin Code") { }
                column(SalesOrder; "Source No.") { }
                column(Expiration_Date; "Expiration Date") { }
                column(MfgDate; MfgDate) { }
                column(BENo; BENo) { }
                column(CountryOrigin; CountryOrigin) { }
                column(CartonQuantity; CtnQty) { }
                column(Totalqty; Totalctn) { }
                column(SrNo; SrNo)
                { }
                column(BeDate; BeDate) { }
                trigger OnPreDataItem()
                begin
                    if Not ShowTakeLines then
                        "Warehouse Activity Line".SetFilter("Action Type", '=%1', "Warehouse Activity Line"."Action Type"::Place);
                end;

                trigger OnAfterGetRecord()
                var
                begin

                    SRnO += 1;
                    BENo := '';
                    LotNO := '';
                    CountryOrigin := '';
                    Totalctn := 0;
                    CtnQty := 0;
                    BeDate := 0D;
                    LotInF.Reset();
                    LotInF.SetRange("Item No.", "Warehouse Activity Line"."Item No.");
                    LotInF.SetRange("Lot No.", "Warehouse Activity Line"."Lot No.");
                    LotInF.SetRange("Variant Code", "Warehouse Activity Line"."Variant Code");
                    if LotInF.FindFirst() then begin
                        BENo := LotInF."BE No.";
                        MfgDate := LotInF."Mfg. Date";
                        CountryOrigin := LotInF."Country of Origin";
                        LotNO := LotInF.GetLotNoForPrint();
                        BeDate := LotInF."BOE Date";
                    end else
                        LotNO := "Warehouse Activity Line"."Lot No.";
                    if RecItem.Get("Item No.") then;
                    IF ItemUOM.Get(RecItem."No.", RecItem."AME Carton UOM") then begin
                        CtnQty := ItemUOM."Qty. per Unit of Measure";
                    end;
                    if CtnQty <> 0 then
                        Totalctn := Round("Qty. (Base)" / CtnQty, 0.01);
                end;
            }
            trigger OnAfterGetRecord()
            var
                WarehouseActLine: Record "Warehouse Activity Line";
                PostedWhseRcptHdr: Record "Posted Whse. Receipt Header";
            begin
                ReceiptNo := '';
                PostingDate := 0D;
                VendorName := '';
                WarehouseActLine.Reset();
                WarehouseActLine.SetRange("Activity Type", "Warehouse Activity Header".Type);
                WarehouseActLine.SetRange("No.", "Warehouse Activity Header"."No.");
                WarehouseActLine.SetFilter("Whse. Document No.", '<>%1', '');
                if WarehouseActLine.FindFirst() then begin
                    PostedWhseRcptHdr.Get(WarehouseActLine."Whse. Document No.");
                    ReceiptNo := PostedWhseRcptHdr."Whse. Receipt No.";
                    PostingDate := PostedWhseRcptHdr."Posting Date";
                    if Purchasehdr2.GEt(Purchasehdr2."Document Type"::Order, WarehouseActLine."Source No.") then begin
                        VendorName := Purchasehdr2."Buy-from Vendor Name";
                    end;
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
                group("Line Filter")
                {
                    field(ShowTakeLines; ShowTakeLines)
                    {
                        ApplicationArea = all;
                        Caption = 'Show Take Lines';
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
    trigger OnInitReport()
    var
    BEGIN
        if Cominf.get() then;
        Cominf.CalcFields(Picture);
    END;

    var
        VendorName: Text[100];

        Purchasehdr2: Record "Purchase Header";
        Cominf: Record "Company Information";
        LotInF: Record "Lot No. Information";
        MfgDate: Date;
        CountryOrigin: Code[50];
        BENo: Text[50];
        LotNO: Text;
        RecItem: Record Item;
        CtnQty: Decimal;
        Totalctn: Decimal;
        SRnO: Integer;
        ItemUOM: Record "Item Unit of Measure";
        CtnQTYCaption: Label 'Ctn Qty';
        TotalCtnsCaption: Label 'Total Ctns';
        ShortCaption: Label 'Short';
        ExcsCaption: Label 'Eces';
        DmgCaption: Label 'Dmg';
        ActRcptCaption: Label 'Act Rcpt';
        BatchNoCaption: Label 'Batch No.';
        COCaption: Label 'CO';
        LOCATORCaption: Label 'Locator';
        RemarksCaption: Label 'Remarks';
        ShowTakeLines: Boolean;
        ReceiptNo: Code[20];
        PostingDate: date;
        BeDate: Date;
}
