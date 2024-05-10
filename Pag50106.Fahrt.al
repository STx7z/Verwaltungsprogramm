page 50106 Fahrt
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrt;

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                field(Fahrer; Rec.Fahrer)
                {
                    ApplicationArea = All;

                }
                field(Nummer; Rec.Nummer)
                {
                    ApplicationArea = All;
                    Editable = false;


                }
                field(Fahrzeug; Rec.Fahrzeug)
                {
                    ApplicationArea = All;

                }
                field(Fahrtbeginn; Rec.Fahrtbeginn)
                {
                    ApplicationArea = All;

                }
                field(Fahrtende; Rec.Fahrtende)
                {
                    ApplicationArea = All;

                }
                field("Zweck der Fahrt"; Rec."Zweck der Fahrt")
                {
                    ApplicationArea = All;

                }
                field("KM Fahrtbeginn;"; Rec."KM Fahrtbeginn")
                {
                    ApplicationArea = All;

                }
                field("KM Fahrtende"; Rec."KM Fahrtende")
                {
                    ApplicationArea = All;

                }
                field("Gefahrene KM"; Rec."Gefahrene KM")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Exportieren als XML")
            {
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    Xmlport.Run(50111, false, false);
                end;
            }
            action("Fahrten importieren")
            {
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    Xmlport.Run(50113, false, true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}