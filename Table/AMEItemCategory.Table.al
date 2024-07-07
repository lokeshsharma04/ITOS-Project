table 52101 "AME Item Category"
{
    Caption = 'Category';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "AME Category Level"; Enum "AME Item Category Type")
        {
            Caption = 'Category Level';
        }
        field(2; "AME Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(3; "AME Description"; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "AME Category Level", "AME Code")
        {
            Clustered = true;
        }
    }
}
