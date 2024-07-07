pageextension 52101 "AME Items List" extends "Item List"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Carton Uom"; Rec."AME Carton UOM")
            {
                ApplicationArea = All;
            }
            field("AME Carton Qty"; Rec."AME Carton Qty")
            {
                ApplicationArea = All;
            }
        }
        addafter("Description 2")
        {
            field("Long Description"; Rec."AME Long Description 2")
            {
                ApplicationArea = All;
            }
            field("Common Item No."; Rec."Common Item No.")
            {
                ApplicationArea = All;
            }
            field("Pallet qty"; Rec."AME Pallet qty")
            {
                ApplicationArea = All;
            }
            field("Min. Order Qty"; Rec."AME Min. Order Qty.")
            {
                ApplicationArea = All;

            }
            field("AME BOQ Qty."; Rec."AME BOQ Qty.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BOQ Quantity field.';
            }
            field("AME Item Category 1"; Rec."AME Item Category 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 1 field.';
            }
            field("AME Item Category 2"; Rec."AME Item Category 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 2 field.';
            }
            field("AME Item Category 3"; Rec."AME Item Category 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 3 field.';
            }
            field("AME Item Category 4"; Rec."AME Item Category 4")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 4 field.';
            }
            field("AME Item Category 5"; Rec."AME Item Category 5")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 5 field.';
                Visible = false;
            }
            field("AME Item Category 6"; Rec."AME Item Category 6")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 6 field.';
                Visible = false;
            }
            field("AME Item Category 7"; Rec."AME Item Category 7")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 7 field.';
                Visible = false;
            }
            field("AME Item Category 8"; Rec."AME Item Category 8")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 8 field.';
                Visible = false;
            }
            field("AME Item Category 9"; Rec."AME Item Category 9")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 9 field.';
                Visible = false;
            }
            field("AME Item Category 10"; Rec."AME Item Category 10")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 10 field.';
                Visible = false;
            }
            field("AME Item Category 11"; Rec."AME Item Category 11")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 11 field.';
                Visible = false;
            }
            field("AME Item Category 12"; Rec."AME Item Category 12")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 12 field.';
                Visible = false;
            }
            field("AME Item Category 13"; Rec."AME Item Category 13")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Category 13 field.';
                Visible = false;
            }
            field("ATOS Status"; Rec."ATOS Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Status field.';
                Visible = false;
            }
            field("Gross Weight"; Rec."Gross Weight")
            {
                ApplicationArea = All;
            }
            field("Net Weight"; Rec."Net Weight")
            {
                ApplicationArea = All;
            }
            field("Unit Volume"; Rec."Unit Volume")
            {
                ApplicationArea = All;
            }
            field("AME Height"; Rec."AME Height")
            {
                ApplicationArea = All;
            }
            field("AME Width"; Rec."AME Width")
            {
                ApplicationArea = All;
            }
            field("AME Length"; Rec."AME Length")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Manufacturing Policy"; "Tariff No.")
    }

    actions
    {
        addlast(reporting)
        {
            action("FG Stock Report")
            {

                ApplicationArea = All;
                Caption = 'FG Stock Report';
                Image = Report2;

                trigger OnAction()
                var
                    FGStockReport: Report "AME FG Stock Report";
                begin
                    FGStockReport.Run();
                end;
            }
            action(ItemWiseStock)
            {
                ApplicationArea = All;
                Caption = 'Item Wise Stock';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    Item.Reset();
                    Report.Run(Report::"AME Item Wise Stock Report", true, false, Item);
                end;
            }
            action(RoyaltyReport)
            {
                ApplicationArea = All;
                Caption = 'Royalty Report';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    Item.Reset();
                    Report.Run(Report::"AME Royalty Report", true, false, Item);
                end;
            }
        }

        addafter(History)
        {
            group(ImportData)
            {
                Caption = 'Import Data';
                Image = ChangeStatus;
                action(ImportItems)
                {
                    Caption = 'Import Items';
                    Image = Import;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Xmlport.Run(Xmlport::"AME Item", false, true);
                    end;
                }
                action(ImortData2)
                {
                    Caption = 'Import Dimension';
                    Image = Import;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        DefaultDimPort: XmlPort "AME Dimension Xml";
                    begin
                        DefaultDimPort.SettableNo(Database::Item);
                        DefaultDimPort.Run();
                    end;
                }
                action(ImortData1)
                {
                    Caption = 'Import IC Sync Companies';
                    Image = Import;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Xmlport.Run(Xmlport::"AME Inter Comapny Setup", false, true);
                    end;
                }

            }
        }

        addafter("Inventory Availability")
        {
            action("Stock Ledger Report")
            {

                ApplicationArea = All;
                Caption = 'Stock Ledger Report';
                Image = Report;
                trigger OnAction()
                var
                    StockLedgerReport: Report "AME Stock Ledger Report";
                    Item: Record Item;
                begin
                    Item.Reset();
                    item.SetRange("No.", Rec."No.");
                    Report.Run(Report::"AME Stock Ledger Report", true, false, Item);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        GLSetup: Record "General Ledger Setup";
    begin
        if GLSetup.Get() then
            if GLSetup."Global Dimension 1 Code" <> '' then
                Rec.SetFilter("ATOS Dim1. Code Filter", GLSetup."Global Dimension 1 Code");
    end;
}
