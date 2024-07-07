pageextension 52149 "AME User Setup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Auto Disable/Enable User"; Rec."AME Auto Disable/Enable User")
            {
                ApplicationArea = all;
            }
            field("Skip Auto Enable"; Rec."AME Skip Auto Enable")
            {
                ApplicationArea = all;
            }
            field("AME Skip Auto Disable"; Rec."AME Always Active")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Skip Auto Disable field.';
            }
            field("Last Auto Enabled DateTime"; Rec."AME Last Auto Enabled DateTime")
            {
                ApplicationArea = all;
            }
            field("Last Auto Disabled DateTime"; Rec."AME Last Auto Disabled DateTime")
            {
                ApplicationArea = all;
            }
            field("Update Exch. Rate on Tarns."; Rec."AME Update Exch. Rate on Tarns.")
            {
                ApplicationArea = all;
            }
            field("AME Allow Purch Price Change"; Rec."AME Allow Purch Price Change")
            {
                ApplicationArea = ALL;
            }
            field("AME Allow Sales Price Change"; Rec."AME Allow Sales Price Change")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Sales Price Change field.';
            }
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purch. Order Type field.';
            }
        }

    }
}
