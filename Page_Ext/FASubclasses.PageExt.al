pageextension 52105 "AME_FA Subclasses" extends "FA Subclasses"
{
    layout
    {
        addafter("Default FA Posting Group")
        {
            field(No_Depreciation_Year; Rec.No_Depreciation_Year)
            {
                Caption = 'No of Depreciation Year';
                ApplicationArea = All;
            }
        }
    }

}
