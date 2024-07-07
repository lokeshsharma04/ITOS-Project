pageextension 52157 "AME Change Exchange Rate" extends "Change Exchange Rate"
{
    layout
    {
        modify(RefExchRate)
        {
            trigger OnBeforeValidate()
            var
                UserSetup: Record "User Setup";
            BEGIN
                IF UserSetup.Get(UserId) then
                    if UserSetup."AME Update Exch. Rate on Tarns." = false then begin
                        UserSetup.TestField("AME Update Exch. Rate on Tarns.", true);
                    end;
            end;

        }

    }
}
