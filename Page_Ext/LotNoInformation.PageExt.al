pageextension 52102 "AME Lot No.Information " extends "Lot No. Information Card"
{
    layout
    {
        addafter("Test Quality")
        {
            field("AME Mfg. Date"; Rec."Mfg. Date")
            {
                ApplicationArea = All;
            }
            field("AME Country of Origin"; Rec."Country of Origin")
            {
                ApplicationArea = All;
            }
            field("AME Expiry Date"; Rec."Expiry Date")
            {
                ApplicationArea = All;
            }

            field("AME BOE Date"; Rec."BOE Date")
            {
                ApplicationArea = All;
            }
            field("BE No."; Rec."BE No.")
            {
                ApplicationArea = all;
            }
        }
    }

    trigger OnNewRecord(BelowxRecord: Boolean)
    var
        myInt: Integer;
    begin
        if rec.GetFilter("BE No.") <> '' then
            rec."BE No." := Rec.GetFilter("BE No.");
    end;
}

