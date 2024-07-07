codeunit 52106 "AME Adj. Entries On Receipt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(CommitIsSupressed: Boolean; PurchCrMemoHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20];
    var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var PurchaseHeader: Record "Purchase Header")
    var
        whpost: Codeunit "Whse.-Post Receipt";
    begin
        InsertWhseJnlLineforAdjRcptEntries(PurchRcpHdrNo);
    end;

    procedure InsertWhseJnlLineforAdjRcptEntries(var PurchRcpHdrNo: Code[20])
    var
        Location: Record Location;
        PostedWhseRcptHeader: Record "Posted Whse. Receipt Header";
        PostedWhseRcptLine: Record "Posted Whse. Receipt Line";
        DocNo: Code[20];
    begin
        WhseDocNo := '';
        PostedWhseRcptHeader.Reset();
        PostedWhseRcptLine.Reset();
        PostedWhseRcptLine.SetRange("Posted Source Document", PostedWhseRcptLine."Posted Source Document"::"Posted Receipt");
        PostedWhseRcptLine.SetRange("Posted Source No.", PurchRcpHdrNo);
        PostedWhseRcptLine.SetFilter("Excess Qty", '<>%1', 0);
        if PostedWhseRcptLine.FindFirst() then begin
            PostedWhseRcptHeader.Get(PostedWhseRcptLine."No.");
            if Location.Get(PostedWhseRcptHeader."Location Code") And (Location."AME Create Pos. Adj. EOR") then begin
                Location.TestField("AME Adj. Template Name");
                Location.TestField("AME Adj. Batch Name");
                Location.TestField("AME Adjustment Bin Code");
                PostedWhseRcptLine.FindSet();
                repeat
                    CreateWhseItemJnlPosAdj(Location, PostedWhseRcptLine);
                until PostedWhseRcptLine.Next() = 0;
            end;
        end;
    end;

    procedure CreateWhseItemJnlPosAdj(Location: Record Location; PostedWhseRcptLine: Record "Posted Whse. Receipt Line")
    var
        WarehouseItemJnl: Record "Warehouse Journal Line";
    begin
        WarehouseItemJnl.Init();
        WarehouseItemJnl.Validate("Journal Template Name", Location."AME Adj. Template Name");
        WarehouseItemJnl.Validate("Journal Batch Name", Location."AME Adj. Batch Name");
        WarehouseItemJnl.Validate("Location Code", Location.Code);
        WarehouseItemJnl.Validate("Line No.", GetNextLineNoAndDocNo(Location));
        WarehouseItemJnl.Validate("Item No.", PostedWhseRcptLine."Item No.");
        WarehouseItemJnl.Validate("Whse. Document No.", WhseDocNo);
        WarehouseItemJnl.Validate("Whse. Document Type", WarehouseItemJnl."Whse. Document Type"::Receipt);
        WarehouseItemJnl.Validate("Bin Code", Location."AME Adjustment Bin Code");
        WarehouseItemJnl.Validate(Quantity, PostedWhseRcptLine."Excess Qty");
        WarehouseItemJnl.Validate("Unit of Measure Code", PostedWhseRcptLine."Unit of Measure Code");
        WarehouseItemJnl.Validate(Description, PostedWhseRcptLine.Description);
        WarehouseItemJnl.Validate("Registering Date", PostedWhseRcptLine."Starting Date");
        WarehouseItemJnl.Insert(true);
    end;

    procedure GetNextLineNoAndDocNo(Location: Record Location): Integer
    var
        WarehouseJnlLine: Record "Warehouse Journal Line";
        NoSeries: Record "No. Series";
        NoSeriesMgmt: CodeUnit NoSeriesManagement;
        WhseJnlBatch: Record "Warehouse Journal Batch";
    begin
        WarehouseJnlLine.Reset();
        WarehouseJnlLine.SetRange("Journal Template Name", Location."AME Adj. Template Name");
        WarehouseJnlLine.SetRange("Journal Batch Name", Location."AME Adj. Batch Name");
        if WarehouseJnlLine.FindLast() then begin
            WhseDocNo := WarehouseJnlLine."Whse. Document No.";
            exit(WarehouseJnlLine."Line No." + 10000)
        end else begin
            if WhseJnlBatch.Get(Location."AME Adj. Template Name", Location."AME Adj. Batch Name", Location.Code) then
                if NoSeries.Get(WhseJnlBatch."No. Series") then
                    WhseDocNo := NoSeriesMgmt.GetNextNo(NoSeries.Code, today, false);
            exit(10000);
        end;
    end;

    var
        WhseDocNo: Code[20];
}

