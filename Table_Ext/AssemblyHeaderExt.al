tableextension 52107 "AME Assembly  Header Ext" extends "Assembly Header"
{
    fields
    {
        field(52100; "Sub-contract Order"; Boolean)
        {
            Caption = 'Sub-contract Order';
            DataClassification = CustomerContent;
        }
    }

    procedure ValidateBeforeRelease()
    var
        IsHandled: Boolean;
        myInt: Integer;
        AssemblyLine: Record "Assembly Line";
    begin
        OnBeforeValidateBeforeRelease(IsHandled);
        if IsHandled then
            exit;

        rec.TestField("Shortcut Dimension 1 Code");
        rec.TestField("Shortcut Dimension 2 Code");

        AssemblyLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
        AssemblyLine.SetRange("Document Type", rec."Document Type");
        AssemblyLine.SetRange("Document No.", Rec."No.");
        AssemblyLine.SetFilter("No.", '<>%1', '');
        if AssemblyLine.FindFirst() then
            repeat
                AssemblyLine.TestField("Shortcut Dimension 1 Code");
                AssemblyLine.TestField("Shortcut Dimension 2 Code");
            until AssemblyLine.Next() = 0;

        OnAfterValidateBeforeRelease();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateBeforeRelease(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateBeforeRelease()
    begin
    end;
}
