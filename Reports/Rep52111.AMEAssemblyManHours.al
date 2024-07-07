report 52111 "AME Assembly Man Hours"
{
    ApplicationArea = All;
    Caption = 'Assembly Man Hours';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'src/Reports/Layout/Assembly Man Hours.RDL';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Posted Assembly Header"; "Posted Assembly Header")
        {
            RequestFilterFields = "Item No.", "Posting Date", "Location Code";
            column(ItemNo_PostedAssemblyHeader; "Item No.") { }
            column(No_PostedAssemblyHeader; "No.") { }
            column(Quantity_PostedAssemblyQty; Quantity) { }
            column(Description_PostedAssemblyHeader; Description) { }
            column(ShowItemWTotal; ShowItemWTotal) { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(PrintDATE; PrintDATE) { }

            dataitem("Posted Assembly Line"; "Posted Assembly Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = const(Resource));
                column(Description_PostedAssemblyLine; Description) { }
                column(No_PostedAssemblyLine; "No.") { }
                column(Quantity_PostedAssemblyLine; Quantity) { }
            }
            trigger OnAfterGetRecord()
            var
            BEGIN
                PrintDATE := Today;
            END;
        }

    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group("Print Details")
                {
                    field(ShowItemWTotal; ShowItemWTotal)
                    {
                        Caption = 'Show Item Wise Hours';
                        ApplicationArea = all;
                    }
                    field(ShowResWiseTotal; ShowResWiseTotal)
                    {
                        Caption = 'Show Resource Wise Hours';
                        ApplicationArea = all;
                    }
                }
            }
        }
        trigger OnInit()
        var
        begin
            if Cominf.get() then;
            Cominf.CalcFields(Picture);
        end;
    }

    var
        Cominf: Record "Company Information";
        ShowItemWTotal: Boolean;
        ShowResWiseTotal: Boolean;
        ReportnameLbl: Label 'Assembly Man Hours Report';
        PrintDATE: Date;
}
