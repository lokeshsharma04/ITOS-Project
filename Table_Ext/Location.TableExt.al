tableextension 52153 "Location Ext" extends Location
{
    fields
    {
        field(52100; "AME Create Pos. Adj. EOR"; Boolean)
        {
            Caption = 'Create Pos. Adj. Entries on Receipt';
            DataClassification = CustomerContent;
        }
        field(52101; "AME Adj. Template Name"; Code[10])
        {
            Caption = 'Adjustment Template Name';
            DataClassification = CustomerContent;
            TableRelation = "Warehouse Journal Template";
        }
        field(52102; "AME Adj. Batch Name"; Code[10])
        {
            Caption = 'Adjustment Batch Name';
            DataClassification = CustomerContent;
            TableRelation = "Warehouse Journal Batch".Name where("Journal Template Name" = field("AME Adj. Template Name"));
        }
        field(52103; "AME Adjustment Bin Code"; Code[20])
        {
            Caption = 'Adjustment Bin Code 2';
            DataClassification = CustomerContent;
            TableRelation = Bin.Code where("Location Code" = field(Code));

        }
    }
    var

}
