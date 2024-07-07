xmlport 52101 "AME Inter Comapny Setup"
{
    Caption = 'Inter Comapny Setup';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(Root)
        {
            tableelement("ITOS IC Sync Setup"; "ITOS IC Sync Setup")
            {
                XmlName = 'InterCompanySyncSetup';
                textelement(ItemNo) { }
                textelement(CompanyName)
                { }
                textelement(Status)
                {
                }
                trigger OnBeforeInsertRecord()
                var
                    InterCompSyncSetup: Record "ITOS IC Sync Setup";
                    ItemRec: Record Item;
                begin
                    if FirstLine then begin
                        FirstLine := false;
                        currXMLport.Skip();
                    end;

                    if InterCompSyncSetup.Get(Database::Item, ItemNo, '', '', CompanyName) then
                        currXMLport.Skip();

                    ItemRec.Get(ItemNo);

                    MyDialog.Update(1, ItemNo);
                    MyDialog.Update(2, CompanyName);

                    Clear(InterCompSyncSetup);
                    InterCompSyncSetup.Reset();
                    if InterCompSyncSetup.FindLast() then
                        EntryNo := InterCompSyncSetup."ITOS Entry No.";
                    EntryNo := EntryNo + 1;
                    InterCompSyncSetup.Init();
                    InterCompSyncSetup."ITOS Entry No." := EntryNo;
                    InterCompSyncSetup."ITOS Table No." := Database::Item;
                    InterCompSyncSetup.Validate("ITOS Primary Key 1", ItemNo);
                    InterCompSyncSetup.Validate("ITOS Company Name", CompanyName);
                    Evaluate(InterCompSyncSetup."ITOS Status", Status);
                    InterCompSyncSetup.Insert();

                    Clear(InterCompSyncSetup);
                    InterCompSyncSetup.Reset();
                    InterCompSyncSetup.SetCurrentKey("ITOS Table No.", "ITOS Primary Key 1", "ITOS Primary Key 2", "ITOS Primary Key 3", "ITOS Company Name");
                    InterCompSyncSetup.SetRange("ITOS Table No.", Database::Item);
                    InterCompSyncSetup.SetRange("ITOS Primary Key 1", ItemNo);
                    InterCompSyncSetup.SetRange("ITOS Company Name", CompanyName);

                    if InterCompSyncSetup.FindFirst() then
                        if SendToIC and (InterCompSyncSetup."ITOS Status" = InterCompSyncSetup."ITOS Status"::Active) then
                            ICSyncMgt.CreateSyncLogForItem(ItemRec, InterCompSyncSetup);

                    currXMLport.Skip();
                end;

            }
        }

    }

    trigger OnPreXmlPort()
    var
        myInt: Integer;
        Companies: Record Company;
    begin
        FirstLine := true;

        SendToIC := false;
        if ICSetup.Get() then
            SendToIC := ICSetup."ITOS Sync Items to IC";

        MyDialog.Open('Item No.: #1###############################################################\Company: #2###############################################################');

    end;

    trigger OnPostXmlPort()
    begin
        MyDialog.Close();
    end;


    var
        FirstLine: Boolean;
        EntryNo: Integer;
        SendToIC: Boolean;
        ICSetup: Record "IC Setup";
        ICSyncMgt: Codeunit "ITOS IC Sync Mgt.";
        MyDialog: Dialog;
        count: Integer;
}