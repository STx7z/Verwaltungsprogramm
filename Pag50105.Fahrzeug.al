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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}