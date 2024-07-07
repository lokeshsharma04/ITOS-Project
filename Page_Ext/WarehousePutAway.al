pageextension 52188 "AME Warehouse Put-Away" extends "Warehouse Put-away"
{
    actions
    {
        addlast(Reporting)
        {
            action("AME Warehouse Put-Away")
            {
                ApplicationArea = ALL;
                Caption = 'Warehouse Put-Away';
                Image = Print;

                trigger OnAction()
                var
                    WRh: Record "Warehouse Activity Header";
                BEGIN
                    WRh.SetRange("No.", rec."No.");
                    Report.Run(Report::"AME Warehouse Put-Away", true, false, WRh);
                END;
            }
        }
    }
}
