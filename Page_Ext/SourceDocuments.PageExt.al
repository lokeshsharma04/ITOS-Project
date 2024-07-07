pageextension 52156 "AME Source Documents" extends "Source Documents"
{
    layout
    {
        addafter("Destination No.")
        {
            field("Destination Name"; Rec."Destination Name")
            {
                ApplicationArea = ALL;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
    begin
        if Rec."Destination Name" = '' then begin
            if (Rec."Destination Type" = Rec."Destination Type"::Customer) and (Rec."Destination No." <> '') then begin
                if Customer.Get(Rec."Destination No.") then
                    Rec.Validate("Destination Name", Customer.Name);
            end else
                if (Rec."Destination Type" = Rec."Destination Type"::Vendor) and (Rec."Destination No." <> '') then begin
                    if Vendor.Get(Rec."Destination No.") then
                        Rec.Validate("Destination Name", Vendor.Name);
                end
        end;
    end;
}
