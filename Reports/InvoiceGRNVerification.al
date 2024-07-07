report 52105 "AME Invoice/GRN Verification"
{
    ApplicationArea = All;
    Caption = 'Invoice/GRN Verification Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Invoice-GRN Verification.RDL';
    dataset
    {
        dataitem("Warehouse Receipt Header"; "Warehouse Receipt Header")
        {
            RequestFilterFields = "No.";
            column(ReceiptNo_; "No.") { }
            column(BL_No; BL_No) { }
            column(Supp_Invoice_Date; Supp_Invoice_Date) { }
            column(Supp_Invoice_No; Supp_Invoice_No) { }
            column(ReportnameLbl; ReportnameLbl) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfName; Cominf.Name) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            dataitem("Warehouse Receipt Line"; "Warehouse Receipt Line")
            {
                DataItemLink = "No." = FIELD("No.");
                column(Source_No_; "Source No.") { }
                column(Item_No_; "Item No.") { }
                column(Qty__to_Receive; "Qty. to Receive") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(No_; "No.") { }

                column(Description; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            }

        }

    }
    trigger OnInitReport()
    var
    BEGIN
        Cominf.get();
        Cominf.CalcFields(Picture);
    END;

    var
        ReportnameLbl: Label 'Invoice/GRN Verification';
        Cominf: Record "Company Information";
}
