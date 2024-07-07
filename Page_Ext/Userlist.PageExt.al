pageextension 52159 "AME User list" extends Users
{
    actions
    {
        addlast(Reporting)
        {
            action("AME Enable/Disable Users - Rep")
            {
                ApplicationArea = All;
                Caption = 'Enable/Disable Users-Report';
                Image = Print;

                trigger OnAction()
                var
                    EnableDisableUsers: Report "AME Enable/Disable Users - Rep";
                begin
                    EnableDisableUsers.Run();
                end;
            }
        }

    }
}
