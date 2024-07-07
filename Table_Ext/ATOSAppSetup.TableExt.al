tableextension 52163 "AME ATOS App Setup" extends "ATOS App Setup"
{
    fields
    {
        field(52100; "AME Allowed Extension"; Text[100])
        {
            Caption = 'Allowed Extension';
            DataClassification = CustomerContent;
        }
        field(52101; "AME Max. File Size (KB)"; Integer)
        {
            Caption = 'Max. File Size (KB)';
            DataClassification = CustomerContent;
        }
    }
}
