pageextension 52116 "AME Whse. Shipment Subform" extends "Whse. Shipment Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Unit Cost"; Rec."AME Unit Cost")
            {
                ApplicationArea = all;
            }
            field(Amount; Rec."AME Amount")
            {
                ApplicationArea = all;
            }
            field("Carton Qty."; Rec."AME Carton Qty.")
            {
                ApplicationArea = all;
            }
            field("From Carton No."; Rec."AME From Carton No.")
            {
                ApplicationArea = all;
            }
            field("To Carton No."; Rec."AME To Carton No.")
            {
                ApplicationArea = all;
            }

        }
        modify("Qty. to Ship")
        {
            trigger OnAfterValidate()
            begin
                if WarehouseShipHeader.Get(Rec."No.") then
                    if WarehouseShipHeader."AME Ship Confirmed" then begin
                        WarehouseShipHeader.TestField("AME Ship Confirmed", false);
                    end;
            end;
        }
        addlast(Control1)
        {
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
    trigger OnDeleteRecord(): Boolean
    begin
        if WarehouseShipHeader.Get(Rec."No.") then
            if WarehouseShipHeader."AME Ship Confirmed" = true then begin
                WarehouseShipHeader.TestField("AME Ship Confirmed", false);
            end;

        WarehouseShipHeader.TestField("AME Ship. Confirm Status", WarehouseShipHeader."AME Ship. Confirm Status"::Open);
    end;

    var
        WarehouseShipHeader: Record "Warehouse Shipment Header";
        QtytoShip: Decimal;

}
