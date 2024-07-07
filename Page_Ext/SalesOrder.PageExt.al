pageextension 52120 "AME Sales Order" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("SO Status"; Rec."AME SO Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the SO Status field.';
            }
        }
        addafter("Order Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Price Date field.';
            }
        }
        modify("Shipment Method Code")
        {
            ShowMandatory = true;
        }
        addlast("Invoice Details")
        {
            field("AME Purch. Currency Code"; Rec."AME Purch. Currency Code")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("P&osting")
        {
            group(SOStatus)
            {
                Caption = 'SO Status';
                Image = ChangeStatus;
                action(ReOpen2)
                {
                    ApplicationArea = All;
                    Image = ReOpen;
                    Caption = 'ReOpen';
                    trigger OnAction()
                    begin
                        Rec.Validate("AME SO Status", Rec."AME SO Status"::Open);
                        Rec.Modify()
                    end;
                }
                action("On-Hold")
                {
                    ApplicationArea = All;
                    Caption = 'On-Hold';
                    Image = Status;
                    trigger OnAction()
                    begin
                        Rec.Validate("AME SO Status", Rec."AME SO Status"::"On-Hold");
                        Rec.Modify()
                    end;
                }
                action(Confirmed)
                {
                    ApplicationArea = All;
                    Caption = 'Confirmed';
                    Image = Confirm;
                    trigger OnAction()
                    begin
                        Rec.Validate("AME SO Status", Rec."AME SO Status"::Confirmed);
                        Rec.Modify()
                    end;
                }
                action(Canceled)
                {
                    ApplicationArea = All;
                    Image = Cancel;
                    Caption = 'Canceled';
                    trigger OnAction()
                    begin
                        Rec.Validate("AME SO Status", Rec."AME SO Status"::Canceled);
                        Rec.Modify()
                    end;
                }
            }

            action(RefreshPrice)
            {
                ApplicationArea = all;
                Image = Price;
                Caption = 'Refresh Price';
                Promoted = true;
                PromotedCategory = Category7;

                trigger OnAction()
                begin
                    Rec.RefreshSalesPrices(Rec);
                end;
            }


        }
        addafter("Print Confirmation")
        {

        }


    }
}
