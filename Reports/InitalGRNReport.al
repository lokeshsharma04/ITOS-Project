report 52100 "Inital GRN Report"
{
    ApplicationArea = All;
    Caption = 'Inital GIT';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Inital GRN Report.RDL';

    dataset
    {
        dataitem("Whse_Receipt_Header"; "Warehouse Receipt Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date") { }
            column(Whse__Receipt_No_; "No.") { }
            column(Assignment_Date; "Assignment Date") { }

            column(ComInfPic; ComInf.Picture)
            {

            }
            column(ComInfName; ComInf.Name)
            {

            }
            column(ComInfAdd; ComInf.Address) { }
            column(ComInfFaxNo; ComInf."Fax No.") { }
            column(ComInfPhone; ComInf."Phone No.") { }
            column(ComInfCity; ComInf.City) { }
            column(ComInfCounty; ComInf.County) { }


            column(vendorName; vedorName)
            { }
            // column(vedorName;vedorName)
            column(CtnQTY; CtnQTYCaption)
            {

            }
            column(TotalCtns; TotalCtns)
            {

            }
            column(Short; Short)
            {

            }
            column(Excs; Excs)
            {

            }
            column(Dmg; Dmg)
            { }
            column(ActRcpt; ActRcpt)
            {

            }
            column(BatchNo; BatchNo)
            {

            }
            column(CO; CO)
            {

            }
            column(LOCATOR; LOCATOR)
            {

            }
            column(Remarks; Remarks)
            {

            }


            dataitem("Warehouse Receipt Line"; "Warehouse Receipt Line")
            {

                DataItemLink = "No." = FIELD("No.");
                column(Item_No_; "Item No.")
                { }
                column(SrNo; SrNo)
                {

                }
                column(Short_Qty; "Short Qty") { }
                column(Excess_Qty; "Excess Qty") { }
                column(Damaged_Qty; "Damaged Qty") { }
                column(Actual_Qty; "Actual Qty") { }
                column(Description; Description) { }

                column(Location_Code; "Location Code") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }

                column(Expiration_Date; ExpiryDate) { }

                column(BatchName; BatchName) { }
                column(Quantity; Quantity) { }
                column(Coname; Coname) { }
                column(RemarkData; RemarkData) { }
                column(CartonQuantity; CartonQuantity) { }
                column(TotalCtonQty; TotalCtonQty) { }
                trigger OnAfterGetRecord()
                var
                    LotInF: Record "Lot No. Information";
                    Recitem: Record Item;
                    PurchaseHeader: Record "Purchase Header";
                    ItemUOM: Record "Item Unit of Measure";
                begin
                    if PurchaseHeader.Get("Warehouse Receipt Line"."Source Subtype", "Warehouse Receipt Line"."Source No.") then
                        vedorName := PurchaseHeader."Buy-from Vendor Name";
                    SrNo := SrNo + 1;
                    CartonQuantity := 0;
                    TotalCtonQty := 0;
                    if RecItem.Get("Item No.") then;
                    IF ItemUOM.Get(RecItem."No.", RecItem."AME Carton UOM") then begin
                        CartonQuantity := ItemUOM."Qty. per Unit of Measure";
                    end;
                    if CartonQuantity <> 0 then
                        TotalCtonQty := Round("Qty. (Base)" / CartonQuantity, 0.01);
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
    begin
        cominf.get();
        cominf.CalcFields(Picture);


    end;

    var
        vedorName: Text;
        VendorNo: Code[20];
        CtnQTYCaption: Label 'Ctn Qty';
        TotalCtns: Label 'Total Ctns';
        Short: Label 'Short';
        Excs: Label 'Eces';
        Dmg: Label 'Dmg';
        ActRcpt: Label 'Act Rcpt';
        BatchNo: Label 'Batch No.';
        CO: Label 'CO';
        LOCATOR: Label 'Locator';
        Remarks: Label 'Remarks';
        BatchName: Text[50];
        Coname: Text[50];
        vendor: Record Vendor;
        ComInf: Record "Company Information";
        SrNo: Integer;
        ExpiryDate: Date;
        RemarkData: Text[30];
        CartonQuantity: Decimal;
        TotalCtonQty: Decimal;
}
