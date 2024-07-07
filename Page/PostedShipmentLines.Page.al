page 52137 "AME Posted Shipment Lines"
{
    ApplicationArea = All;
    Caption = 'Posted Shipment Lines';
    PageType = List;
    SourceTable = "Posted Whse. Shipment Line";
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the type of document that the line relates to.';
                    // Visible = false;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the number of the source document that the entry originates from.';
                    // Visible = false;
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the line number of the source document that the entry originates from.';
                    // Visible = false;
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the type of destination associated with the posted warehouse shipment line.';
                    // Visible = false;
                }
                field("Destination No."; Rec."Destination No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the number of the customer, vendor, or location to which the items have been shipped.';
                    // Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the number of the item that has been shipped.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the description of the item on the line.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the a second description of the item on the line, if any.';
                    Visible = false;
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the code of the zone where the bin on this posted shipment line is located.';
                    // Visible = false;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
                    // Visible = false;
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the shelf number of the item for informational use.';
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity that was shipped.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the shipping advice for the posted warehouse shipment line.';
                    Visible = false;
                }
                field("AME Item Category 1"; Rec."AME Item Category 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Areen Category field.';
                }
                field("AME Item Category 2"; Rec."AME Item Category 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Areen Sub Category 1 field.';
                }
                field("AME Item Category 3"; Rec."AME Item Category 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Areen Sub Category 2 field.';
                }
                field("AME Item Category 4"; Rec."AME Item Category 4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Areen Sub Category 3 field.';
                }
                field("AME Item Category 5"; Rec."AME Item Category 5")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Category field.';
                }
                field("AME Item Category 6"; Rec."AME Item Category 6")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Sub Category 1 field.';
                }
                field("AME Item Category 7"; Rec."AME Item Category 7")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Sub Category 2 field.';
                }
                field("AME Item Category 8"; Rec."AME Item Category 8")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Sub Category 3 field.';
                }
                field("AME Item Category 9"; Rec."AME Item Category 9")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Sub Category 4 field.';
                }
                field("AME Item Category 10"; Rec."AME Item Category 10")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pigeon Sub Category 5 field.';
                }
                field("AME Item Category 11"; Rec."AME Item Category 11")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Marketing Category field.';
                }
                field("AME Item Category 12"; Rec."AME Item Category 12")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Marketing Sub Category 1 field.';
                }
                field("AME Item Category 13"; Rec."AME Item Category 13")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Marketing Sub Category 2 field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Posted Source Document")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Posted Source Document';
                    Image = PostedOrder;
                    ToolTip = 'Open the list of posted source documents.';

                    trigger OnAction()
                    begin
                        ShowPostedSourceDoc();
                    end;
                }
                action("Whse. Document Line")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Whse. Document Line';
                    Image = Line;
                    ToolTip = 'View the line on another warehouse document that the warehouse activity is for.';

                    trigger OnAction()
                    begin
                        ShowWhseLine();
                    end;
                }
                action("Bin Contents List")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Bin Contents List';
                    Image = BinContent;
                    ToolTip = 'View the contents of the selected bin and the parameters that define how items are routed through the bin.';

                    trigger OnAction()
                    begin
                        ShowBinContents();
                    end;
                }
            }
        }
    }

    var
        WMSMgt: Codeunit "WMS Management";

    local procedure ShowPostedSourceDoc()
    begin
        WMSMgt.ShowPostedSourceDocument(Rec."Posted Source Document", Rec."Posted Source No.");
    end;

    local procedure ShowBinContents()
    var
        BinContent: Record "Bin Content";
    begin
        BinContent.ShowBinContents(Rec."Location Code", Rec."Item No.", Rec."Variant Code", Rec."Bin Code");
    end;

    local procedure ShowWhseLine()
    begin
        WMSMgt.ShowPostedWhseShptLine(Rec."Whse. Shipment No.", Rec."Whse Shipment Line No.");
    end;
}
