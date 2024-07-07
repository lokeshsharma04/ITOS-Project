pageextension 52100 "AME Item Card" extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Carton Uom"; Rec."AME Carton UOM")
            {
                ApplicationArea = All;
            }

            field("Allowed Division"; Rec."ATOS Allowed Division")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allowed Division field.';
            }
        }
        addafter("Description")
        {
            field("AME BOQ Qty."; Rec."AME BOQ Qty.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BOQ Quantity field.';
            }
            field("Long Description"; Rec."AME Long Description 2")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Pallet qty"; Rec."AME Pallet qty")
            {
                ApplicationArea = All;
            }
            field("Min. Order Qty"; Rec."AME Min. Order Qty.")
            {
                ApplicationArea = All;
            }

        }
        moveafter("Min. Order Qty"; "Tariff No.")
        modify(GTIN)
        {
            ShowMandatory = true;
        }
        modify("Common Item No.")
        {
            ShowMandatory = true;
        }
        modify("Item Category Code")
        {
            ShowMandatory = false;
        }
        modify("Country/Region of Origin Code")
        {
            ApplicationArea = All;
            ShowMandatory = true;

        }
        modify(Replenishment_Production)
        {
            Visible = false;
        }

        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Standard Cost")
        {
            Visible = false;
        }
        modify("Unit Price")
        {
            Visible = false;
        }
        modify("Profit %")
        {
            Visible = false;
        }

        modify("Lot Nos.")
        {
            Visible = true;
        }
        modify("Serial Nos.")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        addafter("Costs & Posting")
        {
            group("AME Item Categories")
            {
                Caption = 'Item Categories';
                AboutTitle = 'Manage Item Categories';
                group(Areen)
                {
                    Caption = 'Areen';
                    field("AME Item Category 1"; Rec."AME Item Category 1")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 1 field.';
                    }
                    field("AME Item Category 2"; Rec."AME Item Category 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 2 field.';
                        ColumnSpan = 3;

                    }
                    field("AME Item Category 3"; Rec."AME Item Category 3")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 3 field.';
                    }
                    field("AME Item Category 4"; Rec."AME Item Category 4")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 4 field.';
                    }
                }
                group(PGNCategory)
                {
                    Caption = 'PGN Category';
                    field("AME Item Category 5"; Rec."AME Item Category 5")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 5 field.';
                    }
                    field("AME Item Category 6"; Rec."AME Item Category 6")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 6 field.';
                    }
                    field("AME Item Category 7"; Rec."AME Item Category 7")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 7 field.';
                    }
                    field("AME Item Category 8"; Rec."AME Item Category 8")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 8 field.';
                    }
                    field("AME Item Category 9"; Rec."AME Item Category 9")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 9 field.';
                    }
                    field("AME Item Category 10"; Rec."AME Item Category 10")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the value of the Item Category 10 field.';
                    }
                }
                group(MarketingCategory)
                {
                    Caption = 'Marketing Category';
                    field("AME Item Category 11"; Rec."AME Item Category 11")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item Category 11 field.';
                    }
                    field("AME Item Category 12"; Rec."AME Item Category 12")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item Category 12 field.';
                    }
                    field("AME Item Category 13"; Rec."AME Item Category 13")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item Category 13 field.';
                    }
                }
            }
        }

    }
    actions
    {
        addlast(processing)
        {
            action("AMEFG Stock Report")
            {
                ApplicationArea = All;
                Caption = 'FG Stock Report';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    FGStockRep: report "AME FG Stock Report";
                    Item: Record Item;
                begin
                    Item.SetRange("No.", rec."No.");
                    FGStockRep.SetTableView(Item);
                    FGStockRep.RunModal();
                end;
            }
        }

    }
}