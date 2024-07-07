tableextension 52111 "AME Posted Whse.Receipt Line" extends "Posted Whse. Receipt Line"
{
    fields
    {
        field(52100; Invoice_Qty; Decimal)
        {
            Caption = 'Invoice_Qty';
            DataClassification = CustomerContent;
        }
        field(52101; "Actual Qty"; Decimal)//SP18122023
        {
            Caption = 'Actual Qty';
            DataClassification = CustomerContent;
        }
        field(52102; "Actual Qty (Base)"; Decimal)//SP18122023
        {
            Caption = 'Actual Qty (Base)';
            DataClassification = CustomerContent;
        }
        field(52103; "Excess Qty"; Decimal)//SP18122023
        {
            Caption = 'Excess Qty';
            DataClassification = CustomerContent;
        }
        field(52104; "Excess Qty (Base)"; Decimal)//SP18122023
        {
            Caption = 'Excess Qty (Base)';
            DataClassification = CustomerContent;
        }
        field(52105; "Short Qty"; Decimal)//SP18122023
        {
            Caption = 'Short Qty';
            DataClassification = CustomerContent;
        }
        field(52106; "Short Qty (Base)"; Decimal)//SP18122023
        {
            Caption = 'Short Qty (Base)';
            DataClassification = CustomerContent;
        }
        field(52107; "Damaged Qty"; Decimal)//SP18122023
        {
            Caption = 'Damaged Qty';
            DataClassification = CustomerContent;
        }
        field(52108; "Damaged Qty (Base)"; Decimal)//SP18122023
        {
            Caption = 'Damaged Qty (Base)';
            DataClassification = CustomerContent;
        }
        field(52109; "Currency Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(52110; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52111; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(52112; "Line Amount (LCY)"; Decimal)
        {
            Caption = 'Line Amount (LCY)';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52113; "Landed Cost %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(52114; "Landed Cost Amt."; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(52115; "AME Remarks"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Remarks';
        }
        field(52120; "AME Shipment Status"; Enum "Whse. Receipt Ship Status")
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Warehouse Receipt Header"."Shipment Status" where("No." = field("No.")));
            Caption = 'Shipment Status';
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
    }
}
