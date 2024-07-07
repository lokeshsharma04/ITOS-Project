pageextension 52111 "AME Posted Whse.Receipt List" extends "Posted Whse. Receipt List"
{
    layout
    {
        addafter("Assignment Date")
        {
            field("BL_No"; Rec.BL_No)
            {
                Caption = 'BL No';
                ApplicationArea = All;
            }
            field("Supp_Invoice_No"; Rec.Supp_Invoice_No)
            {
                Caption = 'Supp Invoice No';
                ApplicationArea = All;
            }
            field("Supp_Invoice_Date"; Rec.Supp_Invoice_Date)
            {
                Caption = 'Supp Invoice Date';
                ApplicationArea = All;
            }
            field("Expected_Receipt_Date"; Rec.Expected_Receipt_Date)
            {
                Caption = 'Expected Receipt Date';
                ApplicationArea = All;
            }
        }
    }
}
