pageextension 52130 "AME Warehouse Receipts" extends "Warehouse ReceiptS"
{
    layout
    {
        addafter("Document Status")
        {
            field("BOE No."; Rec."BOE No.")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("BOE Date"; Rec."BOE Date")
            {
                ApplicationArea = ALL;
                Visible = false;
            }
            field("Supp_Invoice_No"; Rec.Supp_Invoice_No)
            {
                Caption = 'Supp Invoice No';
                ApplicationArea = All;
                Visible = false;
            }
            field("Supp_Invoice_Date"; Rec.Supp_Invoice_Date)
            {
                Caption = 'Supp Invoice Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Transport Method"; Rec."AME Transport Method")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Shipment Status"; Rec."Shipment Status")
            {
                ApplicationArea = All;
            }

        }
        addafter("Posting Date")
        {
            field(Expected_Receipt_Date; Rec.Expected_Receipt_Date)
            {
                ApplicationArea = All;
            }
        }


    }
    actions
    {
        addlast(Reporting)
        {
            action("PurchWithGIT")
            {
                ApplicationArea = All;
                Caption = 'Purchases with GIT Report';

                trigger OnAction()
                var
                    PurchWithGIT: Report "AME Purchases with GIT Report";
                begin
                    PurchWithGIT.Run();
                end;
            }
        }
    }
}
