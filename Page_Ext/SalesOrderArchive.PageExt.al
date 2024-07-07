pageextension 52119 "AME Sales Order Archive" extends "Sales Order Archive"
{
    layout
    {
        addafter(Status)
        {
            field("SO Status"; Rec."AME SO Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the SO Status field.';
            }
        }
        addafter("Order Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Price Date field.';
            }
        }
    }

}
