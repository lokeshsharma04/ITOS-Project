codeunit 52108 "Purchase Mgmt."
{

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnInitRecordOnAfterAssignDates', '', false, false)]
    local procedure OnInitRecordOnAfterAssignDates(var PurchaseHeader: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
    begin
        PurchaseHeader."AME Price Date" := PurchaseHeader."Order Date";
        if UserSetup.Get(UserId) then
            PurchaseHeader."AME Purch. Order Type" := UserSetup."AME Purch. Order Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterManualReleasePurchaseDoc', '', false, false)]
    local procedure OnAfterManualReleasePurchaseDoc(PreviewMode: Boolean; var PurchaseHeader: Record "Purchase Header")
    var
        PurchSetup: Record "Purchases & Payables Setup";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        // if PurchSetup.Get() then
        //     if Not PurchSetup."AME Create Arch. On Release" then
        //         exit;
        // ArchiveManagement.StorePurchDocument(PurchaseHeader, false);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purch. Rcpt. Line", 'OnAfterInsertInvLineFromRcptLine', '', false, false)]
    local procedure OnAfterInsertInvLineFromRcptLine(PurchOrderLine: Record "Purchase Line"; PurchRcptLine: Record "Purch. Rcpt. Line"; var NextLineNo: Integer; var PurchLine: Record "Purchase Line")
    var
        PurchInv: Record "Purchase Header";
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        PurchSetup.Get();
        if Not PurchSetup."AME Copy Des from Rcpt/Shpt Ln" then
            exit;
        if PurchInv.Get(PurchInv."Document Type"::Invoice, PurchLine."Document No.") then
            if PurchInv."AME Description" = '' then begin
                PurchRcptHdr.Get(PurchRcptLine."Document No.");
                PurchInv."AME Description" := PurchRcptHdr."AME Description";
                PurchInv.Modify();
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Return Shipment Line", 'OnAfterInsertInvLineFromRetShptLine', '', false, false)]
    local procedure OnAfterInsertInvLineFromRetShptLine(var PurchLine: Record "Purchase Line"; var PurchOrderLine: Record "Purchase Line"; var ReturnShipmentLine: Record "Return Shipment Line")
    var
        PurchCrMemo: Record "Purchase Header";
        ReturnShipHdr: Record "Return Shipment Header";
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        PurchSetup.Get();
        if Not PurchSetup."AME Copy Des from Rcpt/Shpt Ln" then
            exit;
        if PurchCrMemo.Get(PurchCrMemo."Document Type"::"Credit Memo", PurchLine."Document No.") then
            if PurchCrMemo."AME Description" = '' then begin
                ReturnShipHdr.Get(ReturnShipmentLine."Document No.");
                PurchCrMemo."AME Description" := ReturnShipHdr."AME Description";
                PurchCrMemo.Modify();
            end;
    end;
}
