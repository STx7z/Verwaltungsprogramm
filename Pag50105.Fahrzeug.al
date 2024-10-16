page 50105 Fahrzeug
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrzeug;

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                field(Kennzeichen; Rec.Kennzeichen)
                {
                    ApplicationArea = All;

                }
                field(Typ; Rec.Typ)
                {
                    ApplicationArea = All;

                }
                field(Hersteller; Rec.Hersteller)
                {
                    ApplicationArea = All;

                }
                field(Modell; Rec.Modell)
                {
                    ApplicationArea = All;

                }
                field(Kraftstoff; Rec.Kraftstoff)
                {
                    ApplicationArea = All;

                }
                field(Kilometerstand; Rec.Kilometerstand)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Fahrt Liste";
                    Editable = false;


                }
                field("Anhängerkupplung"; Rec."Anhängerkupplung")
                {
                    ApplicationArea = All;

                }
            }
            group(Abschreibung)
            {
                field(Kaufpreis; Rec.Kaufpreis)
                {
                    ApplicationArea = All;

                }
                field(Kaufdatum; Rec.Kaufdatum)
                {
                    ApplicationArea = All;

                }

                field("Afa-Methode"; "Afa-Methode")
                {
                    ApplicationArea = All;

                }

                field(Restbuchwert; Rec.Restbuchwert)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Abschreibung Liste";
                    Editable = false;

                }
            }
        }

    }
    actions
    {
        area(Processing)
        {

            action("Fahrzeuge importieren")
            {
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    Xmlport.Run(50112, false, true);
                end;
            }


            action("Restbuchwert berechnen")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CashReceiptJournal;

                trigger OnAction()
                begin
                    case "Afa-Methode" of
                        "Afa-Methode"::linear:
                            Afa.Linear(Rec.Kennzeichen);
                        "Afa-Methode"::degressiv:
                            Afa.Degressiv(Rec.Kennzeichen);
                        "Afa-Methode"::kombiniert:
                            Afa.Kombiniert(Rec.Kennzeichen);
                        "Afa-Methode"::leistungsabh:
                            Afa."Leistungsabhängig"(Rec.Kennzeichen);
                    end;
                end;
            }


        }


    }

    var
        "Afa-Methode": Option linear,degressiv,kombiniert,leistungsabh;

        AFA: Codeunit Afa;
}