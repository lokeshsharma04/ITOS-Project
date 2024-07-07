pageextension 52220 "AME Workflow Categories" extends "Workflow Categories"
{
    layout
    {
        addlast(Group)
        {
            field("AME Allow Selct. for App. Flow"; Rec."AME Allow Selct. for App. Flow")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Selection for Approval Flow field.';
            }
        }
    }
}
