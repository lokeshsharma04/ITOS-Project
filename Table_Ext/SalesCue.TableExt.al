tableextension 52166 "AME Sales Cue" extends "Sales Cue"
{
    fields
    {
        // Add changes to table fields her
        field(52102; "AME Pending Collection"; Decimal)
        {
            Caption = 'Pending Collection';
            FieldClass = FlowField;
            CalcFormula = sum("Gen. Journal Line"."Amount (LCY)" where("Journal Template Name" = const('CASHRCPT'), "Account Type" = const(Customer)
            //  "ItosSW Collected" = const(false)
             ));
        }

        field(52106; "AME FilterNotTransit"; Date)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowFilter;
        }

        field(52112; "AME Collection Bal. (LCY)"; Decimal)
        {
            Caption = 'Collection Bal. (LCY)';
            FieldClass = FlowField;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where("Bank Account No." = field("AME Collection Bank Filter")));
        }
        field(52113; "AME Collection Bank Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(52115; "AME Driver Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(52117; "AME Collect. Acc.Type Fltr"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(52118; "AME Post-Pending Deposit"; Decimal)
        {
            Caption = 'Post-Pending Deposit';
            FieldClass = FlowField;
            CalcFormula = sum("Gen. Journal Line"."Amount (LCY)" where("Bal. Account No." = field("AME Collection Bank Filter"), "Bal. Account Type" = field("AME Collect. Acc.Type Fltr"), "Journal Template Name" = field("AME Dpst Jnl Template Fltr"), "Journal Batch Name" = field("AME Dpst Jnl Batch Filter")));
        }
        field(52119; "AME Dpst Jnl Template Fltr"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(52120; "AME Dpst Jnl Batch Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }


        field(52121; "AME Open Receipts"; Integer)
        {
            Caption = 'Open Receipts';
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Document Type" = const(Payment), Open = const(true), "Salesperson Code" = field("AME Salesperson Code Filter")
            //  "IBU Entry" = const(false)
             ));
        }
        field(52122; "AME Sales Quotes-PndgApprvl"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Quote),
                                                      Status = FILTER("Pending Approval"),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Quotes - Pending for Approval';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52123; "AME Sales Orders - Released"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER(Released),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Orders - Released';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52124; "AME Sales Orders-PndgApprvl"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER("Pending Approval"),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Quotes - Pending for Approval';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52125; "AME Not Invoiced"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "Completely Shipped" = FILTER(true),
                                                      Invoice = FILTER(false),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Shipped, Not Invoiced';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52126; "AME Partially Invoiced"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "Completely Shipped" = FILTER(true),
                                                      Invoice = FILTER(true),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Partially Invoiced';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52127; "AME Purchase Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52128; "AME Purch. Orders-Released"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Released),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Orders - Released';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52129; "AME Purch.Order Pndg Apprvl"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER("Pending Approval"),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Order - Pending Approval';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52130; "AME Not Invoiced Purchase"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Line" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(false),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Not Invoiced';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52131; "AME Partially Inv. Purch."; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(true),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Partially Invoiced';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52133; "AME Purchase Cr. Memos-Open"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Purchase Credit Memos - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52134; "AME Month Sales"; Decimal)
        {
            CalcFormula = Sum("Cust. Ledger Entry"."Sales (LCY)" WHERE("Posting Date" = FIELD("Date Filter"),
                                                                        "Salesperson Code" = FIELD("AME Salesperson Filter")));
            Description = 'ITOS';
            Caption = 'Month Sales';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52135; "AME Cust. Recon. Due"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Customer Reconcilation Due';
            CalcFormula = count(Customer where(
            // "ITOS Last Reconciliation Date" = field("AME Recon. Date Filter"),
            "Salesperson Code" = FIELD("AME Salesperson Filter")
            // "ItosSW Team" = field("AME Team Filter")
            ));
        }
        field(52136; "AME Recon. Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }


        field(52140; "AME Open Opportunities"; Integer)
        {
            Caption = 'Open Opportunities';
            FieldClass = FlowField;
            CalcFormula = Count(Opportunity WHERE(Closed = FILTER(false)));
        }
        field(52141; "AME Closed Opportunities"; Integer)
        {
            Caption = 'Closed Opportunities';
            FieldClass = FlowField;
            CalcFormula = Count(Opportunity WHERE(Closed = FILTER(true)));
        }
        field(52142; "AME Opportunities Due"; Integer)
        {
            Caption = 'Opportunities Due in 7 Days';
            FieldClass = FlowField;
            CalcFormula = Count("Opportunity Entry" WHERE(Active = FILTER(true), "Date Closed" = FILTER(''), "Estimated Close Date" = FIELD("AME Oppo. Due Date Filter")));
        }
        field(52143; "AME Oppo. Due Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Opportunity Due Date Filter';
        }
        field(52144; "AME Salesperson Filter"; Code[20])
        {
            Description = 'ITOS';
            FieldClass = FlowFilter;
        }

        // field(52145; "AME Month Collection"; Decimal)
        // {
        //     CalcFormula = - Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Document Type" = FILTER(" " | Payment | Refund),
        //                                                                           "Entry Type" = CONST("Initial Entry"),
        //                                                                           "Posting Date" = FIELD("Date Filter")
        //                                                                         //   "ITOS Salesperson Code" = FIELD("AME Salesperson Filter")
        //                                                                         ));
        //     Description = 'ITOS';
        //     Caption = 'Month Collection';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }

        field(52146; "AME Inland Orders to Rcv"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         Status = FILTER(Released),
                                                         //  "AME Inland Transport" = const(true),
                                                         "Completely Received" = const(false),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Inland Purchase Orders to Receive';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52148; "AME Bank Acc Filter"; Code[20])
        {
            Caption = 'Bank Acc. Filter';
            FieldClass = FlowFilter;
        }

        field(52149; "AME Request to Approve"; Integer)
        {
            Caption = 'Request to Approve';
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"), Status = const(Open)));

        }

        field(52155; "AMESalesperson Month Sales"; Decimal)
        {
            CalcFormula = Sum("Cust. Ledger Entry"."Sales (LCY)" WHERE("Posting Date" = FIELD("Date Filter"),
                                                                        "Salesperson Code" = FIELD("AME Salesperson Code Filter")));
            Description = 'ITOS';
            Caption = 'Month Sales';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52156; "AMESalesperson Month Collc."; Decimal)
        {
            CalcFormula = - Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Document Type" = FILTER(" " | Payment | Refund),
                                                                                  "Entry Type" = CONST("Initial Entry"),
                                                                                  "Posting Date" = FIELD("Date Filter")
                                                                                  //   "ITOS Salesperson Code" = FIELD("AME Salesperson Code Filter")
                                                                                  ));
            Description = 'ITOS';
            Caption = 'Month Collection';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52159; "AME Salesperson Code Filter"; Code[20])
        {
            Description = 'ITOS';
            FieldClass = FlowFilter;
        }


        field(52160; "AME Negative Inventory"; Integer)
        {
            Caption = 'Negative Inventory';
            FieldClass = FlowField;
            CalcFormula = count(Item where(Inventory = filter(< 0)));
        }
        field(52170; "AME Picker Filter"; Code[20])
        {
            Caption = 'Picker Filter';
            FieldClass = FlowFilter;
        }
        field(52190; "AME Location Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Location Filter';
        }
        field(52191; "AME Transfer Orders"; Integer)
        {
            Caption = 'Transfer Orders';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header");
        }
        field(52192; "AME Transfer Order Shipment"; Integer)
        {
            Caption = 'Transfer Shipments';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("Transfer-from Code" = field("AME Location Filter"), "Has Shipped Lines" = const(false)));
        }
        field(52193; "AME Transfer Order Receipt"; Integer)
        {
            Caption = 'Transfer Receipts';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("Transfer-to Code" = field("AME Location Filter"), "Has Shipped Lines" = const(true)));
        }
        field(52199; "AME Team Filter"; Code[20])
        {
            Description = 'ITOS';
            FieldClass = FlowFilter;
        }

        field(52200; "AME Sales Quotes-Open"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Quote),
                                                      Status = FILTER(Open),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      //   "ItosSW Team" = field("AME Team Filter")
                                                      ));
            Caption = 'Sales Quotes - Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52210; "AME Sales Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER(Open),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      //   "ItosSW Team" = field("AME Team Filter")
                                                      ));
            Caption = 'Sales Orders - Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52220; "AME Sales Return Order-Open"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Return Order"),
                                                      Status = FILTER(Open),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      //   "ItosSW Team" = field("AME Team Filter")
                                                      ));
            Caption = 'Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52225; "AME Sales CrMemo-Open"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Credit Memo"),
                                                      Status = FILTER(Open),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      //   "ItosSW Team" = field("AME Team Filter")
                                                      ));
            Caption = 'Sales Cr. Memo - Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }

        //CP-05-01-2023- Van Sales Tile 

        field(52262; "AME VanSales Pmt. Filter"; Text[100])
        {
            Caption = 'Van Sales Payment Method Filter';
            FieldClass = FlowFilter;
        }
        field(52263; "AME Sales Quotes - Released"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Quote),
                                                      Status = FILTER(Released),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      //   "ItosSW Team" = field("AME Team Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Quotes - Released';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        //New Start
        field(52264; "AME SOStatus - Open"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "AME SO Status" = FILTER(0),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Order - Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52265; "AME SOStatus - OnHold"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "AME SO Status" = FILTER(1),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Order - On Hold';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52266; "AME SOStatus - Canceled"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "AME SO Status" = FILTER(3),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Order - Canceled';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52267; "AME SOStatus - Confirmed"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      "AME SO Status" = FILTER(2),
                                                      "Salesperson Code" = field("AME Salesperson Filter"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Sales Order - Confirmed';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52268; "AME Blanket SO-Open"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(4),
                                                      "Status" = FILTER(Open)));
            Caption = 'Blanket Sales Order - Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52269; "AME Blanket SO-Released"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(4),
                                                      "Status" = FILTER(Released)));
            Caption = 'Blanket Sales Order - Released';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52270; "AME Warehouse Shipment - Open"; Integer)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            CalcFormula = Count("Warehouse Shipment Header" WHERE("Status" = FILTER(Open)));
            Caption = 'Open Shipment';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52271; "AME Warehouse Shipment-Releas."; Integer)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            CalcFormula = Count("Warehouse Shipment Header" WHERE("Status" = FILTER(Released)));
            Caption = 'Released Shipment';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52272; "AME Sales Return Order-Relea."; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Return Order"),
                                                      Status = FILTER(Released),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      ));
            Caption = 'Released';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52273; "AME Sales Return Order-PendApp"; Integer)
        {
            AccessByPermission = TableData "Sales Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Return Order"),
                                                      Status = FILTER("Pending Approval"),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = field("AME Salesperson Filter")
                                                      ));
            Caption = 'Pending Approval';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52275; "AME Whse Ship. Pick-Open"; Integer)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            CalcFormula = Count("Warehouse Shipment Header" WHERE("Document Status" = FILTER(0)));
            Caption = 'Open';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52276; "AME Whse Ship. Partial-Picked"; Integer)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            CalcFormula = Count("Warehouse Shipment Header" WHERE("Document Status" = FILTER(1)));
            Caption = 'Partially Picked';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52277; "AME Whse Ship. Complete-Picked"; Integer)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            CalcFormula = Count("Warehouse Shipment Header" WHERE("Document Status" = FILTER(3)));
            Caption = 'Completely Picked';
            Description = 'ITOS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52278; "AME Purch. Ret. Orders-Open"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Open),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52279; "AME Purch. Ret. Orders-Releas."; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER(Released),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52280; "AME Purch. Ret. Orders-PendApp"; Integer)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order"),
                                                         Status = FILTER("Pending Approval"),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Pending Approval';
            Editable = false;
            FieldClass = FlowField;
        }

        field(52281; "AME Whse. Ship. Status-Open"; Integer)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            CalcFormula = count("Warehouse Receipt Header" where("Shipment Status" = filter(0)));
            Caption = 'Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52282; "AME Whse. Ship Status-GIT Conf"; Integer)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            CalcFormula = count("Warehouse Receipt Header" where("Shipment Status" = filter(20)));
            Caption = 'GIT Confirmed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52283; "AME Whse. Ship Status-GRN Conf"; Integer)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            CalcFormula = count("Warehouse Receipt Header" where("Shipment Status" = filter(30)));
            Caption = 'GRN Confirmed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52284; "AME Whse. Ship Status-LCP"; Integer)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            CalcFormula = count("Warehouse Receipt Header" where("Shipment Status" = filter(40)));
            Caption = 'Landed Cost Completed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52285; "AME Whse. Ship Status-Pstd"; Integer)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            CalcFormula = count("Warehouse Receipt Header" where("Shipment Status" = filter(50)));
            Caption = 'Posted';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52290; "AME Qty in Adjustment"; Decimal)
        {
            AccessByPermission = TableData "Warehouse Entry" = R;
            CalcFormula = sum("Warehouse Entry"."Qty. (Base)" where("Bin Code" = field("AME Adj. Bin Filter")));
            Caption = 'Qty in Adjustment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52291; "AME Adj. Bin Filter"; Text[250])
        {
            Caption = 'Adj. Bin Filter';
            Editable = false;
            FieldClass = FlowFilter;

        }

        //New End;
    }
}