page 52150 "AME Gen Jnl Lines"
{
    AutoSplitKey = true;
    Caption = 'Pending Gen Jnl Lines';
    PageType = List;
    SourceTable = "Gen. Journal Line";

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

            }
        }
    }
}