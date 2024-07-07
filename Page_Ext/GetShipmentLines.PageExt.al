pageextension 52177 "AME Get Shipment Lines" extends "Get Shipment Lines"
{
    layout
    {
        addafter("Bill-to Customer No.")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order No. field.';
            }
            field(CurrencyCode; REc."Currency Code")
            {
                Caption = 'Currency Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Currency Code';
            }
            field(AMECommInvNo; rec."AME Commercial Inv. No.")
            {
                Caption = 'Commercial Inv. No.';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Commercial Invoice No.';
            }

        }
    }
    trigger OnAfterGetCurrRecord()
    var
        SalesHeader: Record "Sales Header";
    begin
        CurrencyCode := '';
        AMECommInvNo := '';
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("No.", Rec."Order No.");
        if SalesHeader.FindFirst() then begin
            CurrencyCode := SalesHeader."Currency Code";
            AMECommInvNo := SalesHeader."AME Commercial Invoice No.";
        end
    end;

    var
        CurrencyCode: Code[20];
        AMECommInvNo: Code[20];
}
