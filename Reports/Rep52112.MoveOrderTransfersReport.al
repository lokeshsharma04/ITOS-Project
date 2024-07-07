report 52112 "AME Move Order Transfers Rep"
{
    ApplicationArea = All;
    Caption = 'Move Order Transfers Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Move Order Transfers Report.RDL';
    dataset
    {
        dataitem("Warehouse Activity Header"; "Registered Whse. Activity Hdr.")
        {
            RequestFilterFields = "No.";
            column(No_; "No.") { }
            column(Assignment_Date; "Registering Date") { }
            column(ReMARKLbl; ReMARKLbl) { }
            column(BatchLbl; BatchLbl) { }
            column(LocatorLbl; LocatorLbl) { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(ReportNameLbl; ReportNameLbl) { }
            column(PrintDate; PrintDate) { }
            column(RemarksData; RemarksData) { }
            column(SRnO; SRnO) { }

            dataitem("Warehouse Activity Line"; "Registered Whse. Activity Line")
            {
                DataItemLink = "No." = field("No."), "Activity Type" = field(Type);
                DataItemTableView = sorting("Activity Type", "No.", "Line No.");
                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Action_Type; "Action Type") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity; LineQty) { }
                column(SunInv; "Zone Code") { }
                column(Bin_Code; "Bin Code") { }
                column(BatchData; BatchData) { }
                column(ReasonCode; ReasonCode)
                {

                }
                trigger OnAfterGetRecord()
                var
                BEGIN
                    LineQty := 0;
                    SRnO := SRnO + 1;
                    PrintDate := Today;
                    // BatchData := '';
                    // ReasonCode := '';
                    if "Warehouse Activity Line"."Action Type" = "Warehouse Activity Line"."Action Type"::Take then
                        LineQty := -Quantity
                    else
                        if "Warehouse Activity Line"."Action Type" = "Warehouse Activity Line"."Action Type"::Place then
                            LineQty := Abs(Quantity);

                END;
            }
            trigger OnAfterGetRecord()
            var
            begin
                // RemarksData := '';
            end;



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
        trigger OnInit()
        var
        begin
            if Cominf.get() then;
            Cominf.CalcFields(Picture);
        end;
    }
    var
        BatchLbl: Label 'Batch';
        LocatorLbl: Label 'Locator';
        ReMARKLbl: Label 'Remarks';
        Cominf: Record "Company Information";
        SRnO: Integer;
        ReportNameLbl: Label 'Move Order Transfers Report';
        PrintDate: Date;
        ReasonCode: Code[100];
        BatchData: Text;
        LineQty: Decimal;
        RemarksData: Text;

}
