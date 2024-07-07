codeunit 52100 "Event Subscriber"
{
    //12012024
    [EventSubscriber(ObjectType::Table, database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."AME Prod. Posting Type" := SalesLine."AME Prod. Posting Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    procedure OnAfterInitItemLedgEntry(var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: integer; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."AME Prod. Posting Type" := ItemJournalLine."AME Prod. Posting Type";
    end;

    [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        // SalesLine.SetRange("Gen. Prod. Posting Group", GenJournalLine."Gen. Prod. Posting Group");
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindFirst() then begin
            GenJournalLine."AME Prod. Posting Type" := SalesLine."AME Prod. Posting Type";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterCopyGLEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry."AME Prod. Posting Type" := GenJournalLine."AME Prod. Posting Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchases Warehouse Mgt.", 'OnPurchLine2ReceiptLineOnAfterSetQtysOnRcptLine', '', false, false)]
    local procedure OnPurchLine2ReceiptLineOnAfterSetQtysOnRcptLine(var WarehouseReceiptLine: Record "Warehouse Receipt Line"; PurchaseLine: Record "Purchase Line")

    begin
        WarehouseReceiptLine."Currency Code" := PurchaseLine."Currency Code";
        WarehouseReceiptLine."Unit Cost" := PurchaseLine."Unit Cost";
        WarehouseReceiptLine.Validate("Line Amount", WarehouseReceiptLine."Unit Cost" * WarehouseReceiptLine."Qty. to Receive");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Warehouse Mgt.", 'OnAfterCreateShptLineFromSalesLine', '', false, false)]
    local procedure OnBeforeCreateShptLineFromSalesLine(SalesLine: Record "Sales Line"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
    begin
        WarehouseShipmentLine."AME Amount" := SalesLine."Line Amount";
        WarehouseShipmentLine."AME Unit Cost" := SalesLine."Unit Price";
        WarehouseShipmentLine.Modify();
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnAfterPurchaseHeaderOnAfterGetRecord, '', false, false)]
    local procedure OnAfterPurchaseHeaderOnAfterGetRecord(PurchaseHeader: Record "Purchase Header"; var SkipRecord: Boolean;
       var BreakReport: Boolean; var WarehouseRequest: Record "Warehouse Request"; var WhseReceiptHeader: Record "Warehouse Receipt Header"; OneHeaderCreated: Boolean)
    var
        WareHRcptHeader: record "Warehouse Receipt Header";
        WareHRcptLine: Record "Warehouse Receipt Line";
        WarehouseRcptLine: Record "Warehouse Receipt Line";
        PurchHeader2: Record "Purchase Header";
        Label1: Label 'Selected %1: %2 is not matching existing value in warehouse receipt line: %3';
    begin
        if WareHRcptHeader.Get(WhseReceiptHeader."No.") then begin
            WareHRcptLine.Reset();
            WareHRcptLine.SetRange("No.", WareHRcptHeader."No.");
            WareHRcptLine.SetRange("Source Document", WareHRcptLine."Source Document"::"Purchase Order");
            WareHRcptLine.SetRange("Source Type", Database::"Purchase Line");
            WareHRcptLine.SetRange("Source Subtype", PurchaseHeader."Document Type"::Order);
            if WareHRcptLine.FindFirst() then begin

                if PurchHeader2.GEt(PurchaseHeader."Document Type"::Order, WareHRcptLine."Source No.") then begin
                    if PurchHeader2."Buy-from Vendor No." <> PurchaseHeader."Buy-from Vendor No." then
                        Error(Label1, PurchaseHeader.FieldCaption("Buy-from Vendor No."), PurchaseHeader."Buy-from Vendor No.", PurchHeader2."Buy-from Vendor No.");
                    //Error('Vendor No. %1 is not matching in WareHouse Receipt Line.', PurchaseHeader."Buy-from Vendor No.");

                    if PurchHeader2."Currency Code" <> PurchaseHeader."Currency Code" then
                        Error(Label1, PurchaseHeader.FieldCaption("Currency Code"), PurchaseHeader."Currency Code", PurchHeader2."Currency Code");
                    //Error('Currency code %1 is not matching in WareHouse Receipt Line.', PurchaseHeader."Currency Code");

                    if PurchHeader2."Order Address Code" <> PurchaseHeader."Order Address Code" then
                        Error(Label1, PurchaseHeader.FieldCaption("Order Address Code"), PurchaseHeader."Order Address Code", PurchHeader2."Order Address Code");

                    if PurchHeader2."Shipment Method Code" <> PurchaseHeader."Shipment Method Code" then
                        Error(Label1, PurchaseHeader.FieldCaption("Shipment Method Code"), PurchaseHeader."Shipment Method Code", PurchHeader2."Shipment Method Code");

                    if PurchHeader2."Shortcut Dimension 1 Code" <> PurchaseHeader."Shortcut Dimension 1 Code" then
                        Error(Label1, PurchaseHeader.FieldCaption("Shortcut Dimension 1 Code"), PurchaseHeader."Shortcut Dimension 1 Code", PurchHeader2."Shortcut Dimension 1 Code");
                end;

            end;
        end;
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnSalesLineOnAfterGetRecordOnBeforeCreateShptHeader', '', false, false)]
    local procedure OnSalesLineOnAfterGetRecordOnBeforeCreateShptHeader(SalesLine: Record "Sales Line"; var IsHandled: Boolean; var OneHeaderCreated: Boolean; var WarehouseRequest: Record "Warehouse Request"; var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var WhseHeaderCreated: Boolean)
    begin
        CheckIfDivisionCodeMatching(SalesLine, WarehouseShipmentHeader);
    end;

    local procedure CheckIfDivisionCodeMatching(SalesLine: Record "Sales Line"; WarehouseShipHeader: Record "Warehouse Shipment Header")
    var
        SalesHeader: Record "Sales Header";
        WhseShipLine: Record "Warehouse Shipment Line";
        WhseShipHeader: record "Warehouse Shipment Header";
        Salesheader2: Record "Sales Header";
        Label1: Label 'Selected %1: %2 is not matching existing value in warehouse shipment line: %3';
    begin
        if WhseShipHeader.Get(WarehouseShipHeader."No.") then begin
            WhseShipLine.Reset();
            WhseShipLine.SetRange("No.", WhseShipHeader."No.");
            WhseShipLine.SetRange("Source Document", WhseShipLine."Source Document"::"Sales Order");
            WhseShipLine.SetRange("Source Type", Database::"Sales Line");
            WhseShipLine.SetRange("Source Subtype", SalesLine."Document Type"::Order);

            //addedd filter on the sales document no. if any lines of the same documet is already added to the whse shipment
            //exit the validation.
            WhseShipLine.SetRange("Source No.", SalesLine."Document No.");
            if WhseShipLine.FindFirst() then
                exit;

            //if existing line not found, clear the filter
            WhseShipLine.SetRange("Source No.");

            if WhseShipLine.FindFirst() then begin
                SalesHeader.get(SalesLine."Document Type", SalesLine."Document No.");
                if SalesHeader2.Get(Salesheader2."Document Type"::Order, WhseShipLine."Source No.") then begin

                    if Salesheader2."Sell-to Customer No." <> SalesHeader."Sell-to Customer No." then
                        Error(Label1, SalesHeader.FieldCaption("Sell-to Customer No."), SalesHeader."Sell-to Customer No.", Salesheader2."Sell-to Customer No.");
                    //Error('Vendor No. %1 is not matching in WareHouse Receipt Line.', SalesHeader."Buy-from Vendor No.");

                    if Salesheader2."Currency Code" <> SalesHeader."Currency Code" then
                        Error(Label1, SalesHeader.FieldCaption("Currency Code"), SalesHeader."Currency Code", Salesheader2."Currency Code");
                    //Error('Currency code %1 is not matching in WareHouse Receipt Line.', SalesHeader."Currency Code");

                    if Salesheader2."Ship-to Code" <> SalesHeader."Ship-to Code" then
                        Error(Label1, SalesHeader.FieldCaption("Ship-to Code"), SalesHeader."Ship-to Code", Salesheader2."Ship-to Code");

                    if SalesHeader2."Shortcut Dimension 1 Code" <> SalesHeader."Shortcut Dimension 1 Code" then
                        Error(Label1, SalesHeader.FieldCaption("Shortcut Dimension 1 Code"), SalesHeader."Shortcut Dimension 1 Code", SalesHeader2."Shortcut Dimension 1 Code");
                end;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Assembly Document", OnBeforeReleaseAssemblyDoc, '', false, false)]
    local procedure OnBeforeReleaseAssemblyDoc(var AssemblyHeader: Record "Assembly Header")
    begin
        AssemblyHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnAfterSalesHeaderOnAfterGetRecord', '', false, false)]
    local procedure OnAfterSalesHeaderOnAfterGetRecord(SalesHeader: Record "Sales Header"; var SkipRecord: Boolean; var BreakReport: Boolean; var WarehouseRequest: Record "Warehouse Request")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            SalesHeader.TestField("AME SO Status", SalesHeader."AME SO Status"::Confirmed);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Outbound", 'OnBeforeCreateFromSalesOrder', '', false, false)]
    local procedure OnBeforeCreateFromSalesOrder(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            SalesHeader.TestField("AME SO Status", SalesHeader."AME SO Status"::Confirmed);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header")
    begin
        //SalesHeader.TestField("AME SO Status", SalesHeader."AME SO Status"::Open);
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            SalesHeader.TestField("AME SO Status", SalesHeader."AME SO Status"::Confirmed);
    end;

    procedure GetCharges(var warehouseRcptHeader: Record "Warehouse Receipt Header")
    var
        FormLandedCost: Record "AME Landed Cost";
        ToCostWorksheet: Record "AME Cost_Worksheet";
        PurchaseHeader: Record "Purchase Header";
        CostMissingError: Label 'No charges found for Vendor: %1 ,Vendor Name: %2 ,Supply From: %3 ,Shipment Method: %4 ,Transport Type: %5';
        TotalInvoiceAmt: Decimal;
    begin
        warehouseRcptHeader.TestField("AME Transport Method");

        PurchaseHeader := warehouseRcptHeader.GetFirstPOFromWarehouseReceipt();
        PurchaseHeader.TestField("Order Address Code");
        TotalInvoiceAmt := warehouseRcptHeader.GetInvoiceAmount();

        FormLandedCost.Reset();
        FormLandedCost.SetRange(AME_Vendor_No, PurchaseHeader."Buy-from Vendor No.");
        FormLandedCost.SetRange(AME_Supply_From, PurchaseHeader."Order Address Code");
        FormLandedCost.SetRange(AME_Transport_Type, warehouseRcptHeader."AME Transport Method");
        FormLandedCost.SetRange(AME_Shipment_Method, PurchaseHeader."Shipment Method Code");
        if FormLandedCost.FindFirst() then begin
            repeat
                ToCostWorksheet.Reset();
                ToCostWorksheet.SetRange(AME_Document_Type, ToCostWorksheet.AME_Document_Type::"Warehouse Receipt");
                ToCostWorksheet.SetRange(AME_Document_No, warehouseRcptHeader."No.");
                ToCostWorksheet.SetRange(AME_Charge_Code, FormLandedCost.AME_Charge_Code);
                if NOT ToCostWorksheet.FindFirst() then begin
                    ToCostWorksheet.Init();
                    ToCostWorksheet.AME_Document_Type := ToCostWorksheet.AME_Document_Type::"Warehouse Receipt";
                    ToCostWorksheet.AME_Document_No := warehouseRcptHeader."No.";
                    ToCostWorksheet.AME_Charge_Code := FormLandedCost.AME_Charge_Code;
                    ToCostWorksheet.AME_Supply_From := FormLandedCost.AME_Supply_From;
                    ToCostWorksheet.AME_Vendor_No := FormLandedCost.AME_Vendor_No;
                    ToCostWorksheet.AME_Transport_Type := FormLandedCost.AME_Transport_Type;
                    ToCostWorksheet.AME_Shipment_Method := FormLandedCost.AME_Shipment_Method;
                    ToCostWorksheet.AME_Charge_Type := FormLandedCost.AME_Charge_Type;
                    ToCostWorksheet.AME_Charge := FormLandedCost.AME_Charge;
                    if FormLandedCost.AME_Charge_Type = FormLandedCost.AME_Charge_Type::Percentage then begin
                        ToCostWorksheet.AME_Charge_Amount := Round((TotalInvoiceAmt * FormLandedCost.AME_Charge) / 100, 0.01, '=');
                    end
                    else
                        if FormLandedCost.AME_Charge_Type = FormLandedCost.AME_Charge_Type::Fixed then begin
                            ToCostWorksheet.AME_Charge_Amount := FormLandedCost.AME_Charge;
                        end;
                    ToCostWorksheet.Insert();
                end;
            until FormLandedCost.Next() = 0;
        end else
            Error(CostMissingError, PurchaseHeader."Buy-from Vendor No.", PurchaseHeader."Buy-from Vendor Name", PurchaseHeader."Order Address Code", PurchaseHeader."Shipment Method Code", warehouseRcptHeader."AME Transport Method");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
    begin
        // if PurchLine."Document Type" <> PurchLine."Document Type"::Order then
        //     exit;


        // WhseRcptLine.SetCurrentKey("No.", "Line No.");
        // WhseRcptLine.SetRange("Source Type", Database::"Purchase Line");
        // WhseRcptLine.SetRange("Source Subtype", PurchLine."Document Type"::Order);
        // WhseRcptLine.SetRange("Source Document", WhseRcptLine."Source Document"::"Purchase Order");
        // WhseRcptLine.SetRange("Source No.", PurchLine."Document No.");
        // WhseRcptLine.SetRange("Source Line No.", PurchLine."Line No.");
        // if WhseRcptLine.FindFirst() then
        //     ItemJnlLine."Indirect Cost %" := WhseRcptLine."Landed Cost %";

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnInitSourceDocumentLinesOnAfterSourcePurchLineFound', '', true, true)]
    local procedure OnInitSourceDocumentLinesOnAfterSourcePurchLineFound(var PurchaseLine: Record "Purchase Line"; WhseRcptLine: Record "Warehouse Receipt Line"; var ModifyLine: Boolean; WhseRcptHeader: Record "Warehouse Receipt Header")
    begin
        if PurchaseLine."Document Type" <> PurchaseLine."Document Type"::Order then
            exit;

        if WhseRcptLine."Landed Cost %" <> 0 then begin
            PurchaseLine.SuspendStatusCheck(true);
            PurchaseLine.Validate("Indirect Cost %", WhseRcptLine."Landed Cost %");
            PurchaseLine.SuspendStatusCheck(false);
            ModifyLine := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Lot No. Information", 'OnShowCardOnAfterLotNoInfoNewSetFilters', '', false, false)]
    local procedure OnShowCardOnAfterLotNoInfoNewSetFilters(var LotNoInformation: Record "Lot No. Information"; TrackingSpecification: Record "Tracking Specification")
    var
        PurchLine: Record "Purchase Line";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
        WareHouseReceHeader: Record "Warehouse Receipt Header";
        LotInfo: Record "Lot No. Information";

    begin
        LotInfo.SetCurrentKey("Item No.", "Variant Code", "Lot No.");
        LotInfo.SetRange("Item No.", TrackingSpecification."Item No.");
        LotInfo.SetRange("Variant Code", TrackingSpecification."Variant Code");
        LotInfo.SetRange("Lot No.", TrackingSpecification."Lot No.");
        if LotInfo.FindFirst() then
            exit;

        if TrackingSpecification."Source Type" = Database::"Purchase Line" then begin
            if TrackingSpecification."Source Subtype" = TrackingSpecification."Source Subtype"::"1" then
                if PurchLine.get(PurchLine."Document Type"::Order, TrackingSpecification."Source ID", TrackingSpecification."Source Ref. No.") then begin
                    WarehouseReceiptLine.SetCurrentKey("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    WarehouseReceiptLine.SetRange("Source Type", Database::"Purchase Line");
                    WarehouseReceiptLine.SetRange("Source Subtype", WarehouseReceiptLine."Source Subtype"::"1");
                    WarehouseReceiptLine.SetRange("Source No.", PurchLine."Document No.");
                    WarehouseReceiptLine.SetRange("Source Line No.", PurchLine."Line No.");
                    if WarehouseReceiptLine.FindFirst() then begin
                        if WareHouseReceHeader.Get(WarehouseReceiptLine."No.") then begin
                            if GuiAllowed then
                                if not confirm(StrSubstNo(Text0003, TrackingSpecification."Item No.", TrackingSpecification."Variant Code", TrackingSpecification."Lot No."), true) then
                                    exit;
                            Clear(LotInfo);
                            LotInfo.Init();
                            LotInfo.Validate("Item No.", TrackingSpecification."Item No.");
                            LotInfo.Validate("Variant Code", TrackingSpecification."Variant Code");
                            LotInfo.Validate("Lot No.", TrackingSpecification."Lot No.");
                            LotInfo.Validate("Expiry Date", TrackingSpecification."Expiration Date");
                            LotInfo.Validate("BOE Date", WareHouseReceHeader."BOE Date");
                            LotInfo.Validate("BE No.", WareHouseReceHeader."BOE No.");
                            LotInfo.Validate(Description, TrackingSpecification."Lot No.");
                            LotInfo.Insert(true);
                            // LotNoInformation.SetRange("BE No.", WareHouseReceHeader."BOE No.");
                            // LotNoInformation.SetRange("BOE Date", WareHouseReceHeader."BOE Date");
                            // LotNoInformation.SetRange("Expiry Date", TrackingSpecification."Expiration Date");
                        end;
                    end;


                end;
            //GET purchase line from tracking specification 
            //use source type, source id and source ref no - line no. 

            //get whse. receipt line linked from purchase line.
            //use source type, source no, and source line no.

            //get whse receipt header from whse receipt line

            //apply filters for req fields.
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignHeaderValues', '', false, false)]
    local procedure OnAfterAssignHeaderValues(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    begin
        if PurchLine."AME Price Date" = 0D then
            PurchLine.Validate("AME Price Date", PurchHeader."AME Price Date");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignHeaderValues', '', false, false)]
    local procedure Sales_LineOnAfterAssignHeaderValues(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
        if SalesLine."AME Price Date" = 0D then
            SalesLine.Validate("AME Price Date", SalesHeader."AME Price Date");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Header", 'OnAfterOnInsert', '', false, false)]
    local procedure WhseRcptHeader_OnAfterOnInsert(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; var xWarehouseReceiptHeader: Record "Warehouse Receipt Header"; Location: Record Location)
    begin
        WarehouseReceiptHeader."Shipment Status" := WarehouseReceiptHeader."Shipment Status"::Open;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendPurchaseDocForApproval', '', false, false)]
    local procedure OnSendPurchaseDocForApproval(var PurchaseHeader: Record "Purchase Header")
    begin
        PurchaseHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterCheckSalesApprovalPossible', '', false, false)]
    local procedure OnAfterCheckSalesApprovalPossible(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendSalesDocForApproval', '', false, false)]
    local procedure OnSendSalesDocForApproval(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterCheckPurchaseApprovalPossible', '', false, false)]
    local procedure OnAfterCheckPurchaseApprovalPossible(var PurchaseHeader: Record "Purchase Header")
    begin
        PurchaseHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        PurchaseHeader.ValidateBeforeRelease();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeSaveAttachment', '', false, false)]
    local procedure OnBeforeSaveAttachment(var TempBlob: Codeunit "Temp Blob"; var DocumentAttachment: Record "Document Attachment"; var FileName: Text; var RecRef: RecordRef);
    var
        Msg: Label 'The attachment exceeds %1 KB and cannot be uploaded. The current size is %2 KB.';
        AtosAppSetup: Record "ATOS App Setup";
        fileeByteLength: Integer;
        maxBytength: Integer;
        FileMgt: Codeunit "File Management";
        extension: Text;
    begin
        AtosAppSetup.Get();
        extension := FileMgt.GetExtension(FileName);

        if AtosAppSetup."AME Allowed Extension" <> '' then
            if StrPos(AtosAppSetup."AME Allowed Extension", extension) = 0 then
                Error('Attachment for %1 files is not supported!', extension);

        if AtosAppSetup."AME Max. File Size (KB)" <> 0 then begin
            fileeByteLength := TempBlob.Length();
            maxBytength := AtosAppSetup."AME Max. File Size (KB)" * 1024;
            if fileeByteLength > maxBytength then
                Error(Msg, AtosAppSetup."AME Max. File Size (KB)", Round(fileeByteLength / 1024, 0.01, '='));
        end;

    end;

    var
        Percentage: Decimal;
        Text0003: Label 'Lot Information does not exists for Item: %1, Variaant:%2, Lot No: %3.\Do you want to create new lot information?';
}




