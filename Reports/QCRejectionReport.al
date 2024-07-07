report 52137 "AME QC Rejection Report"
{
    ApplicationArea = All;
    Caption = 'QC Rejection Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/Layout/QC Rejection.RDL';
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            column(compName; CompInfo.Name) { }
            column(compPicture; CompInfo.Picture) { }
            column(CompAdd; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(CompFax; CompInfo."Fax No.") { }
            column(CompCountry; CompInfo."Country/Region Code") { }
            dataitem("Warehouse Entry"; "Warehouse Entry")
            {
                RequestFilterFields = "AME Worksheet Batch Name", "AME Worksheet Template Name", "AME Assembly Order No.", "Reason Code";
                DataItemTableView = sorting("Entry No.") where(Quantity = filter(< 0));
                column(Entry_No_; "Entry No.") { }
                column(AME_Worksheet_Batch_Name; "AME Worksheet Batch Name") { }
                column(AME_Worksheet_Template_Name; "AME Worksheet Template Name") { }
                column(Whse__Document_No_; "Whse. Document No.") { }
                column(Whse__Document_Type; "Whse. Document Type") { }
                column(AME_Assembly_Order_No_; "AME Assembly Order No.") { }
                column(Item_No_; "Item No.") { }
                column(Lot_No_; "Lot No.") { }
                column(Expiration_Date; "Expiration Date") { }
                column(AME_BE_No_; "AME BE No.") { }
                column(AME_BOE_Date; "AME BOE Date") { }
                column(Zone_Code; "Zone Code") { }
                column(Bin_Code; "Bin Code") { }
                column(Reason_Code; "Reason Code") { }
                column(AME_Comments; "AME Comments") { }
                column(Description; Description) { }
                column(Quantity; Quantity * -1) { }
                column(SupplierName; SupplierName) { }
                column(ReasonCodeDescription; ReasonCodeDescription) { }

                trigger OnAfterGetRecord()
                var
                    LotInf: Record "Lot No. Information";
                    PurchaseHdr: Record "Purchase Header";
                    Vendor: Record Vendor;
                    ReasonCode: Record "Reason Code";
                    myInt: Integer;
                    ILE: Record "Item Ledger Entry";
                begin
                    SupplierName := '';
                    Clear(ILE);
                    Clear(Vendor);
                    ILE.Reset();
                    Vendor.Reset();

                    if ReasonCode.Get("Reason Code") then
                        ReasonCodeDescription := ReasonCode.Description;

                    ILE.SetCurrentKey("Entry Type", "Item No.", "Lot No.");
                    iLE.SetRange("Entry Type", ILE."Entry Type"::Purchase);
                    ILE.SetRange("Item No.", "Item No.");
                    ILE.SetRange("Lot No.", "Lot No.");
                    if ILE.FindFirst() then begin
                        if ILE."Source Type" = ile."Source Type"::Vendor then
                            if Vendor.Get(ILE."Source No.") then
                                SupplierName := Vendor.Name;
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
    }
    trigger OnInitReport()
    begin
        Clear(CompInfo);
        if CompInfo.get() then begin
            CompInfo.CalcFields(Picture);
        end;

    end;

    var
        CompInfo: Record "Company Information";
        RejectionType: Text[100];
        SupplierName: Text[100];
        ReasonCodeDescription: Text[100];
}
