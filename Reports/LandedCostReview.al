report 52106 "AME Landed Cost Review"
{
    ApplicationArea = All;
    Caption = 'Landed Cost Review Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Landed-CostReview Report.RDL';
    dataset
    {
        dataitem("Warehouse Receipt Header"; "Warehouse Receipt Header")
        {
            RequestFilterFields = "No.";
            column(CostFactor; CostFactor)
            {
                DecimalPlaces = 2 : 2;
            }
            column(ReceiptNo_; "No.") { }

            column(CominfPic; Cominf.Picture) { }
            column(ReportnameLbl; ReportnameLbl) { }
            column(CominfName; Cominf.Name) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(CominfCountry; Cominf."Country/Region Code") { }
            dataitem("Warehouse Receipt Line"; "Warehouse Receipt Line")
            {
                DataItemLink = "No." = FIELD("No.");
                column(Source_No_; "Source No.") { }
                column(Item_No_; "Item No.") { }
                column(Qty__to_Receive; "Qty. to Receive") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(No_; "No.") { }
                column(Line_No_; "Line No.") { }
                column(Landed_Cost_Amt_; "Landed Cost Amt.") { }

                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(TotalINv; TotalINv) { }
                column(tOTALcOSTAmt; tOTALcOSTAmt) { }
                column(CostAmount; CostAmount) { }
                column(CostFactor1; CostFactor1) { }
                trigger OnPreDataItem()
                var
                begin

                end;

                trigger OnAfterGetRecord()
                var
                begin

                    CostAmount += "Warehouse Receipt Line"."Landed Cost Amt.";
                    TotalINv += "Warehouse Receipt Line"."Line Amount";
                    if TotalINv <> 0 then
                        CostFactor := Round((CostAmount / TotalINv) * 100, 2);
                end;
            }
            trigger OnAfterGetRecord()
            var
            begin

            end;

        }

    }
    trigger OnInitReport()
    var
    BEGIN
        Cominf.get();
        Cominf.CalcFields(Picture);
    END;

    var
        ReportnameLbl: Label 'Landed Cost Review Report';
        Cominf: Record "Company Information";
        CostFactor: Decimal;
        TotalINv: Decimal;
        CostAmount: Decimal;
        tOTALcOSTAmt: Decimal;
        CostFactor1: Decimal;

}
