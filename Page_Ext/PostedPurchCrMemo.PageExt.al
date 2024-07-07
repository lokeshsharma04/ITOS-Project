pageextension 52200 "AME Posted Purch. Cr. Memo" extends "Posted Purchase Credit Memo"
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
        addlast(General)
        {
            field("AME Workflow Category"; Rec."AME Workflow Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Workflow Category field.';
            }
            field("AME Documents Attached"; Rec."AME Documents Attached")
            {
                ApplicationArea = All;
                DrillDownPageId = "Document Attachment Details";
            }
        }

    }
}
