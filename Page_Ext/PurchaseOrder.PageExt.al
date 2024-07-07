pageextension 52131 "AME Purchase Order" extends "Purchase Order"
{
    layout
    {
        addafter("Order Date")
        {
            field("AME Price Date"; Rec."AME Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Price Date field.';
            }
            field("AME Purch. Order Type"; Rec."AME Purch. Order Type")
            {
                ShowMandatory = true;
                ApplicationArea = ALL;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("AME Description"; Rec."AME Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
                // MultiLine = true;
            }
        }
        addafter("Responsibility Center")
        {
            field("AME Workflow Category"; Rec."AME Workflow Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Workflow Category field.';
            }
            field("AME Documents Attached"; Rec."AME Documents Attached")
            {
                ApplicationArea = All;
                DrillDownPageId = "Document Attachment Details";
            }
        }

        addfirst(factboxes)
        {
            // part("AME Approval Comment Factbox"; "AME Approval Comment Factbox")
            // {
            //     Caption = 'Approval Comment';
            //     Visible = true;

            // }
        }
    }

    actions
    {
        addafter(Post)
        {
            action(RefreshPrice)
            {
                ApplicationArea = all;
                Image = Price;
                Caption = 'Refresh Price';
                Promoted = true;
                PromotedCategory = Category7;

                trigger OnAction()
                begin
                    Rec.RefreshPurchasePrices(Rec);
                end;
            }
        }
        addafter(Print)
        {
            action(Report)
            {
                ApplicationArea = All;
                Caption = 'Purchase Order';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category10;
                trigger OnAction()
                var
                    PurChaseOrderRep: Report "AME Purchase Order Report";
                    Purch: Record "Purchase Header";
                begin
                    Purch.SetRange("No.", Rec."No.");
                    PurChaseOrderRep.SetTableView(Purch);
                    PurChaseOrderRep.RunModal();
                end;
            }
            action(Report2)
            {
                ApplicationArea = All;
                Caption = 'LPO Tracker Report';
                Image = Report2;
                Promoted = true;
                PromotedCategory = Category10;
                trigger OnAction()
                var
                    LPOTrackRep: Report "AME LPO Tracker Report";
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.SetRange("No.", Rec."No.");
                    LPOTrackRep.SetTableView(PurchHeader);
                    LPOTrackRep.RunModal();
                end;
            }

            action(ForceRelease)
            {
                ApplicationArea = All;
                Caption = 'Force Release';
                Image = Report2;
                Promoted = true;
                PromotedCategory = Category10;
                Visible = ForceRElease;
                trigger OnAction()
                var

                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify(false);
                end;
            }
        }
    }

    var
        ForceRElease: Boolean;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if UserId = 'PACE2.ERP' then
            ForceRElease := true;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        // CurrPage."AME Approval Comment Factbox".PAGE.SetFilterForRecordIDToApprove(Rec.RecordId);
    end;
}
