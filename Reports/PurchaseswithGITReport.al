report 52108 "AME Purchases with GIT Report"
{
    ApplicationArea = All;
    Caption = 'Purchases with GIT Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Purchases With GIT Report.RDL';
    dataset
    {
        dataitem("Warehouse Receipt Header"; "Warehouse Receipt Header")
        {
            RequestFilterFields = "No.", Expected_Receipt_Date, "Location Code";
            column(No_; "No.") { }
            column(Location_Code; "Location Code") { }
            column(DocumentNo; ShowDocumentWise) { }
            column(cominfpic; cominf.Picture) { }
            column(cominfName; cominf.Name) { }
            column(cominfAdd; cominf.Address) { }
            column(cominfPhone; cominf."Phone No.") { }
            column(cominfEmail; cominf."E-Mail") { }
            column(cominfFax; cominf."Fax No.") { }
            column(LocationFiter; LocationFiter)
            { }
            column(RpDate; RpDate)
            {

            }
            column(FilterText; FilterText) { }
            column(Expected_Receipt_Date; Expected_Receipt_Date) { }

            DataItem("Warehouse Receipt Line";
            "Warehouse Receipt Line")
            {
                DataItemLink = "No." = field("No.");

                column(Source_Document; "Source Document") { }
                column(Source_No_; "Source No.") { }
                column(Qty__to_Receive; "Qty. to Receive") { }
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(Starting_Date; "Starting Date") { }

            }
            trigger OnAfterGetRecord()
            var
            begin
                RpDate := Today;
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
                group(Options)
                {

                    field(ShowDocumentWise; ShowDocumentWise)
                    {
                        ApplicationArea = all;
                        Caption = 'Show Document Wise';
                    }


                }
            }
        }

    }
    trigger OnInitReport()
    var
    begin
        cominf.get();
        cominf.CalcFields(Picture);


    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        FilterText := "Warehouse Receipt Header".GetFilters();
        if FilterText <> '' then
            FilterText += ', ';

        FilterText += 'Show Document Wise :' + Format(ShowDocumentWise);
    end;

    var
        cominf: Record "Company Information";

        ShowDocumentWise: Boolean;
        LocationFiter: Code[20];
        DateFilter: Date;
        FilterText: Text;
        RpDate: Date;
}


