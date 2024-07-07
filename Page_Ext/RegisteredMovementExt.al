pageextension 52118 "AME Registered Movement Ext" extends "Registered Movement"
{
    actions
    {
        addafter("&Movement")
        {
            group(Report)
            {
                action(MoveOrdTranf)
                {
                    ApplicationArea = All;
                    Caption = 'Move Order Transfer Reprot';
                    Image = Report;
                    trigger OnAction()
                    var
                        RegWhsActhdr: Record "Registered Whse. Activity Hdr.";
                    begin
                        RegWhsActhdr.Reset();
                        RegWhsActhdr.SetRange(Type, Rec.Type);
                        RegWhsActhdr.SetRange("No.", Rec."No.");
                        Report.Run(Report::"AME Move Order Transfers Rep", true, false, RegWhsActhdr);
                    end;
                }
            }

        }
    }
}