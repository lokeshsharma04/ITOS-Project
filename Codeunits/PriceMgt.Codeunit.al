codeunit 52101 "AME Price Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterGetDocumentDate', '', false, false)]
    local procedure SalesLine_OnAfterGetDocumentDate(var DocumentDate: Date; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line")
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
    begin
        SalesRecSetup.Get();
        if not SalesRecSetup."AME Price Based On Price Date" then
            exit;
        // if salepricebasedonshipmentdate then

        if SalesLine."AME Price Date" <> 0D then
            DocumentDate := SalesLine."AME Price Date"
        else
            if SalesHeader."AME Price Date" <> 0D then
                DocumentDate := SalesHeader."AME Price Date";
    end;


    [EventSubscriber(ObjectType::Table, DataBase::"Sales Header", 'OnUpdateSalesLineByChangedFieldName', '', false, false)]
    local procedure OnUpdateSalesLineByChangedFieldName(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; ChangedFieldName: Text[100]; ChangedFieldNo: Integer; xSalesHeader: Record "Sales Header")
    begin
        if ChangedFieldNo = SalesHeader.FieldNo("AME Price Date") then
            if SalesLine."No." <> '' then
                SalesLine.Validate("AME Price Date", SalesHeader."AME Price Date");
    end;
}