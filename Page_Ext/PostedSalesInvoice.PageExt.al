pageextension 52142 "AME Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("No.")
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
            }

        }
        addafter("Salesperson Code")
        {
            field("AME Bill of Exit Date"; Rec."AME Bill of Exit Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit Date field.';
            }
            field("AME Bill of Exit No."; Rec."AME Bill of Exit No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit No. field.';
            }
            field("AME Chamber Charges"; Rec."AME Chamber Charges")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Chamber Charges field.';
            }
        }
    }


    actions
    {
        addlast("&Invoice")
        {
            action(AMECreateFOCPOSEntries)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ReverseRevenueMgt: Codeunit ReverseRevenueMgmt;
                begin
                    ReverseRevenueMgt.CheckAndCreateFOCAndPOSReversalEntries(Rec."No.", false);
                end;
            }
        }
    }
}
