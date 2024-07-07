pageextension 52138 "AME Purchase Payable Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Invoice Rounding")
        {
            field("Price Based On Price Date"; Rec."AME Price Based On Price Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purchase Price Based on Price Date field.';
            }
            field("Default IC Vendor No."; Rec."AME Default IC Vendor No.")
            {
                ApplicationArea = All;
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
        addafter("Document Default Line Type")
        {
            field("AME Copy Des from Rcpt/Shpt Ln"; Rec."AME Copy Des from Rcpt/Shpt Ln")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Copy Description from Receipt or Shipment field.';
            }
        }
    }
}
