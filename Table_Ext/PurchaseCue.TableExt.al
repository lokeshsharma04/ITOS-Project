tableextension 52165 "AME Purchase Cue" extends "Purchase Cue"
{
    fields
    {
        field(52170; "AME Purchase Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52171; "AME Purchase Orders - Released"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Released),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Orders - Released';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52172; "AME PO Pending Approval"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER("Pending Approval"),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Order Pending Approval';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52173; "AME Not Invoiced Purchase"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Line" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        "Amt. Rcd. Not Invoiced (LCY)" = filter(> 0),
                                                        "AME Purch. Order Type" = field("AME Purch. Order Type"),
                                                         Invoice = FILTER(false),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Not Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52174; "AME Partially Invoiced Purchas"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(true),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Partially Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52175; "AME Purchase Return O - Open"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Return Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52176; "AME Purchase Cr. Memos - Open"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Credit Memos - Open';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52178; "AME Request to Approve"; Integer)
        {
            Caption = 'Request to Approve';
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"), Status = const(Open)));

        }

        field(52179; "AME Invoices-Open"; Integer)
        {
            Caption = 'Invocies - Open';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice), Status = const(Open)));
        }
        field(52180; "AME Invoices-Released"; Integer)
        {
            Caption = 'Invocies - Released';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice), Status = const(Released)));
        }
        field(52181; "AME Purch Cr. Memos - Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Released),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Credit Memo - Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52182; "AME Purch. Return O Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Released),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Return Order - Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52183; "AME Purchase Order 2-Open"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        Status = filter(Open),
                                                         "AME Purch. Order Type" = field("AME Purch. Order Type"),
                                                         "Responsibility Center" = field("Responsibility Center Filter")));
            Caption = 'Open';
            Editable = false;
        }
        field(52184; "AME Purchase Order 2-Released"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        Status = filter(Released),
                                                         "AME Purch. Order Type" = field("AME Purch. Order Type"),
                                                         "Responsibility Center" = field("Responsibility Center Filter")));
            Caption = 'Released';
            Editable = false;
        }
        field(52185; "AME Purch. Order 2-Pending App"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        Status = filter("Pending Approval"),
                                                         "AME Purch. Order Type" = field("AME Purch. Order Type"),
                                                         "Responsibility Center" = field("Responsibility Center Filter")));
            Caption = 'Pending Approval';
            Editable = false;
        }
        field(52186; "AME Purch. Order Type"; Enum "AME Purch. Order Type")
        {
            Caption = 'Purch. Order Type';
            FieldClass = FlowFilter;
        }
        field(52130; "AME Purch Received Not Invoic."; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Line" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Invoice = FILTER(false),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Received Not Invoiced';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}