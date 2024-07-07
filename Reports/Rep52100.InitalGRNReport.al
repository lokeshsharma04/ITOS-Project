report 52109 "Inital GRN Report1"
{
    ApplicationArea = All;
    Caption = 'Inital GRN Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/Inital GRN Report.RDL';

    dataset
    {
        dataitem("Posted Whse. Receipt Header"; "Posted Whse. Receipt Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date") { }
            column(Whse__Receipt_No_; "Whse. Receipt No.") { }
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
            column(CtnQTY; CtnQTY)
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


            dataitem("Posted Whse. Receipt Line"; "Posted Whse. Receipt Line")
            {

                DataItemLink = "No." = FIELD("No.");
                column(Item_No_; "Item No.")
                { }
                column(SrNo; SrNo)
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Expiration_Date; "Expiration Date")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Short_Qty; "Short Qty") { }
                column(Excess_Qty; "Excess Qty") { }
                column(Damaged_Qty; "Damaged Qty") { }
                column(Actual_Qty; "Actual Qty") { }
                column(CartonQuantity; CartonQuantity) { }
                column(TotalCtonQty; TotalCtonQty) { }
                trigger OnAfterGetRecord()
                var
                    LotInF: Record "Lot No. Information";
                    Recitem: Record Item;
                    PurchaseOrder: Record "Purchase Header";
                    ItemUOM: Record "Item Unit of Measure";
                begin
                    SrNo := SrNo + 1;
                    CartonQuantity := 0;
                    TotalCtonQty := 0;
                    if PurchaseOrder.Get("Posted Whse. Receipt Line"."Source Subtype", "Posted Whse. Receipt Line"."Source No.") then
                        vedorName := PurchaseOrder."Buy-from Vendor Name";
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
                SrNo := SrNo + 1;
                //if vendor.Get("Posted Whse. Receipt Line"."Source No.") then;
                // vedorName := vendor.Name;
                // vedorName := 'abc';

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
        CtnQTY: Label 'Ctn Qty';
        TotalCtns: Label 'Total Ctns';
        Short: Label 'Short';
        Excs: Label 'Eces';
        Dmg: Label 'Dmg';
        ActRcpt: Label 'Act Rcpt';
        BatchNo: Label 'Batch No.';
        CO: Label 'CO';
        LOCATOR: Label 'Locator';
        Remarks: Label 'Remarks';

        vendor: Record Vendor;
        ComInf: Record "Company Information";
        SrNo: Integer;
        CartonQuantity: Decimal;
        TotalCtonQty: Decimal;
}
