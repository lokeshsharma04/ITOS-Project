codeunit 52102 "AME Purchase Price Mgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Line - Price", 'OnAfterGetDocumentDate', '', false, false)]
    local procedure PurchLine_OnAfterGetDocumentDate(var DocumentDate: Date; PurchaseHeader: Record "Purchase Header"; PurchaseLine: Record "Purchase Line")
    var
        PurcPaySetup: Record "Purchases & Payables Setup";
    begin
        PurcPaySetup.Get();
        if not PurcPaySetup."AME Price Based On Price Date" then
            exit;

        if PurchaseLine."AME Price Date" <> 0D then
            DocumentDate := PurchaseLine."AME Price Date"
        else
            if PurchaseHeader."Order Date" <> 0D then
                DocumentDate := PurchaseHeader."Order Date";
    end;

    [EventSubscriber(ObjectType::Table, DataBase::"Purchase Header", 'OnUpdatePurchLinesByChangedFieldName', '', false, false)]
    local procedure OnUpdatePurchLinesByChangedFieldName(PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; ChangedFieldName: Text[100]; ChangedFieldNo: Integer)
    begin
        if ChangedFieldNo = PurchHeader.FieldNo("AME Price Date") then
            if PurchLine."No." <> '' then begin
                PurchLine.Validate("AME Price Date", PurchHeader."AME Price Date");
                // PurchLine.UpdateDirectUnitCost(0);
                // PurchHeader.RefreshPurchasePrices(PurchHeader);
            end;
    end;

    // [EventSubscriber(ObjectType::Table, DataBase::"Purchase Line", , '', false, false)]
    // local procedure OnUpdatePurchLinesByChangedFieldName(PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; ChangedFieldName: Text[100]; ChangedFieldNo: Integer)
    // begin
    //     if ChangedFieldNo = PurchHeader.FieldNo("AME Price Date") then
    //         if PurchLine."No." <> '' then begin
    //             PurchLine.Validate("AME Price Date", PurchHeader."AME Price Date");
    //             PurchLine.UpdateDirectUnitCost(0);
    //             // PurchHeader.RefreshPurchasePrices(PurchHeader);
    //         end;
    // end;
}
