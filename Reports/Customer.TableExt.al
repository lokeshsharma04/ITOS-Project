tableextension 52193 "AME Customer" extends customer
{
    fields
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            var
                Customer: Record Customer;
                NameLbl: Label 'Customer Name (%1) already exists for Customer No.: %2.\Do you want to continue?';
            begin
                Customer.Reset();
                Customer.SetFilter("No.", '<>%1', Rec."No.");
                Customer.SetFilter(Name, '%1', '@' + Rec.Name);
                if Customer.FindFirst() then begin
                    if not Confirm(StrSubstNo(NameLbl, Rec.Name, Customer."No."), false) then
                        Error('Customer name should not be duplicated!');
                end;
            end;
        }
    }
}
