report 52103 "AME FG Stock Report"
{
    ApplicationArea = All;
    Caption = 'FG Stock Report';
    UsageCategory = ReportsAndAnalysis;

    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/FG Stock Report.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            DataItemTableView = where("Assembly BOM" = const(true));
            column(No_; "No.")
            {

            }
            column(PrintDate; PrintDate) { }
            column(cominfName; cominf.Name) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(cominfPic; cominf.Picture) { }
            column(workdate; workdate) { }
            column(comqtyLbl; comqtyLbl) { }
            column(Labl1; Labl1) { }
            column(ArrayQuantity1; InvQuantity[1])
            {

            }
            column(ArrayQuantity2; InvQuantity[2])
            {

            }
            column(ArrayQuantity3; InvQuantity[3])
            {

            }
            column(ArrayQuantity4; InvQuantity[4])
            {

            }
            column(ArrayQuantity5; InvQuantity[5])
            {

            }
            column(ArrayQuantity6; InvQuantity[6])
            {

            }
            column(ArrayQuantity7; InvQuantity[7])
            {

            }
            column(ArrayQuantity8; InvQuantity[8])
            {

            }
            column(ArrayQuantity9; InvQuantity[9])
            {

            }
            column(ArrayQuantity10; InvQuantity[10])
            {

            }
            column(ArrayQuantity11; InvQuantity[11])
            {

            }
            column(ArrayQuantity12; InvQuantity[12])
            {

            }

            column(MonthLbl_1; MonthLbl[1]) { }
            column(MonthLbl_2; MonthLbl[2]) { }
            column(MonthLbl_3; MonthLbl[3]) { }
            column(MonthLbl_4; MonthLbl[4]) { }
            column(MonthLbl_5; MonthLbl[5]) { }
            column(MonthLbl_6; MonthLbl[6]) { }
            column(MonthLbl_7; MonthLbl[7]) { }
            column(MonthLbl_8; MonthLbl[8]) { }
            column(MonthLbl_9; MonthLbl[9]) { }
            column(MonthLbl_10; MonthLbl[10]) { }
            column(MonthLbl_11; MonthLbl[11]) { }
            column(MonthLbl_12; MonthLbl[12]) { }
            column(TotalQTY; TotalQTY) { }



            trigger OnAfterGetRecord()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
                I: Integer;
            begin
                PrintDate := Today;
                workdate := today;
                FOR i := 1 TO 12 DO begin
                    InvQuantity[i] := 0;
                    TotalQTY := 0;
                end;

                for i := 1 to 12 do begin
                    ItemLedgerEntry.Reset();
                    ItemLedgerEntry.SetRange("Item No.", Item."No.");
                    ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::"Assembly Output");
                    ItemLedgerEntry.SetRange("Posting Date", DateArray[i], CalcDate('CM', DateArray[i]));
                    if ItemLedgerEntry.FindSet() then begin
                        ItemLedgerEntry.CalcSums(Quantity);
                        InvQuantity[i] += ItemLedgerEntry.Quantity;
                        TotalQTY := TotalQTY + InvQuantity[i];
                    end;
                end;
            end;

        }
    }

    requestpage
    {

        SaveValues = true;
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(AsOfDate; AsOfDate)
                    {
                        Caption = 'As Of Date';
                        ApplicationArea = All;

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
        trigger OnInit()
        begin
            AsOfDate := Today;

        end;

    }
    trigger OnPreReport()
    var
        i: Integer;
    begin
        //get the year  from the date
        Year := DATE2DMY(AsOfDate, 3);

        for i := 1 to 12 do begin
            DateArray[i] := DMY2Date(1, I, Year);
            MonthLbl[i] := FORMAT(DateArray[i], 0, '<Month Text,3> <Year4>')
        end;


    end;

    trigger OnInitReport()
    begin
        cominf.get();
        cominf.CalcFields(Picture);
    end;

    var
        cominf: Record "Company Information";
        AsOfDate: Date;
        DateArray: array[12] of date;
        // PeriodDate: DateFormula;
        InvQuantity: array[12] of Decimal;
        MonthLbl: array[12] of Text[10];
        Labl1: Label 'Inventory Date: Month(Mon-YYYY)';
        comqtyLbl: Label 'Completed Qty';
        TotalQTY: Decimal;
        Year: Integer;
        workdate: Date;
        PrintDate: Date;

}
