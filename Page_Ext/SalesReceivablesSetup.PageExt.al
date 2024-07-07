pageextension 52109 "AME_Sales_ Receivables_Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Invoice Rounding")
        {
            field(Delete_Invd_Blnkt_Sales_Orders; Rec.AME_DeleteInvdBlnktSalesOrders)
            {
                ApplicationArea = All;
                Caption = 'Delete Invoiced Blanket Sales Orders';
            }
            field("Price Based On Price Date"; Rec."AME Price Based On Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Price Based on Price Date field.';
            }
            field("AME Comm. Inv Req. for Ship"; Rec."AME Comm. Inv Req. for Ship")
            {
                ApplicationArea = All;
            }
            field("AME BOE Details Req. for Ship"; Rec."AME BOE Details Req. for Ship")
            {
                ApplicationArea = All;
            }
        }
        addafter("Document Default Line Type")
        {
            field("Reverse Rev. For FOC Items"; Rec."AME Reverse Rev. For FOC Items")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reverse Revenue For FOC Items field.';
            }
            field("Reverse Rev. For POS Items"; Rec."AME Reverse Rev. For POS Items")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reverse Revenue for POS Items field.';
            }
            field("AME Skip Ship Before WrkDate"; Rec."AME Skip Ship Before WrkDate")
            {
                ApplicationArea = All;
            }

            field("Revenue Adj. Templ. Name"; Rec."AME Revenue Adj. Templ. Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Revenue Adj. Templ. Name field.';
            }
            field("Revenue Adj. Batch"; Rec."AME Revenue Adj. Batch")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Revenue Adj. Batch field.';
            }
            field("AME Chamber Charge Item"; Rec."AME Chamber Charge Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the AME Chamber Charge Item field.';
            }

        }
        addlast("Number Series")
        {
            field("AME Commercial Inv. Nos."; Rec."AME Commercial Inv. Nos.")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Commercial Inv. Nos. field.';
            }
        }
        addafter("Archive Orders")
        {
            field("AME Create Arch. On Release"; Rec."AME Create Arch. On Release")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Archive On Release field.';
            }
        }
        addlast(Prices)
        {
            field("AME UOM Req. for Price List"; Rec."AME UOM Req. for Price List")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Unit of Measure Required for Price List.';
            }
        }
    }
}
