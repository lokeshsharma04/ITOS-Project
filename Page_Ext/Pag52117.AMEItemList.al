page 52117 "AME Item List"
{
    ApplicationArea = All;
    Caption = 'Items';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies what you are selling.';
                }
                field("AME Long Description 2"; Rec."AME Long Description 2")
                {
                    ToolTip = 'Specifies the value of the Long Description field.';
                }
                field("Tariff No."; Rec."Tariff No.")
                {
                    ToolTip = 'Specifies a code for the item''s tariff number.';
                }
                field("Common Item No."; Rec."Common Item No.")
                {
                    ToolTip = 'Specifies the unique common item number that the intercompany partners agree upon.';
                }
                field("Assembly BOM"; Rec."Assembly BOM")
                {
                    ToolTip = 'Specifies if the item is an assembly BOM.';
                }
                field("AME Item Category 1"; Rec."AME Item Category 1")
                {
                    ToolTip = 'Specifies the value of the Item Category 1 field.';
                }
                field("AME Item Category 2"; Rec."AME Item Category 2")
                {
                    ToolTip = 'Specifies the value of the Item Category 2 field.';
                }
                field("AME Item Category 3"; Rec."AME Item Category 3")
                {
                    ToolTip = 'Specifies the value of the Item Category 3 field.';
                }
                field("AME Item Category 4"; Rec."AME Item Category 4")
                {
                    ToolTip = 'Specifies the value of the Item Category 4 field.';
                }
                field("AME Item Category 5"; Rec."AME Item Category 5")
                {
                    ToolTip = 'Specifies the value of the Item Category 5 field.';
                    Visible = false;
                }
                field("AME Item Category 6"; Rec."AME Item Category 6")
                {
                    ToolTip = 'Specifies the value of the Item Category 6 field.';
                    Visible = false;
                }
                field("AME Item Category 7"; Rec."AME Item Category 7")
                {
                    ToolTip = 'Specifies the value of the Item Category 7 field.';
                    Visible = false;
                }
                field("AME Item Category 8"; Rec."AME Item Category 8")
                {
                    ToolTip = 'Specifies the value of the Item Category 8 field.';
                    Visible = false;
                }
                field("AME Item Category 9"; Rec."AME Item Category 9")
                {
                    ToolTip = 'Specifies the value of the Item Category 9 field.';
                    Visible = false;
                }
                field("AME Item Category 10"; Rec."AME Item Category 10")
                {
                    ToolTip = 'Specifies the value of the Item Category 10 field.';
                    Visible = false;
                }
                field("AME Item Category 11"; Rec."AME Item Category 11")
                {
                    ToolTip = 'Specifies the value of the Item Category 11 field.';
                    Visible = false;
                }
                field("AME Item Category 12"; Rec."AME Item Category 12")
                {
                    ToolTip = 'Specifies the value of the Item Category 12 field.';
                    Visible = false;
                }
                field("AME Item Category 13"; Rec."AME Item Category 13")
                {
                    ToolTip = 'Specifies the value of the Item Category 13 field.';
                    Visible = false;
                }

                field("AME Min. Order Qty."; Rec."AME Min. Order Qty.")
                {
                    ToolTip = 'Specifies the value of the Min. Order Qty field.';
                    Visible = false;
                }
                field("AME Pallet qty"; Rec."AME Pallet qty")
                {
                    ToolTip = 'Specifies the value of the Pallet qty field.';
                    Visible = false;
                }
                field("ATOS Allowed Division"; Rec."ATOS Allowed Division")
                {
                    ToolTip = 'Specifies the value of the Allowed Division field.';
                }
                field("ATOS Status"; Rec."ATOS Status")
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("ATOSCreatedBy User"; Rec."ATOSCreatedBy User")
                {
                    ToolTip = 'Specifies the value of the Created By User field.';
                    Visible = false;
                }
                field("ATOSModified By User"; Rec."ATOSModified By User")
                {
                    ToolTip = 'Specifies the value of the Last Modified By User field.';
                    Visible = false;
                }
                field("Country/Region of Origin Code"; Rec."Country/Region of Origin Code")
                {
                    ToolTip = 'Specifies a code for the country/region where the item was produced or processed.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = false;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ToolTip = 'Specifies the gross weight of the item.';
                    Visible = false;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
                    Visible = false;
                }
                field("Item Tracking Code"; Rec."Item Tracking Code")
                {
                    ToolTip = 'Specifies how serial or lot numbers assigned to the item are tracked in the supply chain.';
                    Visible = false;
                }
                field("Lot Nos."; Rec."Lot Nos.")
                {
                    ToolTip = 'Specifies the number series code that will be used when assigning lot numbers.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group(AtosRelease)
            {
                Caption = 'Release';
                Image = ReleaseDoc;

                action("ATOSReopenItem")
                {
                    Caption = 'Reopen';
                    ApplicationArea = All;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ItemClass: Codeunit "ATOS Item Class";
                    begin
                        ItemClass.PerformManualReopen(Rec);
                    end;
                }
                action("ATOSReleaseItem")
                {
                    Caption = 'Release';
                    ApplicationArea = All;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ItemClass: Codeunit "ATOS Item Class";
                    begin
                        ItemClass.ValidatItemForRelease(Rec);
                        ItemClass.PerformManualRelease(Rec);
                    end;

                }
            }

        }

        area(Navigation)
        {
            group(Assembly)
            {
                Caption = 'Assemb&ly';
                Image = AssemblyBOM;
                action("Assembly &BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = Assembly;
                    Caption = 'Assembly BOM';
                    Image = BOM;
                    RunObject = Page "Assembly BOM";
                    RunPageLink = "Parent Item No." = field("No.");
                    ToolTip = 'View or edit the bill of material that specifies which items and resources are required to assemble the assembly item.';
                }
                action("Where-Used")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = Assembly;
                    Caption = 'Where-Used';
                    Image = Track;
                    RunObject = Page "Where-Used List";
                    RunPageLink = Type = const(Item),
                                      "No." = field("No.");
                    RunPageView = sorting(Type, "No.");
                    ToolTip = 'View a list of assembly BOMs in which the item is used.';
                }
            }

        }
    }

    var
        myInt: Integer;
        ShowCost: boolean;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        GLSetup: Record "General Ledger Setup";
    begin
        if UserSetup.Get(UserId) then
            ShowCost := UserSetup."ATOS Show Cost";

        if GLSetup.Get() then
            if GLSetup."Global Dimension 1 Code" <> '' then
                Rec.SetFilter("ATOS Dim1. Code Filter", GLSetup."Global Dimension 1 Code");
    end;
}
