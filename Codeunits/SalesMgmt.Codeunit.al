codeunit 52109 "Sales Mgmt."
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnInitRecordOnBeforeAssignOrderDate', '', false, false)]
    local procedure OnInitRecordOnAfterAssignDates(var NewOrderDate: Date; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."AME Price Date" := NewOrderDate;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Get Shipment", 'OnAfterCreateInvLines', '', false, false)]
    local procedure OnAfterCreateInvLines(SalesShipmentHeader: Record "Sales Shipment Header"; sender: Codeunit "Sales-Get Shipment"; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesShipmentLine2: Record "Sales Shipment Line")
    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommercialNoErr: Label 'Current %3 :%1 does not match with selected value: %2.\Do you want to update %3?';
        UpdateCommercialNo: Boolean;
    begin

        UpdateCommercialNo := true;
        if SalesHeader."AME Commercial Invoice No." <> '' then
            if SalesHeader."AME Commercial Invoice No." <> SalesShipmentHeader."AME Commercial Invoice No." then
                if not Confirm(StrSubstNo(CommercialNoErr, SalesHeader."AME Commercial Invoice No.", SalesShipmentHeader."AME Commercial Invoice No.", SalesHeader.FieldCaption("AME Commercial Invoice No."))) then begin
                    UpdateCommercialNo := false;
                end;

        if UpdateCommercialNo then begin
            SalesHeader.Validate("AME Commercial Invoice No.", SalesShipmentHeader."AME Commercial Invoice No.");
            SalesHeader.Modify();
        end;

        if SalesShipmentHeader."AME Chamber Charges" <> 0 then begin
            SalesSetup.Get();
            SalesSetup.TestField("AME Chamber Charge Item");
            InsertChamberChargeLine(SalesShipmentHeader, SalesHeader, SalesSetup);
        end;

    end;

    local procedure InsertChamberChargeLine(SalesShipHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; SalesSetup: Record "Sales & Receivables Setup")
    var
        NewSalesLine: Record "Sales Line";
        IsHandled: Boolean;
        LineNo: Integer;
        ChargeAmt: Decimal;
    begin
        OnBeforeInsertChamberChargeLine(SalesShipHeader, SalesHeader, SalesSetup, IsHandled);
        if IsHandled then
            exit;

        ChargeAmt := SalesShipHeader."AME Chamber Charges";
        LineNo := 10000;

        NewSalesLine.Reset();
        NewSalesLine.SetRange("Document Type", SalesHeader."Document Type");
        NewSalesLine.SetRange("Document No.", SalesHeader."No.");
        if NewSalesLine.FindLast() then
            LineNo := NewSalesLine."Line No." + 10000;

        Clear(NewSalesLine);
        NewSalesLine.Reset();
        NewSalesLine.Init();
        NewSalesLine.InitHeaderDefaults(SalesHeader);
        NewSalesLine.SetHideValidationDialog(true);
        NewSalesLine.Validate("Document Type", SalesHeader."Document Type");
        NewSalesLine.Validate("Document No.", SalesHeader."No.");
        NewSalesLine.validate("Line No.", LineNo);
        NewSalesLine.Insert();
        NewSalesLine.Validate(Type, NewSalesLine.Type::Item);
        NewSalesLine.Validate("No.", SalesSetup."AME Chamber Charge Item");
        NewSalesLine.Validate("AME Price Date", SalesHeader."AME Price Date");
        NewSalesLine.Validate(Quantity, 1);
        NewSalesLine.Validate("Unit Price", ChargeAmt);
        //charge document no.
        NewSalesLine.validate("AME Charge Document No.", SalesShipHeader."No.");
        NewSalesLine.Modify(true);

        OnAfterInsertChamberChargeLine(NewSalesLine, SalesShipHeader, SalesHeader, SalesSetup);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterManualReleaseSalesDoc', '', false, false)]
    local procedure OnAfterManualReleaseSalesDoc(PreviewMode: Boolean; var SalesHeader: Record "Sales Header")
    var
        SalesSetup: Record "Sales & Receivables Setup";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        // SalesSetup.Get();
        // if Not SalesSetup."AME Create Arch. On Release" then
        //     exit;
        // ArchiveManagement.StoreSalesDocument(SalesHeader, false);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertChamberChargeLine(SalesShipHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; SalesSetup: Record "Sales & Receivables Setup"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertChamberChargeLine(NewSalesLine: Record "Sales Line"; SalesShipHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; SalesSetup: Record "Sales & Receivables Setup")
    begin
    end;
}
