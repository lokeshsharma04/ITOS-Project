codeunit 52104 "AME Utility"
{

    trigger OnRun()
    begin
        Message('Test');
    end;

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    procedure PurchDirectUnitCostChangeAllowed(): Boolean
    var
        UserSetup: Record "User Setup";
        ChangeAllowed: Boolean;
    begin
        ChangeAllowed := false;
        if UserSetup.Get(UserId) then
            ChangeAllowed := UserSetup."AME Allow Purch Price Change";

        exit(ChangeAllowed)
    end;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="PurchLine"></param>
    /// <returns></returns>
    procedure IsDirectUnitCostChangeAllowedForLine(var PurchLine: Record "Purchase Line"): Boolean
    var
        AllowDierctUnitCostChange: Boolean;
        PurchaseHeader: Record "Purchase Header";
    begin
        AllowDierctUnitCostChange := true;
        if PurchaseHeader.Get(PurchLine."Document Type", PurchLine."Document No.") then
            if PurchaseHeader."AME Purch. Order Type" = PurchaseHeader."AME Purch. Order Type"::Trading then
                AllowDierctUnitCostChange := PurchDirectUnitCostChangeAllowed();
        exit(AllowDierctUnitCostChange);
    end;

    procedure CanShowCostToUser(): Boolean;
    var
        UserSetup: Record "User Setup";
        ShowCost: Boolean;
    begin

        ShowCost := false;
        if UserSetup.Get(UserId) then
            ShowCost := UserSetup."ATOS Show Cost";

        exit(ShowCost);
    end;

    procedure IsUnitPriceChangeAllowedForLine(var SalesLine: Record "Sales Line"): Boolean
    var
        AllowUnitPriceChange: Boolean;
        SalesHeader: Record "Sales Header";
    begin
        AllowUnitPriceChange := true;
        if SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.") then
            if SalesLine."AME Prod. Posting Type" in [SalesLine."AME Prod. Posting Type"::FOC, SalesLine."AME Prod. Posting Type"::POS] then
                AllowUnitPriceChange := true
            else
                if SalesLine.Type = SalesLine.Type::Item then begin
                    AllowUnitPriceChange := SalesUnitPriceChangeAllowed();
                end;
        exit(AllowUnitPriceChange);
    end;
    //For Sales Documents
    procedure SalesUnitPriceChangeAllowed(): Boolean
    var
        UserSetup: Record "User Setup";
        ChangeAllowed: Boolean;
    begin
        ChangeAllowed := false;
        if UserSetup.Get(UserId) then
            ChangeAllowed := UserSetup."AME Allow Sales Price Change";
        exit(ChangeAllowed)
    end;

    procedure GetCountryName(CountryCode: Code[10]): Text[50]
    var
        Country: Record "Country/Region";
    begin
        if Country.Get(CountryCode) then
            exit(Country.Name);

        exit('');
    end;

    procedure UpdateCountryOfOriginList(CountryCode: Code[10]; var CountryName: Text; var CooList: Text)
    begin
        CountryName := GetCountryName(CountryCode);

        if CountryName <> '' then
            if StrPos(CooList, CountryName) = 0 then begin
                if CooList <> '' then
                    CooList += ', ';
                CooList += CountryName;
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnValidateVendorNoOnBeforeGetDirectCost', '', false, false)]
    local procedure OnValidateVendorNoOnBeforeGetDirectCost(var RequisitionLine: Record "Requisition Line"; xRequisitionLine: Record "Requisition Line"; CurrentFieldNo: Integer)
    var
        PurchPayableSetup: Record "Purchases & Payables Setup";
        SalesOrder: Record "Sales Header";
    begin
        if PurchPayableSetup.Get() then
            if (RequisitionLine."Demand Type" = 37) AND (RequisitionLine."Demand Subtype" = RequisitionLine."Demand Subtype"::"1") and (RequisitionLine."Demand Order No." <> '') then begin
                if SalesOrder.Get(SalesOrder."Document Type"::Order, RequisitionLine."Demand Order No.") then begin
                    if SalesOrder."AME Purch. Currency Code" <> '' then
                        RequisitionLine.Validate("Currency Code", SalesOrder."AME Purch. Currency Code");

                    if PurchPayableSetup."AME Default IC Vendor No." <> '' then
                        RequisitionLine.Validate("Vendor No.", PurchPayableSetup."AME Default IC Vendor No.");

                end;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reservation Management", 'OnBeforeDeleteItemTrackingConfirm', '', false, false)]
    local procedure OnBeforeDeleteItemTrackingConfirm(var CalcReservEntry2: Record "Reservation Entry"; var IsHandled: Boolean; var Result: Boolean)
    var
        InvSetup: Record "Inventory Setup";
    begin
        if IsHandled then
            exit;
        if not InvSetup.Get() then
            exit;

        if InvSetup."AME Skip Del ItemTrack Confirm" then begin
            IsHandled := true;
            Result := true;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeCheckShipmentDateBeforeWorkDate', '', false, false)]
    local procedure OnBeforeCheckShipmentDateBeforeWorkDate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; var HasBeenShown: Boolean; var IsHandled: Boolean)
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
    begin
        if SalesRecSetup.Get() then
            if SalesRecSetup."AME Skip Ship Before WrkDate" then
                IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeUpdateReplenishmentSystem', '', true, true)]
    local procedure OnBeforeUpdateReplenishmentSystem(var Item: Record Item; var IsHandled: Boolean; var Result: Boolean)
    begin
        item.SetStatusSkipCheck(true);
    end;
}

