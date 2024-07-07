report 52121 "AME Price List Report"
{
    ApplicationArea = All;
    Caption = 'Price List Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Price List Report.RDL';
    dataset
    {
        dataitem("Price List Header"; "Price List Header")
        {
            RequestFilterFields = Code, "Starting Date", "Ending Date", "Assign-to No.", "Currency Code", "Source Type";
            column(Code; Code) { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }

            column(Description; Description) { }
            column(Assign_to_No_; "Assign-to No.") { }
            column(Source_Type; "Source Type") { }
            column(Starting_Date; "Starting Date")
            {

            }
            column(Ending_Date; "Ending Date") { }
            column(Currency_Code; "Currency Code") { }
            column(Status; Status) { }

            dataitem("Price List Line"; "Price List Line")
            {
                DataItemLink = "Price List Code" = field(Code);
                column(Starting_Date_Line; "Starting Date") { }
                column(Ending_Date_Line; "Ending Date") { }
                column(lineSource_Type; "Source Type") { }
                column(LineAssign_to_No_; "Assign-to No.") { }
                column(Product_No_; "Product No.") { }
                column(LineDescription; Description) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Minimum_Quantity; "Minimum Quantity")
                {

                }
                column(lineCurrency_Code; "Currency Code")
                {

                }
                column(Unit_Price; Price) { }



                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if "Price List Line"."Price Type" = "Price List Line"."Price Type"::Purchase then begin
                        Price := "Price List Line"."Direct Unit Cost";
                    end else
                        if "Price List Line"."Price Type" = "Price List Line"."Price Type"::Sale then begin
                            Price := "Price List Line"."Unit Price";
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
        trigger OnInit()
        var
        begin
            if Cominf.get() then;
            Cominf.CalcFields(Picture);
        end;
    }
    var
        Cominf: Record "Company Information";
        Price: Decimal;

}
