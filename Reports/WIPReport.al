report 52102 "AME WIP Shortage Report"
{
    ApplicationArea = All;
    Caption = 'WIP Shortage Report';
    UsageCategory = ReportsAndAnalysis;
    //DefaultLayout = RDLC;
    //RDLCLayout = 'src/Reports/Layout/WIP Report copy.RDL';
    DefaultRenderingLayout = ItemWiseShortage;

    dataset
    {
        dataitem("Assembly Header"; "Assembly Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(Posting_Date; "Posting Date") { }
            column(OrderNo_; "No.") { }
            column(ReportNameLbl; ReportNameLbl) { }
            column(workdate; workdate) { }
            column(CominfName; Cominf.Name) { }
            column(CominfPic; Cominf.Picture) { }
            column(CominfAdd; Cominf.Address) { }
            column(CominfPhone; Cominf."Phone No.") { }
            column(CominfFaxNo; Cominf."Fax No.") { }
            column(PrintDate; PrintDate) { }
            column(FilterText; FilterText) { }

            dataitem("Assembly Line"; "Assembly Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = const(Item));
                column(ItemNo_; "No.") { }
                column(Description; Description) { }
                column(Quantity; AvaiInv) { }
                column(ShortQTY; ShortQTY) { }
                column(OpenQty; "Quantity to Consume") { }
                column(QtyinGreyArea; QtyinGreyArea) { }
                trigger OnAfterGetRecord()
                var
                    Item2: record Item;
                    LocRec: record Location;
                BEGIN
                    Clear(AvaiInv);
                    Clear(QtyinGreyArea);
                    Clear(ShortQTY);

                    if "Assembly Line".Type <> "Assembly Line".Type::Item then
                        CurrReport.Skip();


                    if itemRec.Get("Assembly Line"."No.") then begin
                        AvaiInv := itemRec.GetAvailableInv();

                        Clear(Item2);
                        Item2.SetCurrentKey("No.");
                        Item2.SetRange("No.", itemRec."No.");
                        if ("Location Code" <> '') AND LocRec.Get("Location Code") then begin
                            Item2.SetFilter("Location Filter", "Location Code");
                            if LocRec."To-Assembly Bin Code" <> '' then
                                Item2.SetFilter("Bin Filter", LocRec."To-Assembly Bin Code");
                        end;
                        if Item2.FindFirst() then
                            QtyinGreyArea := itemRec.GetAvailableInv(itemRec);


                        ShortQTY := (AvaiInv - ("Assembly Line"."Quantity to Consume" - QtyinGreyArea));

                    end;

                END;



            }
            trigger OnAfterGetRecord()
            var
            begin
                PrintDate := Today;

            end;

        }




    }

    rendering
    {
        layout(ItemWiseShortage)
        {
            Caption = 'Item-wise Shortage';
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/WIPShortageItemWise.RDL';
        }
        layout(OrderItemWiseShortage)
        {
            Caption = 'Order-wise Item Shortage';
            Type = RDLC;
            LayoutFile = 'src/Reports/Layout/WIP Report.RDL';
        }
    }


    trigger OnInitReport()
    var
    BEGIN
        if Cominf.get() then;
        Cominf.CalcFields(Picture);
    END;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        FilterText := "Assembly Header".GetFilter("No.");
        if FilterText <> '' then
            FilterText += '';

    end;

    var
        AvaiInv: Decimal;
        itemRec: Record Item;
        FilterText: Text;
        Cominf: Record "Company Information";
        ShortQTY: Decimal;
        OpenQty: Decimal;
        QtyinGreyArea: Decimal;
        ReportNameLbl: Label 'WIP Shortage Report';
        workdate: Date;
        SRnO: Integer;
        PrintDate: Date;
}
