page 52118 "AME Assembly Role Center"
{
    ApplicationArea = All;
    Caption = 'Assembly Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(AMEAssemblyActivities; "Assembly Activities")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        area(reporting)
        {

            action("WIPShortage")
            {
                ApplicationArea = All;
                Caption = 'WIP Shortage Report';
                Image = Report2;
                RunObject = report "AME WIP Shortage Report";
            }
            action("ManHourReport")
            {
                ApplicationArea = All;
                Caption = 'Assembly Man Hours';
                Image = Report2;
                RunObject = report "AME Assembly Man Hours";
            }
            action("Finished Stock Report")
            {
                ApplicationArea = All;
                Caption = 'Assembled Stock Report';
                Image = Report2;
                RunObject = report "AME Finished Goods-Report";
            }
            action("FGStock Report")
            {
                ApplicationArea = All;
                Caption = 'FG Stock Report';
                Image = Report2;
                RunObject = report "AME FG Stock Report";
            }

        }
        area(embedding)
        {
            action(Items)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "AME Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(AssemblyOrders)
            {
                ApplicationArea = All;
                Caption = 'Assembly Orders';
                Image = Item;
                RunObject = Page "Assembly Orders";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(MovementWorksheet)
            {
                ApplicationArea = All;
                Caption = 'Movement Worksheet';
                Image = MovementWorksheet;
                RunObject = page "Movement Worksheet";
            }
            action(BinContent)
            {
                ApplicationArea = All;
                Caption = 'Bin Contents';
                Image = BinContent;
                RunObject = page "Bin Contents";
                RunPageView = where("Zone Code" = filter('FG-STAGING|WIP'));
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action(Action41)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Assembly Orders';
                    Image = PostedShipment;
                    RunObject = Page "Posted Assembly Orders";
                    ToolTip = 'Open the list of Posted Assembly Orders.';
                }
                action(Action42)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Registered Pick';
                    Image = RegisterPick;
                    RunObject = Page "Registered Pick";
                    ToolTip = 'Open the list of Registered Pick.';
                }
            }


        }
        area(processing)
        {

            separator(Action48)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            separator(Action2)
            {
            }
        }
        area(Creation)
        {
            action("&AssemblyOrder")
            {
                ApplicationArea = Basic, Suite, All;
                Caption = '&Assembly Order';
                Image = AssemblyOrder;
                RunObject = Page "Assembly Order";
                RunPageMode = Create;
                ToolTip = 'Create a new Assembly Order.';
            }
        }

    }

}
