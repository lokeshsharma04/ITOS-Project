enum 52106 "AME Ship. Confirmation Status"
{
    Extensible = true;

    value(0; Open)
    {
        Caption = 'Open';
    }
    value(10; "Pending Confirmation")
    {
        Caption = 'Pending Confirmation';
    }
    value(20; "Confirmed")
    {
        Caption = 'Confirmed';
    }
    value(30; "Ready to Ship")
    {
        Caption = 'Ready to Ship';
    }
}
