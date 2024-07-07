pageextension 52206 "AMEWMS Ship & Receive Activiti" extends "WMS Ship & Receive Activities"
{
    layout
    {
        addafter(Arrivals)
        {
            field("AME Whse. Ship Status-GIT Conf"; Rec."AME Whse. Ship Status-GIT Conf")
            {
                ApplicationArea = All;
                DrillDownPageId = "Warehouse Receipts";
            }
            field("AME Whse. Ship Status-GRN Conf"; Rec."AME Whse. Ship Status-GRN Conf")
            {
                ApplicationArea = All;
                DrillDownPageId = "Warehouse Receipts";
            }
            field("AME Whse. Ship Status-LCP"; Rec."AME Whse. Ship Status-LCP")
            {
                ApplicationArea = All;
                DrillDownPageId = "Warehouse Receipts";
            }
        }
    }
}
