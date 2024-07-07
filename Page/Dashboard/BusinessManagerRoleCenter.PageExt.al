pageextension 52187 "AME Buss. Mgr. Role Center" extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
        addafter(Control16)
        {
            part(Control1907662708; "AME Purch. Suprvsr Activity")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
        }

        modify(Control46)
        {
            Visible = false;
        }
        modify(Control96)
        {
            Visible = false;
        }

    }

    actions
    {
        addlast(Embedding)
        {
            action(AMEConfigPackage)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Config. Packages';
                RunObject = Page "Config. Packages";
                ToolTip = 'Open inbound shipments.';
            }
        }
    }

    var
        myInt: Integer;
}