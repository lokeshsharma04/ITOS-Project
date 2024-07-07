codeunit 52105 ReverseRevenueMgmt
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; PreviewMode: Boolean;
     RetRcpHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; SalesInvHdrNo: Code[20];
    SalesShptHdrNo: Code[20]; var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    var SalesHeader: Record "Sales Header"; WhseReceiv: Boolean; WhseShip: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";

    begin
        if PreviewMode then
            exit;

        //check if FOC or POS entries creation is enabled.
        if SalesSetup.Get() then begin
            if SalesSetup."AME Reverse Rev. For FOC Items" OR SalesSetup."AME Reverse Rev. For POS Items" then
                CheckAndCreateFOCAndPOSReversalEntries(SalesInvHdrNo, true);
        end;


    end;

    procedure CheckAndCreateFOCAndPOSReversalEntries(SalesInvHdrNo: Code[20]; PostEntry: Boolean)
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";

        GenPostingSetup: Record "General Posting Setup";
        // Customer: Record Customer;
        // Item: Record Item;
        GenJnltemp: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        NoSeries: Record "No. Series";
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        LineAmount: Decimal;
        GeneralJnlLineType: Enum "Gen. Journal Account Type";
        SalesSetup: Record "Sales & Receivables Setup";
        LineType: Option "Item","Customer","VAT";
        TotalFocPosAmt: Decimal;
        GenJnlPostBatch: Codeunit "Gen. Jnl.-Post Batch";
        GenJnlLine: Record "Gen. Journal Line";
        VATAmount: Decimal;
    begin
        LineAmount := 0;
        DocNo := '';
        TotalFocPosAmt := 0;
        if SalesInvHeader.Get(SalesInvHdrNo) then begin
            if CheckFOCOrPOSLinesExists(SalesInvHeader, SalesInvLine, SalesSetup) then begin
                SalesSetup.TestField("AME Revenue Adj. Templ. Name");
                SalesSetup.TestField("AME Revenue Adj. Batch");

                // GenJnltemp.Get(SalesSetup."AME Revenue Adj. Templ. Name");
                // GenJnlBatch.Get(GenJnltemp.Name, SalesSetup."AME Revenue Adj. Batch");
                // if NoSeries.Get(GenJnlBatch."No. Series") then
                //     DocNo := NoSeriesMgmt.GetNextNo(NoSeries.Code, Today, false);

                if SalesInvLine.FindSet() then begin
                    repeat
                        GenPostingSetup.Get(SalesInvLine."Gen. Bus. Posting Group", SalesInvLine."Gen. Prod. Posting Group");
                        GenPostingSetup.TestField("AME Sales Revn. Reversal Acc.");
                        GenPostingSetup.TestField("AME Sales VAT Reversal Acc.");
                        LineAmount := SalesInvLine.Amount;
                        VATAmount := SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                        TotalFocPosAmt += SalesInvLine."Amount Including VAT";
                        //LineAmount := LineAmount - VATAmount;

                        InsertFOCOrPOSGenJnlLine(SalesInvHeader, SalesInvLine, DocNo, LineAmount * -1, LineType::Item);
                        if VATAmount <> 0 then
                            InsertFOCOrPOSGenJnlLine(SalesInvHeader, SalesInvLine, DocNo, VATAmount * -1, LineType::Item);
                    until SalesInvLine.Next() = 0;

                    if TotalFocPosAmt <> 0 then begin
                        InsertFOCOrPOSGenJnlLine(SalesInvHeader, SalesInvLine, DocNo, TotalFocPosAmt, LineType::Customer);
                        if PostEntry then begin
                            GenJnlLine.Reset();
                            GenJnlLine.SetRange("Journal Template Name", SalesSetup."AME Revenue Adj. Templ. Name");
                            GenJnlLine.SetRange("Journal Batch Name", SalesSetup."AME Revenue Adj. Batch");
                            if DocNo <> '' then
                                GenJnlLine.SetRange("Document No.", DocNo);
                            if GenJnlLine.FindFirst() then
                                GenJnlPostBatch.Run(GenJnlLine);
                        end;
                    end;
                end;
            end;
        end;
    end;

    local procedure InsertFOCOrPOSGenJnlLine(SalesInvHeader: Record "Sales Invoice Header"; SalesInvLine: Record "Sales Invoice Line"; var DocNo: Code[20]; LineAmount: Decimal; LineType: Option "Item","Customer","VAT")
    var
        GenJnlLine: Record "Gen. Journal Line";
        Descr: Label '%1 reversal for %2';
        GenPostingSetup: Record "General Posting Setup";
        GenJnltempName: Code[10];
        GenJnlBatchName: Code[10];
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get();
        SalesSetup.TestField("AME Revenue Adj. Templ. Name");
        SalesSetup.TestField("AME Revenue Adj. Batch");


        GenJnlBatchName := SalesSetup."AME Revenue Adj. Batch";
        GenJnltempName := SalesSetup."AME Revenue Adj. Templ. Name";

        GenJnlLine.Init();
        GenJnlLine.SetHideValidation(true);
        GenJnlLine.Validate("Journal Template Name", GenJnltempName);
        GenJnlLine.Validate("Journal Batch Name", GenJnlBatchName);
        GenJnlLine.Validate("Line No.", GenJnlLine.GetNewLineNo(GenJnltempName, GenJnlBatchName));
        if DocNo <> '' then
            GenJnlLine.Validate("Document No.", DocNo);

        GenJnlLine.SetUpNewLine(GenJnlLine, 0, false);
        GenJnlLine.TestField("Document No.");
        DocNo := GenJnlLine."Document No.";

        GenJnlLine.Validate("Posting Date", SalesInvHeader."Posting Date");
        GenJnlLine.Validate("Document Date", SalesInvHeader."Document Date");
        GenJnlLine.Validate("External Document No.", SalesInvHeader."No.");

        case LineType of
            LineType::Item:
                begin
                    GenPostingSetup.Get(SalesInvLine."Gen. Bus. Posting Group", SalesInvLine."Gen. Prod. Posting Group");

                    GenJnlLine.Validate("Account Type", GenJnlLine."Account Type"::"G/L Account");
                    GenJnlLine.Validate("Account No.", GenPostingSetup."AME Sales Revn. Reversal Acc.");

                    GenJnlLine.Validate(Description, StrSubstNo(Descr, Format(SalesInvLine."AME Prod. Posting Type"), SalesInvHeader."No."));

                    GenJnlLine.Validate("Dimension Set ID", SalesInvLine."Dimension Set ID");
                end;
            LineType::Customer:
                begin
                    GenJnlLine.Validate("Account Type", GenJnlLine."Account Type"::Customer);
                    GenJnlLine.Validate("Account No.", SalesInvHeader."Bill-to Customer No.");
                    GenJnlLine.Validate(Description, StrSubstNo(Descr, Format(SalesInvLine."AME Prod. Posting Type"), SalesInvHeader."No."));
                    GenJnlLine.Validate("Dimension Set ID", SalesInvHeader."Dimension Set ID");
                end;
            LineType::VAT:
                begin
                    GenPostingSetup.Get(SalesInvLine."Gen. Bus. Posting Group", SalesInvLine."Gen. Prod. Posting Group");

                    GenJnlLine.Validate("Account Type", GenJnlLine."Account Type"::"G/L Account");
                    GenJnlLine.Validate("Account No.", GenPostingSetup."AME Sales VAT Reversal Acc.");

                    GenJnlLine.Validate(Description, StrSubstNo(Descr, Format(SalesInvLine."AME Prod. Posting Type") + ' VAT ', SalesInvHeader."No."));

                    GenJnlLine.Validate("Dimension Set ID", SalesInvLine."Dimension Set ID");

                end;
        end;

        GenJnlLine.Validate("Currency Code", SalesInvHeader."Currency Code");
        GenJnlLine.Validate(Amount, LineAmount);

        GenJnlLine.Insert(True);
    end;

    local procedure SalesSetupTestField(SalesSetup: Record "Sales & Receivables Setup")
    begin
        if (SalesSetup."AME Reverse Rev. For FOC Items") or (SalesSetup."AME Reverse Rev. For POS Items") then begin
            SalesSetup.TestField("AME Revenue Adj. Batch");
            SalesSetup.TestField("AME Revenue Adj. Templ. Name");
        end
    end;

    local procedure GetPostingTypeFilter(var SalesInvLine: Record "Sales Invoice Line"; SalesSetup: Record "Sales & Receivables Setup"): Boolean
    begin
        if (SalesSetup."AME Reverse Rev. For FOC Items") And (SalesSetup."AME Reverse Rev. For POS Items") then begin
            SalesInvLine.SetFilter("AME Prod. Posting Type", '%1|%2', SalesInvLine."AME Prod. Posting Type"::FOC, SalesInvLine."AME Prod. Posting Type"::POS);
            Exit(true);
        end
        else
            if (SalesSetup."AME Reverse Rev. For FOC Items") then begin
                SalesInvLine.SetRange("AME Prod. Posting Type", SalesInvLine."AME Prod. Posting Type"::FOC);
                Exit(true);
            end
            else
                if SalesSetup."AME Reverse Rev. For POS Items" then begin

                    SalesInvLine.SetRange("AME Prod. Posting Type", SalesInvLine."AME Prod. Posting Type"::POS);
                    Exit(true);
                end
                else
                    exit(false);
    end;

    procedure CheckFOCOrPOSLinesExists(SalesInvHeader: Record "Sales Invoice Header"; var SalesInvLine: Record "Sales Invoice Line"; Var SalesSetup: Record "Sales & Receivables Setup"): Boolean
    begin
        SalesSetup.Get();
        SalesInvLine.Reset();
        SalesInvLine.SetCurrentKey("Document No.", Type, "No.", "AME Prod. Posting Type");
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        SalesInvLine.SetFilter("No.", '<>%1', '');
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        if GetPostingTypeFilter(SalesInvLine, SalesSetup) then begin

            // if SalesInvLine.FindFirst() then begin
            //     SalesSetupTestField(SalesSetup);
            //     exit(true)
            // end;
            exit(SalesInvLine.FindFirst());
        end else
            exit(false)
    end;
}
