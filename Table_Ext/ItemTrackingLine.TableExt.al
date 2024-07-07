tableextension 52192 "AME Tracking Specification" extends "Tracking Specification"
{
    fields
    {
        field(52100; "AME BE No."; Text[50])
        {
            Caption = 'BE No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Lot No. Information"."BE No." where("Lot No." = field("Lot No."), "Item No." = field("Item No."), "Variant Code" = field("Variant Code")));
        }
        field(52101; "AME BOE Date"; Date)
        {
            Caption = 'BOE Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Lot No. Information"."BOE Date" where("Lot No." = field("Lot No."), "Item No." = field("Item No."), "Variant Code" = field("Variant Code")));
        }
        field(52102; "AME Mfg. Date"; Date)
        {
            Caption = 'Mfg. Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Lot No. Information"."Mfg. Date" where("Lot No." = field("Lot No."), "Item No." = field("Item No."), "Variant Code" = field("Variant Code")));
        }
        field(52104; "AME Country of Origin"; code[50])
        {
            Caption = 'Country of Origin';
            FieldClass = FlowField;
            CalcFormula = lookup("Lot No. Information"."Country of Origin" where("Lot No." = field("Lot No."), "Item No." = field("Item No."), "Variant Code" = field("Variant Code")));
        }
    }
}
