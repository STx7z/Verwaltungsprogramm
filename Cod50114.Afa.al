codeunit 50114 Afa
{
    trigger OnRun()
    begin

    end;

    var

        KFZ: Record Fahrzeug;

        Nutzungsdauer: Integer;

        Kaufjahr: Integer;

        "Aktuelles Jahr": Integer;

        Jahr: Integer;


    procedure Initialisierung(Kennzeichen: Code[20])
    var

    begin
        KFZ.Get(Kennzeichen);
        Case KFZ.Typ of
            KFZ.Typ::Kombi:
                Nutzungsdauer := 6;
            KFZ.Typ::Transporter:
                Nutzungsdauer := 6;
            KFZ.Typ::LKW:
                Nutzungsdauer := 9;
        end;
        "Aktuelles Jahr" := Date2DMY(WorkDate, 3);
        Kaufjahr := Date2DMY(KFZ.Kaufdatum, 3);
        Jahr := Kaufjahr;

    end;

    procedure Linear(Kennzeichen: Code[20])
    var
        Abschreibung: Decimal;
        Abschreibungssatz: Decimal;
        Restbuchwert: Decimal;
    begin
        Initialisierung(Kennzeichen);
        Restbuchwert := KFZ.Kaufpreis;
        Abschreibung := KFZ.Kaufpreis / Nutzungsdauer;
        Abschreibungssatz := 100 / Nutzungsdauer;
        while (Jahr < "Aktuelles Jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) Do begin
            Restbuchwert := Restbuchwert - Abschreibung;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;
        end;
    end;

    procedure Degressiv(Kennzeichen: Code[20])
    var
        Abschreibung: Decimal;
        Abschreibungssatz: Decimal;
        Restbuchwert: Decimal;
    begin
        Initialisierung(Kennzeichen);
        Restbuchwert := KFZ.Kaufpreis;
        Abschreibungssatz := 25 / 100;




        while (Jahr < "Aktuelles Jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) Do begin

            Abschreibung := Restbuchwert * Abschreibungssatz;
            Restbuchwert := Restbuchwert - Abschreibung;


            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;
        end;

    end;

    procedure Kombiniert(Kennzeichen: Code[20])
    var
        Abschreibung: Decimal;
        Restnutzungsdauer: Integer;
        Einmal: Integer;
        Restbuchwert: Decimal;
        Abschreibungssatz: Decimal;

    begin
        Initialisierung(Kennzeichen);
        Restbuchwert := KFZ.Kaufpreis;
        Einmal := 0;
        while (Jahr < "Aktuelles Jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) do begin
            Restnutzungsdauer := (Kaufjahr + Nutzungsdauer) - Jahr;
            if (Restbuchwert * 0.25) > (Restbuchwert / Restnutzungsdauer) then begin
                Abschreibungssatz := 25;
                Abschreibung := Restbuchwert * Abschreibungssatz / 100;
                Restbuchwert := Restbuchwert - Abschreibung;
            end else begin
                if Einmal = 0 then begin
                    Abschreibung := Restbuchwert / Restnutzungsdauer;
                    Einmal := 1
                end;
                Abschreibungssatz := 100 / Restbuchwert * Abschreibung;
                Restbuchwert := Restbuchwert - Abschreibung;
            end;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;
        end;
    end;



    procedure Leistungsabhängig(Kennzeichen: Code[20])
    var
        Restbuchwert: Decimal;
        KMGesamt: Decimal;
        FahrtenKFZ: Record Fahrt;
        FahrtbeginnDatum: Date;
        FahrtbeginnJahr: Integer;
        KMproJahr: array[3000] of Decimal;
        Abschreibungssatz: Decimal;
        Abschreibung: Decimal;
    begin
        Initialisierung(Kennzeichen);
        case KFZ.Typ of
            KFZ.Typ::Transporter:
                KMGesamt := 10000;
            else
                Error('Methode ist nur fuer Fahrzeugtyp Transporter zulaesig!');
        end;
        Restbuchwert := KFZ.Kaufpreis;
        FahrtenKFZ.SetRange(Fahrzeug, Kennzeichen);
        If FahrtenKFZ.Find('-') then
            repeat
                FahrtbeginnDatum := DT2Date(FahrtenKFZ.Fahrtbeginn);
                FahrtbeginnJahr := Date2DMY(FahrtbeginnDatum, 3);
                if (FahrtbeginnJahr < "Aktuelles Jahr") AND (FahrtbeginnJahr < (Kaufjahr + Nutzungsdauer)) then
                    for Jahr := Kaufjahr to ("Aktuelles Jahr" - 1) do
                        if Jahr = FahrtbeginnJahr then
                            KMproJahr[Jahr] := KMproJahr[Jahr] + FahrtenKFZ."Gefahrene KM";
            until FahrtenKFZ.Next = 0;
        Jahr := Kaufjahr;
        while (jahr < "Aktuelles Jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) do begin
            Abschreibungssatz := KMproJahr[Jahr] / KMGesamt * 100;
            Abschreibung := Kfz.Kaufpreis * Abschreibungssatz / 100;
            Restbuchwert := Restbuchwert - Abschreibung;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;
        end;

    end;

    procedure Speicherung(
        Kennzeichen: Code[20];
        Jahr: Integer;
        Abschreibungssatz: Decimal;
        Abschreibungsbetrag: Decimal;
        Restbuchwert: Decimal
    )
    var
        Abschreibungen: Record Abschreibung;
    begin
        begin
            if Abschreibungen.Get(Kennzeichen, Jahr) then begin
                Abschreibungen.Abschreibungssatz := Abschreibungssatz;
                Abschreibungen.Abschreibungsbetrag := Abschreibungsbetrag;
                Abschreibungen.Restbuchwert := Restbuchwert;
                Abschreibungen.Modify;
            end else begin
                Abschreibungen.Fahrzeug := Kennzeichen;
                Abschreibungen.Jahr := Jahr;
                Abschreibungen.Abschreibungssatz := Abschreibungssatz;
                Abschreibungen.Abschreibungsbetrag := Abschreibungsbetrag;
                Abschreibungen.Restbuchwert := Restbuchwert;
                Abschreibungen.Insert;
            end;
        end;

    end;


}