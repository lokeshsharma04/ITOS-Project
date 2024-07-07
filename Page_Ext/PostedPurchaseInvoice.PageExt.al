pageextension 52198 "AME Posted Purchase Invoice" extends "Posted Purchase Invoice"
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
        addafter("Responsibility Center")
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
