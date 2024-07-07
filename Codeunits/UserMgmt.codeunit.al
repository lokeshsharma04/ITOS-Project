codeunit 52119 "User Mgmt."
{
    [EventSubscriber(ObjectType::Table, database::User, OnBeforeValidateEvent, State, false, false)]
    local procedure OnBeforeValidateEvent(CurrFieldNo: Integer; var Rec: Record User; var xRec: Record User)
    var
        UserSetup: Record "User Setup";
    begin
        if CurrFieldNo <> Rec.FieldNo(State) then
            exit;
        UserSetup.Get(Rec."User Name");
        if Rec.State = Rec.State::Disabled then
            if (UserSetup."AME Always Active") then begin
                Error('Status for the User %1 cannot be updated to %2. Please check user setup record for the user. ', rec."User Name", Rec.State);
            end;
    end;
}