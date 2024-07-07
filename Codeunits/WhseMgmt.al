codeunit 52107 "Warehouse Mgmt"
{

    procedure GetLandedCostAndCostFactor(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; TotalCharges: Decimal; var TotalInvoiceValue: Decimal; var LandedCostFactor: Decimal)
    var
        WarehouseRecptLine: Record "Warehouse Receipt Line";
    begin
        TotalInvoiceValue := 0;
        WarehouseRecptLine.SetCurrentKey("No.", "Line No.");
        WarehouseRecptLine.SetRange("No.", WarehouseReceiptHeader."No.");
        WarehouseRecptLine.SetRange("Source Document", WarehouseRecptLine."Source Document"::"Purchase Order");
        if WarehouseRecptLine.FindSet() then begin
            WarehouseRecptLine.CalcSums("Line Amount");
            TotalInvoiceValue := WarehouseRecptLine."Line Amount";
        end;

        if TotalInvoiceValue <> 0 then
            LandedCostFactor := Round((TotalCharges / TotalInvoiceValue) * 100, 0.01, '=')
        else
            LandedCostFactor := 0;
    end;

    local procedure InsertPostedCostWorksheet(var WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    var
        CostWorkSheet: Record "AME Cost_Worksheet";
        PostedCostWorkSheet: Record "AME Posted Cost Worksheet";
        PostedCostWorkSheetNew: Record "AME Posted Cost Worksheet";
        PuchHeader: Record "Purchase Header";
        TotalInvoice: Decimal;
        CostFactor: Decimal;
        TotalCharges: Decimal;
    begin
        TotalCharges := 0;
        PuchHeader := WarehouseReceiptHeader.GetFirstPOFromWarehouseReceipt();
        CostWorkSheet.Reset();
        CostWorkSheet.SetRange(AME_Document_Type, CostWorkSheet.AME_Document_Type::"Warehouse Receipt");
        CostWorkSheet.SetRange(AME_Document_No, WarehouseReceiptHeader."No.");
        CostWorkSheet.SetRange(AME_Vendor_No, PuchHeader."Buy-from Vendor No.");
        if CostWorkSheet.FindSet() then begin
            CostWorkSheet.CalcSums(AME_Charge_Amount);
            TotalCharges := CostWorkSheet.AME_Charge_Amount;
            GetLandedCostAndCostFactor(WarehouseReceiptHeader, TotalCharges, TotalInvoice, CostFactor);
            repeat
                PostedCostWorkSheet.Reset();
                PostedCostWorkSheet.SetRange(AME_Document_Type, PostedCostWorkSheet.AME_Document_Type::"Warehouse Receipt");
                PostedCostWorkSheet.SetRange(AME_Document_No, WarehouseReceiptHeader."No.");
                PostedCostWorkSheet.SetRange(AME_Charge_Code, PostedCostWorkSheet.AME_Charge_Code);
                if not PostedCostWorkSheet.FindFirst() then begin
                    PostedCostWorkSheetNew.Init();
                    PostedCostWorkSheetNew.TransferFields(CostWorkSheet);
                    PostedCostWorkSheetNew.Insert();
                    PostedCostWorkSheetNew.TotalCharges := TotalCharges;
                    PostedCostWorkSheetNew.TotalInvoiceValue := TotalInvoice;
                    PostedCostWorkSheetNew.LandedCostFactor := CostFactor;
                    PostedCostWorkSheetNew.Modify();
                end;
            until CostWorkSheet.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnBeforeRun', '', false, false)]
    local procedure OnBeforeRun(var SuppressCommit: Boolean; var WarehouseReceiptLine: Record "Warehouse Receipt Line")
    begin
        //Warehouse Receipt Validation Before Posting.
        WarehouseReceiptLine.WhseReceiptValidation(WarehouseReceiptLine."No.");
    end;
    //05062024
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnInitSourceDocumentHeaderOnBeforeSalesHeaderModify', '', false, false)]
    local procedure OnInitSourceDocumentHeaderOnBeforeSalesHeaderModify(var SalesHeader: Record "Sales Header"; var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var ModifyHeader: Boolean; Invoice: Boolean; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    begin
        SalesHeader.Validate("AME Commercial Invoice No.", WarehouseShipmentHeader."AME Commercial Invoice No.");
        SalesHeader.Validate("AME Bill of Exit Date", WarehouseShipmentHeader."AME Bill of Exit Date");
        SalesHeader.Validate("AME Bill of Exit No.", WarehouseShipmentHeader."AME Bill of Exit No.");
        SalesHeader.Validate("AME Chamber Charges", WarehouseShipmentHeader."AME Chamber Charges");
        SalesHeader.Validate("AME Remarks", WarehouseShipmentHeader."AME Remarks");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", OnBeforePurchLineModify, '', false, false)]
    local procedure OnBeforePurchLineModify(var ModifyLine: Boolean; var PurchaseLine: Record "Purchase Line"; WhseRcptLine: Record "Warehouse Receipt Line")
    begin
        PurchaseLine.Validate("AME Remarks", WhseRcptLine."AME Remarks");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnBeforePostedWhseRcptLineInsert', '', false, false)]
    local procedure OnBeforePostedWhseRcptLineInsert(var PostedWhseReceiptLine: Record "Posted Whse. Receipt Line"; WarehouseReceiptLine: Record "Warehouse Receipt Line")
    begin
        PostedWhseReceiptLine."AME Remarks" := WarehouseReceiptLine."AME Remarks";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforePostedWhseShptHeaderInsert', '', false, false)]
    local procedure OnBeforePostedWhseShptHeaderInsert(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        PostedWhseShipmentHeader."AME Bill of Exit Date" := WarehouseShipmentHeader."AME Bill of Exit Date";
        PostedWhseShipmentHeader."AME Bill of Exit No." := WarehouseShipmentHeader."AME Bill of Exit No.";
        PostedWhseShipmentHeader."AME Commercial Invoice No." := WarehouseShipmentHeader."AME Commercial Invoice No.";
        PostedWhseShipmentHeader."AME Ship Confirmed" := WarehouseShipmentHeader."AME Ship Confirmed";
        PostedWhseShipmentHeader."AME Chamber Charges" := WarehouseShipmentHeader."AME Chamber Charges";
        PostedWhseShipmentHeader."AME Remarks" := WarehouseShipmentHeader."AME Remarks";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforeRun', '', false, false)]
    local procedure WhsePostShipment_OnBeforeRun(var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        WhseShipHeader: Record "Warehouse Shipment Header";
    begin
        WhseShipHeader.Get(WarehouseShipmentLine."No.");
        CheckIfShipmentIsReadyToShip(WhseShipHeader, WarehouseShipmentLine);
        CheckIfBOEDetailsReqForShipment(WhseShipHeader);
        CheckIfCommercialInvNoReqForShipmentPosting(WhseShipHeader, WarehouseShipmentLine);
    end;

    procedure CheckIfBOEDetailsReqForShipment(var WhseShipHeader: Record "Warehouse Shipment Header")
    var
        IsHandled: Boolean;
        myInt: Integer;
        SalesRecSetup: Record "Sales & Receivables Setup";
    begin
        OnBeforeCheckIfBOEDetailsReqForShipment(WhseShipHeader, IsHandled);
        if IsHandled then
            exit;

        if SalesRecSetup.Get() then
            if SalesRecSetup."AME BOE Details Req. for Ship" then begin
                WhseShipHeader.TestField("AME Bill of Exit No.");
                WhseShipHeader.TestField("AME Bill of Exit Date");
            end;

        OnAfterCheckIfBOEDetailsReqForShipment(WhseShipHeader);
    end;

    local procedure CheckIfShipmentIsReadyToShip(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        IsHandled: Boolean;
    begin
        OnBeforeCheckIfShipmentIsReadyToShip(WhseShipHeader, WarehouseShipmentLine, IsHandled);
        if IsHandled then
            exit;

        WhseShipHeader.TestField("AME Ship. Confirm Status", WhseShipHeader."AME Ship. Confirm Status"::"Ready to Ship");

        OnAfterCheckIfShipmentIsReadyToShip(WhseShipHeader, WarehouseShipmentLine);
    end;

    local procedure CheckIfCommercialInvNoReqForShipmentPosting(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        IsHandled: Boolean;
        myInt: Integer;
        SalesRecSetup: Record "Sales & Receivables Setup";

        WhseShipLine: Record "Warehouse Shipment Line";
    begin
        OnBeforeCheckIfCommercialInvNoReqForShipmentPosting(WhseShipHeader, WarehouseShipmentLine, IsHandled);
        if IsHandled then
            exit;

        if SalesRecSetup.Get() then
            if SalesRecSetup."AME Comm. Inv Req. for Ship" then begin
                //if WhseShipHeader.Get(WarehouseShipmentLine."No.") then begin
                WhseShipLine.SetCurrentKey("No.", "Line No.");
                WhseShipLine.SetRange("No.", WhseShipHeader."No.");
                WhseShipLine.SetRange("Source Type", Database::"Sales Line");
                WhseShipLine.SetRange("Source Subtype", 1);
                if WhseShipLine.FindFirst() then begin
                    WhseShipHeader.TestField("AME Commercial Invoice No.");
                end;
                //end;
            end;

        OnAfterCheckIfCommercialInvNoReqForShipmentPosting(WhseShipHeader, WarehouseShipmentLine);
    end;


    /// <summary>
    /// Copy value from Worksheet line to Activity line
    /// </summary>
    /// <param name="WarehouseActivityLine"></param>
    /// <param name="WhseWorksheetLine"></param>
    [EventSubscriber(ObjectType::Table, Database::"Warehouse Activity Line", 'OnAfterTransferFromMovWkshLine', '', false, false)]
    local procedure WhseActivityLine_OnAfterTransferFromMovWkshLine(var WarehouseActivityLine: Record "Warehouse Activity Line"; WhseWorksheetLine: Record "Whse. Worksheet Line")
    begin
        WarehouseActivityLine."Reason Code" := WhseWorksheetLine."Reason Code";
        WarehouseActivityLine."AME Comments" := WhseWorksheetLine."AME Comments";
        WarehouseActivityLine."AME Assembly Order No." := WhseWorksheetLine."AME Assembly Order No.";
        WarehouseActivityLine."AME Worksheet Template Name" := WhseWorksheetLine."Worksheet Template Name";
    end;

    /// <summary>
    /// Copy value from activity line to warehosue entry
    /// </summary>
    /// <param name="WarehouseEntry"></param>
    /// <param name="WarehouseJournalLine"></param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnInitWhseEntryCopyFromWhseJnlLine, '', false, false)]
    local procedure OnInitWhseEntryCopyFromWhseJnlLine(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line")

    begin
        WarehouseEntry."Reason Code" := WarehouseJournalLine."Reason Code";
        WarehouseEntry."AME Comments" := WarehouseJournalLine."AME Comments";
        WarehouseEntry."AME Assembly Order No." := WarehouseJournalLine."AME Assembly Order No.";
        WarehouseEntry."AME Worksheet Template Name" := WarehouseJournalLine."AME Worksheet Template Name";
        WarehouseEntry."AME Worksheet Batch Name" := WarehouseJournalLine."AME Worksheet Batch Name";
    end;

    /// <summary>
    /// Copy value from activity lines to rergistered activity line
    /// </summary>
    /// <param name="WarehouseJournalLine"></param>
    /// <param name="WarehouseActivityLine"></param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Register", 'OnBeforeWhseJnlRegisterLine', '', false, false)]
    local procedure OnBeforeWhseJnlRegisterLine(var WarehouseJournalLine: Record "Warehouse Journal Line"; WarehouseActivityLine: Record "Warehouse Activity Line")

    begin
        WarehouseJournalLine."Reason Code" := WarehouseActivityLine."Reason Code";
        WarehouseJournalLine."AME Comments" := WarehouseActivityLine."AME Comments";
        WarehouseJournalLine."AME Assembly Order No." := WarehouseActivityLine."AME Assembly Order No.";
        WarehouseJournalLine."AME Worksheet Template Name" := WarehouseActivityLine."AME Worksheet Template Name";
        if WarehouseActivityLine."Whse. Document Type" = WarehouseActivityLine."Whse. Document Type"::"Movement Worksheet" then
            WarehouseJournalLine."AME Worksheet Batch Name" := WarehouseActivityLine."Whse. Document No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnAfterPostedWhseRcptHeaderInsert', '', false, false)]
    local procedure OnBeforePostSourceDocument(var PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header"; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        if WarehouseReceiptHeader.IsLandedCostApplicable() then begin
            InsertPostedCostWorksheet(WarehouseReceiptHeader);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Outbound", 'OnBeforeGetSingleOutboundDoc', '', false, false)]
    local procedure OnBeforeGetSingleOutboundDoc(var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var IsHandled: Boolean)
    begin
        WarehouseShipmentHeader.TestField("AME Ship. Confirm Status", WarehouseShipmentHeader."AME Ship. Confirm Status"::Open);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Whse. Pick Subform", 'OnBeforeRegisterActivityYesNo', '', false, false)]
    local procedure OnBeforeRegisterActivityYesNo(var WarehouseActivityLine: Record "Warehouse Activity Line"; var IsHandled: Boolean)
    var
        WhseActivityLine: Record "Warehouse Activity Line";
        LastWhseDocNo: Code[20];
        WarehouseShipment: Record "Warehouse Shipment Header";
        WaerhouseShipLine: Record "Warehouse Shipment Line";
    begin
        WhseActivityLine.SetCurrentKey("Activity Type", "No.", "Whse. Document Type", "Whse. Document No.", "Whse. Document Line No.");
        WhseActivityLine.SetRange("Activity Type", WarehouseActivityLine."Activity Type");
        WhseActivityLine.SetRange("No.", WarehouseActivityLine."No.");
        WhseActivityLine.SetRange("Whse. Document Type", WhseActivityLine."Whse. Document Type"::Shipment);
        if WhseActivityLine.FindFirst() then
            repeat
                if LastWhseDocNo <> WhseActivityLine."Whse. Document No." then begin
                    Clear(WaerhouseShipLine);
                    WaerhouseShipLine.Reset();
                    WaerhouseShipLine.SetCurrentKey("No.", "Line No.");
                    WaerhouseShipLine.SetRange("No.", WhseActivityLine."Whse. Document No.");
                    WaerhouseShipLine.SetRange("Source Type", Database::"Sales Line");
                    WaerhouseShipLine.SetRange("Source Subtype", 1);
                    if WaerhouseShipLine.FindFirst() then
                        if WarehouseShipment.Get(WarehouseActivityLine."Whse. Document No.") then
                            WarehouseShipment.TestField("AME Ship. Confirm Status", WarehouseShipment."AME Ship. Confirm Status"::Confirmed);
                end;

                LastWhseDocNo := WhseActivityLine."Whse. Document No.";
            until WhseActivityLine.Next() = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckIfCommercialInvNoReqForShipmentPosting(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckIfCommercialInvNoReqForShipmentPosting(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckIfShipmentIsReadyToShip(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckIfShipmentIsReadyToShip(var WhseShipHeader: Record "Warehouse Shipment Header"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckIfBOEDetailsReqForShipment(var WhseShipHeader: Record "Warehouse Shipment Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckIfBOEDetailsReqForShipment(var WhseShipHeader: Record "Warehouse Shipment Header")
    begin
    end;z
}