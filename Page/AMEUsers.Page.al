page 52101 "AME Users"
{
    ApplicationArea = All;
    Caption = 'Users Status Update';
    PageType = List;
    SourceTable = User;
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User Security ID"; Rec."User Security ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies an ID that uniquely identifies the user. This value is generated automatically and should not be changed.';
                    Visible = false;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Name';
                    ToolTip = 'Specifies the user''s name. If the user is required to present credentials when starting the client, this is the name that the user must present.';

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Full Name';

                    ToolTip = 'Specifies the full name of the user.';
                }
                field(State; Rec.State)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Status';
                    ToolTip = 'Specifies whether the user can access companies in the current environment.';
                    Editable = true;
                }
                field("Windows Security ID"; Rec."Windows Security ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Windows Security ID of the user. This is only relevant for Windows authentication.';
                    Visible = false;
                }

                field("License Type"; Rec."License Type")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'License Type';
                    ToolTip = 'Specifies the type of license that applies to the user. For more information, see License Types.';
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the Microsoft account that this user signs into Microsoft 365 or SharePoint Online with.';
                }
            }

        }

    }

    actions
    {
        area(Processing)
        {
            action(Action)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Enabled';
                trigger OnAction()
                var
                    Users: Record User;
                begin
                    CurrPage.SetSelectionFilter(Users);
                    if Users.FindSet() then begin
                        repeat
                            if Users.State = Users.State::Disabled then begin
                                Users.Validate(State, Users.State::Enabled);
                                Users.Modify()
                            end;
                        until Users.Next() = 0;
                    end;
                end;
            }
            action(Action1)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Disabled';
                trigger OnAction()
                var
                    Users: Record User;
                    UserSetup: Record "User Setup";
                begin
                    CurrPage.SetSelectionFilter(Users);
                    if Users.FindSet() then begin
                        repeat
                            UserSetup.Get(Users."User Name");
                            if Not (UserSetup."AME Always Active") then begin
                                if Users.State = Users.State::Enabled then
                                    Users.Validate(State, Users.State::Disabled);
                                Users.Modify()
                            end;
                        until Users.Next() = 0;
                    end;
                end;
            }
        }
    }

}
