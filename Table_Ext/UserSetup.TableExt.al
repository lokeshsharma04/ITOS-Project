tableextension 52150 "AME User Setup" extends "User Setup"
{
    fields
    {
        field(52100; "AME Auto Disable/Enable User"; Boolean)
        {
            Caption = 'Auto Disable/Enable Users';
            DataClassification = CustomerContent;
        }
        field(52101; "AME Skip Auto Enable"; Boolean)
        {
            Caption = 'Skip Auto Enable';
            DataClassification = CustomerContent;
        }
        field(52102; "AME Last Auto Disabled DateTime"; DateTime)
        {
            Caption = 'Last Auto Disabled DateTime';
            DataClassification = CustomerContent;
        }
        field(52103; "AME Last Auto Enabled DateTime"; DateTime)
        {
            Caption = 'Last Auto Enabled DateTime';
            DataClassification = CustomerContent;
        }
        field(52110; "AME Update Exch. Rate on Tarns."; Boolean)
        {
            Caption = 'Update Exch. Rate on Tarns.';
            DataClassification = CustomerContent;
        }
        field(52111; "AME Allow Purch Price Change"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Purchase Price Change';
        }
        field(52112; "AME Allow Sales Price Change"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Sales Price Change';
        }
        field(52113; "AME Purch. Order Type"; Enum "AME Purch. Order Type")
        {
            Caption = 'Purch. Order Type';
            DataClassification = CustomerContent;
        }
        field(52114; "AME Always Active"; Boolean)
        {
            Caption = 'Always Active';
            DataClassification = CustomerContent;
        }
    }
}
