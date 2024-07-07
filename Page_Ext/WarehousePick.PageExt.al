pageextension 52150 "AME Warehouse Pick " extends "Warehouse Pick"
{
    actions
    {
        addlast(processing)
        {
            action(AMEPickSlip)
            {
                ApplicationArea = All;
                Caption = 'Pick Slip-Report';
                Image = Report2;
                trigger OnAction()
                var
                    PicKSlipRep: Report "AME Pick Slip Report";
                    PickHeader: Record "Warehouse Activity Header";
                begin
                    PickHeader.SetRange("No.", rec."No.");
                    PicKSlipRep.SetTableView(PickHeader);
                    PicKSlipRep.RunModal();
                end;
            }
        }
    }
}
