pageextension 50120 "GeneralLedgerEntriesExt" extends "General Ledger Entries"
{

    layout
    {
        addafter("Source Code")

        {
            field("Source Name"; "Source Name")

            {
                ApplicationArea = ALL;
                caption = 'Source Name';

            }

        }
    }


}