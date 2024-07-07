pageextension 52121 "AME Regist. Whse. Movements" extends "Registered Whse. Movements"
{
    actions
    {
        addafter("&Movement")
        {
            action(MoveOrdTranf)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Promoted = true;
                PromotedCategory = Report;
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
