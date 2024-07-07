codeunit 52103 "AME IC Sync Mgmt"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ITOS IC Sync Mgt.", OnAfterCreateSyncLogForItem, '', false, false)]
    local procedure OnAfterCreateSyncLogForItem(var ICSyncSetup: Record "ITOS IC Sync Setup"; var ItemRec: Record Item)
    begin
        CreateSyncLogForAMEItemCategory(ItemRec, ICSyncSetup);
    end;

    procedure CreateSyncLogForAMEItemCategory(ItemRec: Record Item; var ICSyncSetup: Record "ITOS IC Sync Setup")
    var
        AMECategoryLevel: Enum "AME Item Category Type";
    begin
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 1", ItemRec."AME Item Category 1", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 2", ItemRec."AME Item Category 2", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 3", ItemRec."AME Item Category 3", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 4", ItemRec."AME Item Category 4", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 5", ItemRec."AME Item Category 5", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 6", ItemRec."AME Item Category 6", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 7", ItemRec."AME Item Category 7", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 8", ItemRec."AME Item Category 8", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 9", ItemRec."AME Item Category 9", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 10", ItemRec."AME Item Category 10", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 11", ItemRec."AME Item Category 11", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 12", ItemRec."AME Item Category 12", ICSyncSetup);
        InsertSyncLogForAMEItemCategory(AMECategoryLevel::"Category 13", ItemRec."AME Item Category 13", ICSyncSetup);
    end;

    local procedure InsertSyncLogForAMEItemCategory(AMECategoryLevel: Enum "AME Item Category Type"; var Code: Code[20]; var ICSyncSetup: Record "ITOS IC Sync Setup")
    var
        AMEITemCategory: Record "AME Item Category";
        ICSyncLog: Record "ITOS IC Sync Entries";
    begin
        if Code = '' then
            exit;
        Clear(ICSyncLog);
        ICSyncLog.Init();
        ICSyncLog."ITOS Table No." := Database::"AME Item Category";
        ICSyncLog."ITOS Primary Key 1" := Format(AMECategoryLevel.AsInteger());
        ICSyncLog."ITOS Primary Key 2" := Code;
        ICSyncLog."ITOS Company Name" := ICSyncSetup."ITOS Company Name";
        ICSyncLog."ITOS Status" := ICSyncLog."ITOS Status"::Created;
        if not ICSyncLog.Insert(true) then
            Error(GetLastErrorText());

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ITOS IC Sync Mgt.", 'ProcessEntryForProcessSyncEntries', '', false, false)]
    local procedure ProcessEntryForProcessSyncEntries(var ICSyncLog2: Record "ITOS IC Sync Entries"; var IsHandled_2: Boolean)
    var
        IcSyncLog: Record "ITOS IC Sync Entries";
    begin
        if not IcSyncLog.Get(ICSyncLog2."ITOS Entry No.") then
            exit;
        case IcSyncLog."ITOS Table No." of
            Database::"AME Item Category":
                begin
                    TransferAMEItemCategory(IcSyncLog);
                    IsHandled_2 := true;
                end;
        end;
    end;

    local procedure TransferAMEItemCategory(ICSyncLog2: Record "ITOS IC Sync Entries")
    var
        AMEItemCategory: Record "AME Item Category";
        AMEItemCategoryLocal: Record "AME Item Category";
        AMECategoryType: Enum "AME Item Category Type";
    begin
        Evaluate(AMECategoryType, ICSyncLog2."ITOS Primary Key 1");
        AMEItemCategory.ChangeCompany(ICSyncLog2."ITOS Company Name");
        if AMEItemCategoryLocal.Get(AMECategoryType, ICSyncLog2."ITOS Primary Key 2") then begin
            if not AMEItemCategory.Get(AMEItemCategoryLocal."AME Category Level", AMEItemCategoryLocal."AME Code") then begin
                AMEItemCategory.Init();
                AMEItemCategory.TransferFields(AMEItemCategoryLocal);
                AMEItemCategory.Insert();
            end;
        end;
    end;

}
