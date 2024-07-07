page 52111 "AME Accountant Role Payable C."
{
    Caption = 'Accountant Payable', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control99; "Finance Performance")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1902304208; "AME Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Planning;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
            }
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Incoming Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents';
                Image = Documents;
                RunObject = Page "Incoming Documents";
                ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                Image = Invoice;
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Pending Journal Lines")
            {
                Caption = 'Pending Journal Lines';
                ApplicationArea = All;
                Image = Journal;
                RunObject = page "AME Gen Jnl Lines";
            }
        }
        area(sections)
        {
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.  ';
                action(PaymentJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(Action164)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Payment Recon. Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Recon. Journals';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from customer cards or sales documents to define when the customer must pay, such as within 14 days.';
                }
                action(BankAccountReconciliations)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Reconciliations';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Acc. Reconciliation List";
                    ToolTip = 'Reconcile bank accounts in your system with bank statements received from your bank.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'Open the list of issued reminders.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View auditing details for all general ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
            }
            group(SetupAndExtensions)
            {
                Visible = false;
                Caption = 'Setup & Extensions';
                Image = Setup;
                ToolTip = 'Overview and change system and application settings, and manage extensions and services';
                action("Assisted Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                }
                action("Service Connections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Connections';
                    Image = ServiceTasks;
                    RunObject = Page "Service Connections";
                    ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                }
                action(Extensions)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Extensions';
                    Image = NonStockItemSetup;
                    RunObject = Page "Extension Management";
                    ToolTip = 'Install Extensions for greater functionality of the system.';
                }
                action(Workflows)
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflows';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Workflows;
                    ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
                }
            }
        }
        area(creation)
        {
            action("P&urchase Credit Memo")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'P&urchase Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase credit memo so you can manage returned items to a vendor.';
            }
            action("Payment Journal Entry")
            {
                AccessByPermission = TableData "Gen. Journal Batch" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journal Entry';
                Image = TileNew;
                RunObject = Page "Payment Journal";
                ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
            }
        }
        area(processing)
        {
            group(History)
            {
                Caption = 'History';
                action("Navi&gate")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Navi&gate';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';
                }
            }
        }
    }
}

