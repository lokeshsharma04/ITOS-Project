page 52124 AME_Cost_Worksheet
{
    ApplicationArea = All;
    Caption = 'Cost Worksheet';
    PageType = Worksheet;
    SourceTable = "AME Cost_Worksheet";
    InsertAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; CostsheetDocNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Document Type"; CostsheetDocType)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Charges"; TotalCharges)
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnValidate()
                    var
                    begin

                    end;
                }
                field("Total Invoice Value"; "TotalInvoiceValue")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Landed Cost Factor"; LandedCostFactor)
                {
                    ApplicationArea = All;
                    Editable = false;
                }


            }

            repeater(Control1)
            {
                field("Vendor No"; Rec."AME_Vendor_No")
                {
                    ApplicationArea = All;
                    Visible = false;

                }
                field("Vendor Name"; Rec.AME_Vendor_Name)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Supply From"; Rec."AME_Supply_From")
                {
                    ApplicationArea = All;

                }
                field("Transport Type"; Rec."AME_Transport_Type")
                {
                    ApplicationArea = All;

                }
                field("Shipment Type"; Rec.AME_Shipment_Method)
                {
                    ApplicationArea = All;
                }
                field("Charge Code"; Rec."AME_Charge_Code")
                {
                    ApplicationArea = All;
                }
                field("Charge Type"; Rec."AME_Charge_Type")
                {
                    ApplicationArea = All;
                }
                field("Charge Amount"; Rec."AME_Charge_Amount")
                {
                    ApplicationArea = All;
                }
                field("Service Vendor No"; Rec."AME_Service_Vendor_No")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(GetCharges)
            {
                ApplicationArea = All;
                Caption = 'Get Charges';

                trigger OnAction()
                var
                    MyCodeUnit: Codeunit "Event Subscriber";
                    WarehouseReptH: Record "Warehouse Receipt Header";
                begin
                    if Rec.AME_Document_Type = rec.AME_Document_Type::"Warehouse Receipt" then begin
                        if WarehouseReptH.Get(CostsheetDocNo) then begin
                            CheckIfPOReleased(WarehouseReptH);
                            MyCodeUnit.GetCharges(WarehouseReptH);
                        end;
                    end;

                    CalculateAmount();
                end;
            }
            action(ApplyCharges)
            {
                ApplicationArea = All;
                Caption = 'Apply Charges';
                trigger OnAction()
                var
                    LandedCostAmt: Decimal;
                begin
                    CheckIfServiceVendorNotBlank();
                    WarehouseRecptLine.Reset();
                    WarehouseRecptLine.SetRange("No.", CostsheetDocNo);
                    WarehouseRecptLine.SetRange("Source Document", WarehouseRecptLine."Source Document"::"Purchase Order");
                    if WarehouseRecptLine.FindSet() then begin
                        repeat
                            WarehouseRecptLine."Landed Cost %" := LandedCostFactor;
                            LandedCostAmt := Round((WarehouseRecptLine."Landed Cost %" * WarehouseRecptLine."Line Amount") / 100, 2, '=');
                            WarehouseRecptLine."Landed Cost Amt." := LandedCostAmt;
                            WarehouseRecptLine.Modify();
                        until WarehouseRecptLine.Next() = 0;
                        CurrPage.Close();
                    end;
                end;
            }
        }

    }

    Var
        ToCostWorksheet: Record "AME Cost_Worksheet";

        LandedCostFactor: Decimal;
        "TotalInvoiceValue": Decimal;
        TotalCharges: Decimal;
        WarehouseRecptLine: Record "Warehouse Receipt Line";

        CostsheetDocType: Enum "AME Cost Worksheet Doc. Type";
        CostsheetDocNo: Code[20];
        CostsheetVendorNo: Code[20];

    procedure InitDetails(DocType: Enum "AME Cost Worksheet Doc. Type"; DocNo: Code[20]; VendorNo: Code[20])
    begin
        CostsheetDocType := DocType;
        CostsheetDocNo := DocNo;
        CostsheetVendorNo := VendorNo;
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        CalculateAmount();
    end;

    local procedure GetTotalCharges()
    var
        CostWorksheet: Record "AME Cost_Worksheet";
    begin
        TotalCharges := 0;
        CostWorksheet.Reset();
        CostWorksheet.SetRange(AME_Document_Type, CostsheetDocType);
        CostWorksheet.SetRange(AME_Document_No, CostsheetDocNo);
        CostWorksheet.SetRange(AME_Vendor_No, CostsheetVendorNo);
        if CostWorksheet.FindFirst() then begin
            CostWorksheet.CalcSums(AME_Charge_Amount, AME_Charge);
            TotalCharges := CostWorksheet.AME_Charge_Amount;
            //LandedCostFactor := CostWorksheet.AME_Charge;
        end else begin
            TotalCharges := 0;
        end;




    end;

    local procedure GetLandedCostFactorCharges()
    var
        myInt: Integer;
    begin

        TotalInvoiceValue := 0;
        WarehouseRecptLine.SetCurrentKey("No.", "Line No.");
        WarehouseRecptLine.SetRange("No.", CostsheetDocNo);
        WarehouseRecptLine.SetRange("Source Document", WarehouseRecptLine."Source Document"::"Purchase Order");
        if WarehouseRecptLine.FindSet() then begin
            WarehouseRecptLine.CalcSums("Line Amount");
            TotalInvoiceValue := WarehouseRecptLine."Line Amount";
        end;

        if TotalInvoiceValue <> 0 then
            LandedCostFactor := Round((TotalCharges / TotalInvoiceValue) * 100, 0.01, '=')
        else
            LandedCostFactor := 0;
    end;

    trigger OnAfterGetRecord()
    var
    begin
        CalculateAmount();
    end;

    local procedure InitializeCostPrctAndAmt()
    var
        WhseRcptLine: Record "Warehouse Receipt Line";
    begin
        WhseRcptLine.Reset();
        WhseRcptLine.SetRange("No.", CostsheetDocNo);
        WhseRcptLine.SetRange("Source Document", WhseRcptLine."Source Document"::"Purchase Order");
        if WhseRcptLine.FindFirst() then
            if Not Confirm('Landed cost will be removed from Warehouse Receipt Lines', false) then
                Error('');
        repeat
            WhseRcptLine."Landed Cost %" := 0;
            WhseRcptLine."Landed Cost Amt." := 0;
            WhseRcptLine.Modify();
        until WhseRcptLine.Next() = 0;
    end;

    local procedure CheckIfPOReleased(WarehouseReptH: Record "Warehouse Receipt Header")
    var
        WarehouseRcptLine: Record "Warehouse Receipt Line";
        PurchaseHdr: Record "Purchase Header";
    begin
        WarehouseRcptLine.Reset();
        WarehouseRcptLine.SetRange("No.", WarehouseReptH."No.");
        WarehouseRcptLine.SetRange("Source Document", WarehouseRcptLine."Source Document"::"Purchase Order");
        if WarehouseRcptLine.FindSet() then
            repeat
                PurchaseHdr.Get(PurchaseHdr."Document Type"::Order, WarehouseRcptLine."Source No.");
                PurchaseHdr.TestField(Status, PurchaseHdr.status::Released);
            until WarehouseRcptLine.Next() = 0;
    end;

    local procedure CheckIfServiceVendorNotBlank()
    var
        CostWorkSheet: Record "AME Cost_Worksheet";
    begin
        CostWorkSheet.Reset();
        CostWorkSheet.SetRange(AME_Document_Type, Rec.AME_Document_Type);
        CostWorkSheet.SetRange(AME_Document_No, Rec.AME_Document_No);
        if CostWorkSheet.FindSet() then
            repeat
                CostWorkSheet.TestField(AME_Service_Vendor_No);
            until CostWorkSheet.Next() = 0;
    end;


    trigger OnDeleteRecord(): Boolean
    begin
        InitializeCostPrctAndAmt();
    end;

    procedure CalculateAmount()
    var
    begin
        GetTotalCharges();
        GetLandedCostFactorCharges();
        CurrPage.Update(false);
    end;
}