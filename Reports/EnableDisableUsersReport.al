report 52117 "AME Enable/Disable Users - Rep"
{
    ApplicationArea = All;
    Caption = 'Enable/Disable Users-Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(User; User)
        {
            trigger OnAfterGetRecord()
            var
                User2: Record User;
            BEGIN

                if (Action = Action::Active) then begin
                    if UserSetup.Get(User."User Name") then begin
                        if UserSetup."AME Auto Disable/Enable User" and (not UserSetup."AME Skip Auto Enable") then begin
                            if User2.Get(User."User Security ID") then begin
                                User2.Validate(State, State::Enabled);
                                User2.Modify();

                                UserSetup.Validate("AME Last Auto Enabled DateTime", CurrentDateTime);
                                UserSetup.Modify();
                            end;
                        end;
                    end;

                end else
                    if (Action = Action::Inactive) then begin
                        if UserSetup.Get(User."User Name") then begin
                            if (UserSetup."AME Auto Disable/Enable User") and (Not UserSetup."AME Always Active") then begin
                                if User2.Get(User."User Security ID") then begin
                                    User2.Validate(State, State::Disabled);
                                    User2.Modify();

                                    UserSetup.Validate("AME Last Auto Disabled DateTime", CurrentDateTime);
                                    UserSetup.Modify();
                                end;
                            end;
                        end;
                    end

            END;



        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(option)
                {
                    field(Action; Action)
                    {
                        ApplicationArea = all;
                        OptionCaption = 'Active,Inactive';


                    }
                }
            }
        }

    }


    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if Action = Action::Active then
            user.SetRange(State, User.State::Disabled)
        else
            if Action = Action::Inactive then
                user.SetRange(State, User.State::Enabled)
    end;

    var
        Action: Option Active,Inactive;
        CurrentDateTime: DateTime;
        UserSetup: Record "User Setup";

}

