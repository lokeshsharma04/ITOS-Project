pageextension 52168 "AME Posted Purchase Receipt." extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ShowMandatory = true;
                ApplicationArea = ALL;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("AME Description"; Rec."AME Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }
    actions
    {
        addafter("&Receipt")
        {
            action("Create Warehouse Jnl Line")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    AdjEntriesOnRcpt: Codeunit "AME Adj. Entries On Receipt";
                begin
                    AdjEntriesOnRcpt.InsertWhseJnlLineforAdjRcptEntries(Rec."No.");
                end;
            }
        }
    }
}
