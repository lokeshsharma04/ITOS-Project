tableextension 52104 "AME Lot NoInformation " extends "Lot No. Information"
{
    fields
    {
        field(52100; "Mfg. Date"; Date)
        {
            Caption = 'Mfg. Date';
            DataClassification = CustomerContent;
        }
        field(52101; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date ';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52102; "Country of Origin"; code[50])
        {
            Caption = 'Country of Origin';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(52103; "BOE Date"; Date)
        {
            Caption = 'BOE Date';
            DataClassification = CustomerContent;
        }
        field(52104; "BE No."; Text[50])
        {
            Caption = 'BE No.';
            DataClassification = CustomerContent;
        }
        modify("Lot No.")
        {
            trigger OnAfterValidate()
            var
                DesVar: Text;
            BEGIN
                // Description := Rec."Lot No.";
                if Description = '' then
                    Description := "Lot No.";
            END;
        }
    }

    procedure GetLotNoForPrint(): Text[100]
    begin
        if Description <> '' then
            exit(Description)
        else
            exit("Lot No.");
    end;
}
