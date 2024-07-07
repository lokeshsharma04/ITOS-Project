reportextension 52100 AME_Delete_Invd_Blnkt_Sales_Or extends "Delete Invd Blnkt Sales Orders"
{

    trigger OnPreReport()
    var
        myInt: Integer;
        SalesRecSetup: record "Sales & Receivables Setup";
    begin
        if not SalesRecSetup.AME_DeleteInvdBlnktSalesOrders then
            Error(Text50001);
    end;

    var
        Text50001: label 'Invoiced Blanked Sales Orders cannot be deleted!';

}
