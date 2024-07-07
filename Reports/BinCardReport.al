report 52116 "AME Bin Card Report"
{
    ApplicationArea = All;
    Caption = 'Bin Card Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Bin Card Report.rdl';
    dataset
    {
        dataitem("Bin Content"; "Bin Content")
        {
            RequestFilterFields = "Location Code", "Zone Code", "Bin Code", "Item No.";
            column(Location_Code; "Location Code")
            {
            }
            column(BinCode_BinContent; "Bin Code")
            {
            }
            column(ItemNo_BinContent; "Item No.")
            {
            }
            column(UnitofMeasureCode_BinContent; "Unit of Measure Code")
            {
            }
            column(ZoneCode_BinContent; "Zone Code")
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(CompanyPicture; CompInfo.Picture) { }
            column(ReportDate; today()) { }
            dataitem("Warehouse Entry"; "Warehouse Entry")
            {
                DataItemLink = "Location Code" = field("Location Code"), "Bin Code" = field("Bin Code"), "Item No." = field("Item No."), "Variant Code" = field("Variant Code");
                DataItemTableView = sorting("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Entry Type", "Lot No.", "Serial No.");
                column(EntryType_WarehouseEntry; "Entry Type")
                {
                }
                column(LotNo_WarehouseEntry; "Lot No.")
                {
                }
                column(VarLotNo; VarLotNo) { }
                column(Qty___Base_; "Qty. (Base)")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(BENo; BENo)
                { }
                column(Description_WarehouseEntry; ItemDesc)
                {
                }

                column(BOEDate; BOEDate) { }
                column(ExpiryDate; ExpiryDate) { }
                trigger OnAfterGetRecord()
                var
                    LotInf: Record "Lot No. Information";
                    Item: Record Item;
                begin
                    Clear(BOEDate);
                    Clear(BENo);
                    Clear(VarLotNo);
                    Clear(ExpiryDate);
                    ItemDesc := Description;
                    IF ItemDesc = '' then BEGIN
                        if Item.Get("Warehouse Entry"."Item No.") then
                            ItemDesc := Item.Description;
                    END;
                    LotInF.Reset();
                    LotInF.SetRange("Item No.", "Warehouse Entry"."Item No.");
                    LotInF.SetRange("Lot No.", "Warehouse Entry"."Lot No.");
                    LotInF.SetRange("Variant Code", "Warehouse Entry"."Variant Code");
                    if LotInF.FindFirst() then begin
                        BENo := LotInf."BE No.";
                        BOEDate := LotInf."BOE Date";
                        VarLotNo := LotInf.GetLotNoForPrint();
                        ExpiryDate := LotInf."Expiry Date";
                    end else begin
                        VarLotNo := "Warehouse Entry"."Lot No.";
                    end;
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
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;
    end;

    var
        BENo: Text[50];
        BOEDate: Date;
        VarLotNo: Code[20];
        CompInfo: Record "Company Information";
        ExpiryDate: Date;
        ItemDesc: Text[100];

}
