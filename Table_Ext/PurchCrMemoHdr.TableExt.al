tableextension 52152 "AME Purch. Cr. Memo Hdr." extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(52100; "AME Price Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Price Date';
        }
        field(52102; "AME Purch. Order Type"; Enum "AME Purch. Order Type")
        {
            Caption = 'Purch. Order Type';
            DataClassification = CustomerContent;
        }
        field(52103; "AME Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(52104; "AME Workflow Category"; Code[20])
        {
            Caption = 'Workflow Category';
            TableRelation = "Workflow Category".Code where("AME Allow Selct. for App. Flow" = const(true));
            DataClassification = ToBeClassified;
        }
        field(52110; "AME Documents Attached"; Integer)
        {
            Caption = 'Documents Attached';
            FieldClass = FlowField;
            CalcFormula = count("Document Attachment" where("Table ID" = const(124), "No." = field("No.")));
        }
    }
}
