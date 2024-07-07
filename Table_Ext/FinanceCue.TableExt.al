tableextension 52164 "AME Finance Cue" extends "Finance Cue"
{
    fields
    {
        // field(52140; "AME Request to Approve"; Integer)
        // {
        //     Caption = 'Request to Approve';
        //     FieldClass = FlowField;
        //     CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"), Status = const(Open)));

        // }
        field(52100; "AME Not Invoiced Purchase"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Line" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        "Amt. Rcd. Not Invoiced (LCY)" = filter(> 0),
                                                         Invoice = FILTER(false)));
            Caption = 'Not Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52101; "AME Partially Invoiced Purchas"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(true)));
            Caption = 'Partially Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52110; "AME Invoices-Open"; Integer)
        {
            Caption = 'Invocies - Open';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice), Status = const(Open)));
        }
        field(52111; "AME Invoices-Released"; Integer)
        {
            Caption = 'Invocies - Released';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Invoice), Status = const(Released)));
        }

        field(52112; "AME Purch Cr. Memos - Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Released)));
            Caption = 'Purchase Credit Memo - Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52113; "AME Purch. Return O-Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Released)));
            Caption = 'Purchase Return Order - Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52114; "AME Purchase Cr. Memos - Open"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Open)));
            Caption = 'Purchase Credit Memos - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52115; "AME PDC Rcv. Batch Filter"; Code[20])
        {
            Caption = 'PDC Rcv. Batch Filter';
            FieldClass = FlowFilter;
        }
        field(52116; "AME PDC Rcv Template Filter"; Code[20])
        {
            Caption = 'PDC Rcv. Template Filter';
            FieldClass = FlowFilter;
        }
        field(52117; "AME PDC Receivable Total"; Decimal)
        {
            Caption = 'PDC Receivable Total';
            FieldClass = FlowField;
            CalcFormula = - sum("Gen. Journal Line"."Amount (LCY)" where("Journal Batch Name" = field("AME PDC Rcv. Batch Filter"), "Journal Template Name" = field("AME PDC Rcv Template Filter")));
        }
        field(52118; "AME PDC Payble Batch Filter"; Code[20])
        {
            Caption = 'PDC Payable Batch Filter';
            FieldClass = FlowFilter;
        }
        field(52119; "AME PDCPayble Template Fltr"; Code[20])
        {
            Caption = 'PDC Payable Template Filter';
            FieldClass = FlowFilter;
        }
        field(52120; "AME PDC Payble Total"; Decimal)
        {
            Caption = 'PDC Payble Total';
            FieldClass = FlowField;
            CalcFormula = sum("Gen. Journal Line"."Amount (LCY)" where("Journal Batch Name" = field("AME PDC Payble Batch Filter"), "Journal Template Name" = field("AME PDCPayble Template Fltr")));
        }
        field(52121; "AME Open Receipts"; Integer)
        {
            Caption = 'Open Receipts';
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Document Type" = const(Payment), Open = const(true)
            // , "IBU Entry" = const(false)
            ));
        }
        field(52122; "AME Open Payments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Vendor Ledger Entry" where("Document Type" = const(Payment), Open = const(true)
            // , "IBU Entry" = const(false)
            ));
        }

        field(52129; "AME Overdue PDC DateFilter"; Date)
        {
            Caption = 'OverduePDCRecvDateFiltr';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(52130; "AME Overdue PDC Recv. Total"; Decimal)
        {
            Caption = 'Overdue PDC Receivable Total';
            FieldClass = FlowField;
            CalcFormula = - sum("Gen. Journal Line"."Amount (LCY)" where("Journal Batch Name" = field("AME PDC Rcv. Batch Filter"), "Journal Template Name" = field("AME PDC Rcv Template Filter"), "ATOS Cheque Date" = field("AME Overdue PDC DateFilter")));
        }
        field(52131; "AME Overdue PDC Pay. Total"; Decimal)
        {
            Caption = 'Overdue PDC Payables Total';
            FieldClass = FlowField;
            CalcFormula = sum("Gen. Journal Line"."Amount (LCY)" where("Journal Batch Name" = field("AME PDC Payble Batch Filter"), "Journal Template Name" = field("AME PDCPayble Template Fltr"), "ATOS Cheque Date" = field("AME Overdue PDC DateFilter")));
        }
        // field(52141; "AME PostedSalesInvAttachReq"; Integer)
        // {
        //     Caption = 'Sales Inv. Attach. Required';
        //     FieldClass = FlowField;
        //     CalcFormula = count("Sales Invoice Header" where("Order No." = const(''), "AME Attached Documents" = const(0)));
        // }
        // field(52142; "AME PostedPurchInvAttachReq"; Integer)
        // {
        //     Caption = 'Purch. Inv. Attach. Required';
        //     FieldClass = FlowField;
        //     CalcFormula = count("Purch. Inv. Header" where("Order No." = const(''), "AME Attached Documents" = const(0)));
        // }
        field(52150; "AME Location Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Location Filter';
        }
        field(52151; "AME Transfer Orders"; Integer)
        {
            Caption = 'Transfer Orders';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header");
        }
        field(52152; "AME Transfer Order Shipment"; Integer)
        {
            Caption = 'Transfer Order Shipments';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("Transfer-from Code" = field("AME Location Filter")));
        }
        field(52153; "AME Transfer Order Receipt"; Integer)
        {
            Caption = 'Transfer Order Receipts';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("Transfer-to Code" = field("AME Location Filter")));
        }
        field(52170; "AME Purchase Orders"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order)));
            Caption = 'Purchase Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52171; "AME Purchase Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Open)));
            Caption = 'Purchase Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52172; "AME Inland Purch. O-Released"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Released)
                                                         //  "AME Inland Transport" = const(true)
                                                         ));
            Caption = 'Inland Purchase Orders - Released';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52173; "AME Purchase Invocies"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Invoice)));
            Caption = 'Purchase Invoices';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52180; "AME Exp. Rcpt Date Filter"; Date)
        {
            Caption = 'Expected Receipt Date Filter';
            FieldClass = FlowFilter;
        }
        field(52181; "AME Expected By Rcpt Date"; Integer)
        {
            Caption = 'Expected By Rcpt Date';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Line" where("Document Type" = const(Order), "Expected Receipt Date" = field("AME Exp. Rcpt Date Filter")));
        }

    }

    var
        myInt: Integer;
}