tableextension 52194 "AME Vendor" extends Vendor
{
    fields
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            var
                Vendor: Record Vendor;
                NameLbl: Label 'Vendor Name (%1) already exists for Vendor No.: %2.\Do you want to continue?';
            begin
                Vendor.Reset();
                Vendor.SetFilter("No.", '<>%1', Rec."No.");
                Vendor.SetFilter(Name, '%1', '@' + Rec.Name);
                if Vendor.FindFirst() then begin
                    if not Confirm(StrSubstNo(NameLbl, Rec.Name, Vendor."No."), false) then
                        Error('Vendor name should not be duplicated!');
                end;
            end;
        }
    }
}
