pageextension 52195 "AME Whse. WMS Role Center" extends "Whse. WMS Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify("&Purchase Order")
        {
            Visible = false;
        }
        modify("Phys. Inv. Order")
        {
            Visible = false;
        }
        modify("Phys. Inv. Recording")
        {
            Visible = false;
        }
        modify("Customers")
        {
            Visible = false;
        }
        modify(Vendors)
        {
            Visible = false;
        }
        modify("Shipping Agent")
        {
            Visible = false;
        }
        modify("Whse. &Shipment")
        {
            visible = false;
        }
        modify("T&ransfer Order")
        {
            Visible = false;
        }
        modify("&Whse. Receipt")
        {
            Visible = false;
        }
    }

    var
        myInt: Integer;
}