codeunit 50120 "GLEntrySourceName"
{
    //Extent from Code unit 12 function InitGlEntry
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]
    local procedure OnAfterInitGLEntry(VAR GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
        Vend: record vendor;
        Cust: record Customer;
        FixAsset: record "Fixed Asset";
        BankAcc: record "Bank Account";
    begin
        //CRF012>>>
        CASE GLEntry."Source Type" OF
            GLEntry."Source Type"::Customer:
                IF Cust.GET(GLEntry."Source No.") THEN
                    GLEntry."Source Name" := Cust.Name;
            GLEntry."Source Type"::Vendor:
                IF Vend.GET(GLEntry."Source No.") THEN
                    GLEntry."Source Name" := Vend.Name;
            GLEntry."Source Type"::"Bank Account":
                IF BankAcc.GET(GLEntry."Source No.") THEN
                    GLEntry."Source Name" := BankAcc.Name;
            GLEntry."Source Type"::"Fixed Asset":
                IF FixAsset.GET(GLEntry."Source No.") THEN
                    GLEntry."Source Name" := FixAsset.Description;
        END;
        //CRF012<<<
    end;
}