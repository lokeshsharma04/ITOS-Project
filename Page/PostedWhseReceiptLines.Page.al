Page 52135 "AME Posted Whse. Receipt Lines"
{
    // AutoSplitKey = true;
    Caption = 'Posted Warehouse Receipt Lines';
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Posted Whse. Receipt Line";
    // LinksAllowed = false;
    // MultipleNewLines = true;
    // DelayedInsert = true;
    // PageType = ListPart;
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
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the number of the source document that the entry originates from.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the date that the receipt line was due.';
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the shelf number of the item for informational use.';
                    Visible = false;
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the code of the zone on this posted receipt line.';
                    // Visible = false;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
                    // Visible = false;
                }
                field("Cross-Dock Zone Code"; Rec."Cross-Dock Zone Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the zone code used to create the cross-dock put-away for this line when the receipt was posted.';
                    Visible = false;
                }
                field("Cross-Dock Bin Code"; Rec."Cross-Dock Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin code used to create the cross-dock put-away for this line when the receipt was posted.';
                    Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the number of the item that was received and posted.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    // Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the description of the item in the line.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies a second description of the item in the line, if any.';
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity that was received.';
                }
                field("Qty. (Base)"; Rec."Qty. (Base)")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity that was received, in the base unit of measure.';
                    Visible = false;
                }
                field("Qty. Put Away"; Rec."Qty. Put Away")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity that is put away.';
                    Visible = false;
                }
                field("Qty. Cross-Docked"; Rec."Qty. Cross-Docked")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity of items that was in the Qty. To Cross-Dock field on the warehouse receipt line when it was posted.';
                    Visible = false;
                }
                field("Qty. Put Away (Base)"; Rec."Qty. Put Away (Base)")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity that is put away, in the base unit of measure.';
                    Visible = false;
                }
                field("Qty. Cross-Docked (Base)"; Rec."Qty. Cross-Docked (Base)")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the base quantity of items in the Qty. To Cross-Dock (Base) field on the warehouse receipt line when it was posted.';
                    Visible = false;
                }
                field("Put-away Qty."; Rec."Put-away Qty.")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity on put-away instructions in the process of being put away.';
                    Visible = false;
                }
                field("Put-away Qty. (Base)"; Rec."Put-away Qty. (Base)")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the quantity on put-away instructions, in the base unit of measure, in the process of being put away.';
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
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
        WMSMgt.ShowPostedWhseRcptLine(Rec."Whse. Receipt No.", Rec."Whse Receipt Line No.");
    end;

    procedure PutAwayCreate()
    var
        PostedWhseRcptHdr: Record "Posted Whse. Receipt Header";
        PostedWhseRcptLine: Record "Posted Whse. Receipt Line";
    begin
        PostedWhseRcptHdr.Get(Rec."No.");
        PostedWhseRcptLine.Copy(Rec);
        Rec.CreatePutAwayDoc(PostedWhseRcptLine, PostedWhseRcptHdr."Assigned User ID");
    end;
}
