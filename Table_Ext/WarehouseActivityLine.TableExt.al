tableextension 52121 "AME Warehouse Activity Line" extends "Warehouse Activity Line"
{
    fields
    {
        field(52100; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
        }
        field(52101; "AME Comments"; Text[250])
        {
            Caption = 'Comments';
            DataClassification = CustomerContent;
        }
        field(52110; "AME Assembly Order No."; Code[20])
        {
            Caption = 'Assembly Order No.';
            DataClassification = CustomerContent;
            TableRelation = "Assembly Header"."No.";
        }
        field(52125; "AME Item Category 1"; Code[30])
        {
            Caption = 'Areen Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 1" where("No." = field("Item No.")));
        }
        field(52126; "AME Item Category 2"; Code[30])
        {
            Caption = 'Areen Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 2" where("No." = field("Item No.")));
        }
        field(52127; "AME Item Category 3"; Code[30])
        {
            Caption = 'Areen Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 3" where("No." = field("Item No.")));
        }
        field(52128; "AME Item Category 4"; Code[30])
        {
            Caption = 'Areen Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 4" where("No." = field("Item No.")));
        }
        field(52129; "AME Item Category 5"; Code[30])
        {
            Caption = 'Pigeon Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 5" where("No." = field("Item No.")));
        }
        field(52130; "AME Item Category 6"; Code[30])
        {
            Caption = 'Pigeon Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 6" where("No." = field("Item No.")));
        }
        field(52131; "AME Item Category 7"; Code[30])
        {
            Caption = 'Pigeon Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 7" where("No." = field("Item No.")));
        }
        field(52132; "AME Item Category 8"; Code[30])
        {
            Caption = 'Pigeon Sub Category 3';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 8" where("No." = field("Item No.")));
        }
        field(52133; "AME Item Category 9"; Code[30])
        {
            Caption = 'Pigeon Sub Category 4';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 9" where("No." = field("Item No.")));
        }
        field(52134; "AME Item Category 10"; Code[30])
        {
            Caption = 'Pigeon Sub Category 5';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 10" where("No." = field("Item No.")));
        }
        field(52135; "AME Item Category 11"; Code[30])
        {
            Caption = 'Marketing Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 11" where("No." = field("Item No.")));
        }
        field(52136; "AME Item Category 12"; Code[30])
        {
            Caption = 'Marketing Sub Category 1';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 12" where("No." = field("Item No.")));
        }
        field(52137; "AME Item Category 13"; Code[30])
        {
            Caption = 'Marketing Sub Category 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AME Item Category 13" where("No." = field("Item No.")));
        }
        field(52150; "AME Mfg. Date"; Date)
        {
            Caption = 'Manufacturing Date';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Lot No. Information"."Mfg. Date" where("Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.")));
        }
        field(52151; "AME Country of Origin"; Code[50])
        {
            Caption = 'Country of Origin';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Lot No. Information"."Country of Origin" where("Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.")));
        }
        field(52152; "AME BE No."; Text[50])
        {
            Caption = 'BE No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Lot No. Information"."BE No." where("Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.")));
        }
        field(52153; "AME BOE Date"; Date)
        {
            Caption = 'BOE Date';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Lot No. Information"."BOE Date" where("Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.")));
        }
        field(52154; "AME Lot Description"; Text[100])
        {
            Caption = 'Lot Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Lot No. Information".Description where("Item No." = field("Item No."), "Variant Code" = field("Variant Code"), "Lot No." = field("Lot No.")));
        }
        field(52160; "AME Worksheet Template Name"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Worksheet Template Name';
        }

    }
}
