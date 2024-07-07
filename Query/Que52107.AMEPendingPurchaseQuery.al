query 52107 AMEPendingPurchaseQuery
{
    Caption = 'Pending Purchase Orders';
    QueryType = Normal;
    QueryCategory = 'Purchase Order List';

    elements
    {
        dataitem(Purchase_Header; "Purchase Header")
        {
            column(No_; "No.") { }

            dataitem(Purchase_Line; "Purchase Line")
            {
                DataItemLink = "Document Type" = Purchase_Header."Document Type", "Document No." = Purchase_Header."No.";
                DataItemTableFilter = Type = const(Item), "No." = filter(<> '');
                column(Line_No_; "Line No.") { }
                column(Item_No_; "No.") { }
                column(Description; Description) { }
                column(Currency_Code; "Currency Code") { }
                column(Expected_Receipt_Date; "Expected Receipt Date") { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity__Base_; "Quantity (Base)") { }
                column(Outstanding_Quantity; "Outstanding Quantity") { }
                column(Outstanding_Qty___Base_; "Outstanding Qty. (Base)") { }
                column(AME_Item_Category_1; "AME Item Category 1") { }
                column(AME_Item_Category_2; "AME Item Category 2") { }
                column(AME_Item_Category_3; "AME Item Category 3") { }
                column(AME_Item_Category_4; "AME Item Category 4") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }

                dataitem(Warehouse_Receipt_Line; "Warehouse Receipt Line")
                {
                    DataItemLink = "Source No." = Purchase_Line."Document No.", "Source Line No." = Purchase_Line."Line No.";
                    DataItemTableFilter = "Source Type" = const(39);

                    column(Qty__to_Receive; "Qty. to Receive")
                    {
                        Method = Sum;
                        Caption = 'GIT Qty.';
                    }
                    column(Qty__to_Receive__Base_; "Qty. to Receive (Base)")
                    {
                        Method = Sum;
                        Caption = 'GIT Qty. (Base)';
                    }
                }

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
