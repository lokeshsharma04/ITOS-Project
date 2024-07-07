pageextension 52182 "AME Bin Contents" extends "Bin Contents"
{
    actions
    {
        addlast(reporting)
        {
            action(BinCard)
            {
                ApplicationArea = All;
                Caption = 'Bin Card Report';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                var
                    BinContect: Record "Bin Content";
                begin
                    BinContect.Reset();
                    // BinContect.SetRange("Location Code", Rec."Location Code");
                    // BinContect.SetRange("Bin Code", Rec."Bin Code");
                    // BinContect.SetRange("Item No.", Rec."Item No.");
                    // BinContect.SetRange("Variant Code", Rec."Variant Code");
                    // BinContect.SetRange("Unit of Measure Code", Rec."Unit of Measure Code");
                    Report.Run(Report::"AME Bin Card Report", true, false, BinContect);
                end;
            }
        }
    }
}
