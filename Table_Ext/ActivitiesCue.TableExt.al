tableextension 52142 "AME Activities Cue" extends "Activities Cue"
{
    fields
    {
        // Add changes to table fields here
        field(52170; "Purchase Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Open)));
            Caption = 'Purchase Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52171; "Purchase Orders - Released"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Released)
                                                         ));
            Caption = 'Purchase Orders - Released';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52172; "PurchaseOrder Pending Approval"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER("Pending Approval")
                                                         ));
            Caption = 'Purchase Order Pending Approval';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52173; "Not Invoiced Purchase"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Line" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                        "Amt. Rcd. Not Invoiced (LCY)" = filter(> 0),
                                                         Invoice = FILTER(false)
                                                         ));
            Caption = 'Not Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52174; "Partially Invoiced Purchase"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(true)
                                                         ));
            Caption = 'Partially Invoiced';
            Description = 'ATOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52175; "Purchase Return Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Open)
                                                         ));
            Caption = 'Purchase Return Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52176; "Purchase Credit Memos - Open"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Open)
                                                         ));
            Caption = 'Purchase Credit Memos - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        // field(52177; "Inland Purch. Orders-Released"; Integer)
        // {
        //     AccessByPermission = TableData "Purch. Rcpt. Header" = R;
        //     CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
        //                                                  Status = FILTER(Released)
        //                                                  //  "AME Inland Transport" = const(true)
        //                                                  ));
        //     Caption = 'Inland Purchase Orders - Released';
        //     Description = 'ATOS';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(52181; "Purchase Cr. Memos - Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Released)));
            Caption = 'Purchase Credit Memo - Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52182; "AME Purch. Return O-Released"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Released)));
            Caption = 'Purchase Return Order - Released';
            Editable = false;
            FieldClass = FlowField;
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
            Caption = 'Open Payments';
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
        field(52141; "AME PostedSalesInvAttachReq"; Integer)
        {
            Caption = 'Sales Inv. Attach. Required';
            FieldClass = FlowField;
            CalcFormula = count("Sales Invoice Header" where("Order No." = const('')
            // , "AME Attached Documents" = const(0)
            ));
        }
        field(52142; "AME PostedPurchInvAttachReq"; Integer)
        {
            Caption = 'Purch. Inv. Attach. Required';
            FieldClass = FlowField;
            CalcFormula = count("Purch. Inv. Header" where("Order No." = const('')
            // , "AME Attached Documents" = const(0)
            ));
        }

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

        // field(52160; "AME Phys. Inv. Count Due"; Integer)
        // {
        //     FieldClass = FlowField;
        //     Caption = 'Phys. Inv. Count Due';
        //     CalcFormula = count("Stockkeeping Unit" where("AtosSW Phy. Inv. Count Due" = const(true), Inventory = filter('>0')));
        // }

        field(52165; "AME Exp. Rcpt Date Filter"; Date)
        {
            Caption = 'Expected Receipt Date Filter';
            FieldClass = FlowFilter;
        }
        field(52166; "AME Expected By Rcpt Date"; Integer)
        {
            Caption = 'Expected By Rcpt Date';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Line" where("Document Type" = const(Order), "Expected Receipt Date" = field("AME Exp. Rcpt Date Filter")));
        }
        //CP-31-01-2023- Van Sales Tile 
        // field(60261; "AME COD Van Sales"; Integer)
        // {
        //     Caption = 'COD Van Sales';
        //     FieldClass = FlowField;
        //     CalcFormula = count("Sales Invoice Header" where("AtosSW Van Sales" = const(true), "Remaining Amount" = filter(> 0), "Payment Terms Code" = field("AME VanSales Pmt. Filter")));
        // }
        field(60262; "AME VanSales Pmt. Filter"; Text[100])
        {
            Caption = 'Van Sales Payment Method Filter';
            FieldClass = FlowFilter;
        }
        //CP-31-01-2023+

        field(52190; "Assembly Orders - Open"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Assembly Header" where(Status = const(Open)));
        }
        field(52191; "Assembly Orders - Released"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Assembly Header" where(Status = const(Open)));
        }
        field(52192; "Picked - Not Assembled"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Assembly Line" where(Type = const(Item), "Qty. Picked (Base)" = filter(> 0), "Remaining Quantity (Base)" = filter(<> 0)));
        }
    }

    var
        myInt: Integer;
}