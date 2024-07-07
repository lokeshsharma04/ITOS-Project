pageextension 52128 "AME Warehouse Shipment" extends "Warehouse Shipment"
{
    layout
    {

        addlast(General)
        {
            field("AME Commercial Invoice No."; Rec."AME Commercial Invoice No.")
            {
                ApplicationArea = All;
            }
            field("AME Ship Confirmed"; Rec."AME Ship Confirmed")
            {
                ApplicationArea = All;
            }
            field("Bill of Exit Date"; Rec."AME Bill of Exit Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit Date field.';
            }
            field("Bill of Exit No."; Rec."AME Bill of Exit No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill of Exit No. field.';
            }
            field("AME Ship. Confirm Status"; Rec."AME Ship. Confirm Status")
            {
                ApplicationArea = All;
            }
            field("AME Chamber Charges"; Rec."AME Chamber Charges")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Chamber Charges field.';
            }
            field("AME Remarks"; Rec."AME Remarks")
            {
                MultiLine = true;
                ApplicationArea = All;
            }
        }

        moveafter("Posting Date"; "Shipment Date")


    }

    actions
    {
        addlast("F&unctions")
        {
            group(ShipmentConfirmation)
            {
                Caption = 'Shipment Confirmation';
                action(ShipConfirmOpen)
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    Image = Open;

                    trigger OnAction()
                    begin
                        Rec.SetConfirmationStatusOpen();
                    end;
                }
                action(ShipConfirmPending)
                {
                    ApplicationArea = All;
                    Caption = 'Pending';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        Rec.SetConfirmationStatusPending();
                    end;
                }
                action(ShipConfirmConfirmed)
                {
                    ApplicationArea = All;
                    Caption = 'Confirmed';
                    Image = Confirm;

                    trigger OnAction()
                    begin
                        Rec.SetConfirmationStatusConfirmed();
                    end;
                }
                action(ShipConfirmReadytoShip)
                {
                    ApplicationArea = All;
                    Caption = 'Ready to Ship';
                    Image = ReleaseShipment;

                    trigger OnAction()
                    begin
                        Rec.SetConfirmationStatusReadytoShip();
                    end;
                }
            }
            action(AMEShipConfirmed)
            {
                ApplicationArea = All;
                Caption = 'Generate Commercial Inv. No.';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetShipConfirmed();
                end;
            }
        }

        addafter("&Print")
        {
            action("AMECommercial Invoice")
            {
                ApplicationArea = All;
                Caption = 'Commercial Invoice';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    WhseShipDoc: Record "Warehouse Shipment Header";
                    CommercialTaxInvoiceWhse: report "AME Comm. Tax-Invoice Whse";
                begin
                    Rec.TestField("AME Commercial Invoice No.");
                    WhseShipDoc.SetRange("No.", rec."No.");
                    CommercialTaxInvoiceWhse.SetTableView(WhseShipDoc);
                    CommercialTaxInvoiceWhse.RunModal();
                end;
            }
            action("AMEProforma Invoice")
            {
                ApplicationArea = All;
                Caption = 'Proforma Invoice';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    WhseShipDoc: Record "Warehouse Shipment Header";
                    ProformaShipDoc: report "Proforma Inv (Shipment Doc)";
                begin
                    WhseShipDoc.SetRange("No.", Rec."No.");
                    ProformaShipDoc.SetTableView(WhseShipDoc);
                    ProformaShipDoc.RunModal();
                end;
            }
            action(Report)
            {
                ApplicationArea = All;
                Caption = 'Packing List';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    WhseShipDoc: Record "Warehouse Shipment Header";
                    PackingListRep: report "AME Packing List Report";
                begin
                    WhseShipDoc.SetRange("No.", Rec."No.");
                    PackingListRep.SetTableView(WhseShipDoc);
                    PackingListRep.RunModal();
                end;
            }
            group(AMEBatchDetails)
            {
                Caption = 'Batch&Expiry Details';

                action(Report1)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Detail - Pick Slip';
                    Image = PrintVoucher;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        WhseShipDoc: Record "Warehouse Shipment Header";
                        BatchExpiryRep: report "AME Batch&Expiry Details Rep";
                    begin
                        WhseShipDoc.SetRange("No.", Rec."No.");
                        BatchExpiryRep.SetTableView(WhseShipDoc);
                        BatchExpiryRep.RunModal();
                    end;
                }
                action(AMEBatchDetailsAfterPick)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Detail - Pack Slip';
                    Image = PrintVoucher;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        WhseShipDoc: Record "Warehouse Shipment Header";
                        BatchExpiryRep: report "AME Batch Detail After Pick";
                    begin
                        WhseShipDoc.SetRange("No.", Rec."No.");
                        BatchExpiryRep.SetTableView(WhseShipDoc);
                        BatchExpiryRep.RunModal();
                    end;
                }

            }

            action(HSCodeReport)
            {
                ApplicationArea = All;
                Caption = 'HS Code Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    WhseShipDoc: Record "Warehouse Shipment Header";
                    HSCodeReport: report "AME HS Code Report Whse";
                begin
                    Rec.TestField("AME Commercial Invoice No.");
                    WhseShipDoc.SetRange("No.", Rec."No.");
                    HSCodeReport.SetTableView(WhseShipDoc);
                    HSCodeReport.RunModal();
                end;

            }
            action(MontajiReport)
            {
                ApplicationArea = All;
                Caption = 'Montaji Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    WhseShipDoc: Record "Warehouse Shipment Header";
                    MontajiReport: report "AME Montaji Report";
                begin
                    WhseShipDoc.SetRange("No.", Rec."No.");
                    MontajiReport.SetTableView(WhseShipDoc);
                    MontajiReport.RunModal();
                end;

            }

        }
    }
    trigger OnDeleteRecord(): Boolean
    var
    begin
        Rec.CanUserDeleteShipmentDocument();
    end;
}
