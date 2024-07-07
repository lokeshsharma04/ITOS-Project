pageextension 52141 "AME Posted Sales Invoices" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No.")
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(print)
        {
            action("AMECommercial Invoice")
            {
                ApplicationArea = All;
                Caption = 'Commercial Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ProformaShipDoc: report "AME Tax-Invoice";
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader.SetRange("No.", rec."No.");
                    ProformaShipDoc.SetTableView(SalesInvHeader);
                    ProformaShipDoc.RunModal();
                end;
            }
            action("HS Code Report")
            {
                ApplicationArea = All;
                Caption = 'HS Code';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    HScodeReport: report "AME HS Code Report";
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader.SetRange("No.", rec."No.");
                    HScodeReport.SetTableView(SalesInvHeader);
                    HScodeReport.RunModal();
                end;
            }
        }

    }
}
