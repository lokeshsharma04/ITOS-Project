xmlport 52102 "AME Dimension Xml"
{
    Caption = 'Dimension';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(Root)
        {

            tableelement("Default Dimension"; "Default Dimension")
            {
                XmlName = 'DefaultDimension';
                textelement(No)
                {
                }
                textelement(DimensionCode)
                {
                }
                textelement(ValueCode)
                {
                }
                textelement(ValuePosting)
                {
                }
                textelement(AllowedValuesfilters)
                {

                }

                trigger OnBeforeInsertRecord()
                var
                    DefaultDimension: Record "Default Dimension";
                    ItemRec: Record Item;
                begin
                    if FirstLine then begin
                        FirstLine := false;
                        currXMLport.Skip();
                    end;
                    MyDialog.Update(1, No);
                    MyDialog.Update(2, DimensionCode);
                    MyDialog.Update(3, ValueCode);

                    Clear(DefaultDimension);
                    if not DefaultDimension.Get(TableNo, No, DimensionCode) then begin
                        Clear(DefaultDimension);
                        DefaultDimension.Init();
                        DefaultDimension.Validate("Table ID", TableNo);
                        DefaultDimension.Validate("No.", No);
                        DefaultDimension.Validate("Dimension Code", DimensionCode);
                        DefaultDimension.Validate("Dimension Value Code", ValueCode);

                        DefaultDimension.Insert();
                    end;
                    DefaultDimension.Validate("Dimension Value Code", ValueCode);

                    if ValuePosting <> '' then
                        Evaluate(DefaultDimension."Value Posting", ValuePosting);
                    if AllowedValuesfilters <> '' then
                        DefaultDimension.Validate("Allowed Values Filter", AllowedValuesfilters);

                    DefaultDimension.Modify(true);

                    currXMLport.Skip();
                end;

            }
        }

    }
    procedure SettableNo(No: Integer)
    var

    begin
        TableNo := No;
    end;


    trigger OnPreXmlPort()
    var
        myInt: Integer;
    begin
        FirstLine := true;

        MyDialog.Open('Item No: #1#####################\Dimension Code: #2#####################\Dimension Value: #3#####################');
    end;

    trigger OnPostXmlPort()
    begin
        MyDialog.Close();
    end;

    var
        FirstLine: Boolean;
        TableNo: Integer;
        Count: Integer;
        MyDialog: Dialog;

}