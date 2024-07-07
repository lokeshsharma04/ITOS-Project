page 52108 "Top Managment Activities"
{
    Caption = 'Top Managment Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";

    layout
    {
        area(content)
        {
            cuegroup("Sales and Collection")
            {
                Caption = 'Sales and Collection';
                field("Month Sales"; Rec."AME Month Sales")
                {
                    AccessByPermission = TableData "Sales Header" = R;
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer Ledger Entries";
                    ToolTip = 'Specifies the number of sales quotes that are not yet converted to invoices or orders.';
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Quote';
                        Image = NewSalesQuote;
                        RunObject = Page "Sales Quote";
                        RunPageMode = Create;
                        ToolTip = 'Offer items or services to a customer.';
                    }
                    action("New Sales Order")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Order';
                        RunObject = Page "Sales Order";
                        RunPageMode = Create;
                        ToolTip = 'Create a new sales order for items or services that require partial posting.';
                    }
                }
            }
            cuegroup("Sales Quotes - Status")
            {
                Caption = 'Sales Quotes - Status';

                actions
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Up Cues")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Set Up Cues';
                Image = Setup;
                ToolTip = 'Set up the cues (status tiles) related to the role.';

                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CueSetup.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        DocExchServiceSetup: Record "Doc. Exch. Service Setup";
    begin
        CalculateCueFieldValues;
        ShowDocumentsPendingDodExchService := false;
        if DocExchServiceSetup.Get then
            ShowDocumentsPendingDodExchService := DocExchServiceSetup.Enabled;
    end;

    trigger OnOpenPage()
    var
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
        ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetRespCenterFilter;
        Rec.SetRange("Date Filter", 0D, WorkDate - 1);
        Rec.SetFilter("Date Filter2", '>=%1', WorkDate);
        Rec.SetFilter("User ID Filter", UserId);

        RoleCenterNotificationMgt.ShowNotifications;
        ConfPersonalizationMgt.RaiseOnOpenRoleCenterEvent;

        // if PageNotifier.IsAvailable then begin
        //     PageNotifier := PageNotifier.Create;
        //     PageNotifier.NotifyPageReady;
        // end;
    end;

    var

        cueSEtup: Codeunit "Cues And KPIs";
        UserTaskManagement: Codeunit "User Task Management";
        // [RunOnClient]
        // [WithEvents]
        // PageNotifier: DotNet PageNotifier;
        ShowDocumentsPendingDodExchService: Boolean;

    local procedure CalculateCueFieldValues()
    begin
        if Rec.FieldActive("Average Days Delayed") then
            Rec."Average Days Delayed" := Rec.CalculateAverageDaysDelayed;

        if Rec.FieldActive("Ready to Ship") then
            Rec."Ready to Ship" := Rec.CountOrders(Rec.FieldNo("Ready to Ship"));

        if Rec.FieldActive("Partially Shipped") then
            Rec."Partially Shipped" := Rec.CountOrders(Rec.FieldNo("Partially Shipped"));

        if Rec.FieldActive(Delayed) then
            Rec.Delayed := Rec.CountOrders(Rec.FieldNo(Delayed));
    end;

    // trigger PageNotifier::PageReady()
    // var
    //     NetPromoterScoreMgt: Codeunit "Net Promoter Score Mgt.";
    // begin
    //     NetPromoterScoreMgt.ShowNpsDialog;
    // end;
}

