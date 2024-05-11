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
                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Get(Rec.Fahrer);
                        Rec."Führerschein" := Employee."Führerschein";
                    end;

                }
                field(Nummer; Rec.Nummer)
                {
                    ApplicationArea = All;
                    Editable = false;


                }
                field(Fahrzeug; Rec.Fahrzeug)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        KFZ: Record Fahrzeug;
                    begin
                        KFZ.Get(Rec.Fahrzeug);
                        KFZ.CalcFields(Kilometerstand);
                        Rec."KM Fahrtbeginn" := KFZ.Kilometerstand;

                    end;



                }
                field(Fahrtbeginn; Rec.Fahrtbeginn)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        FahrtenKFZ: Record Fahrt;
                    begin
                        FahrtenKFZ.SetRange(Fahrzeug, Rec.Fahrzeug);
                        if FahrtenKFZ.Find('-') then
                            repeat
                                if Rec.Fahrtbeginn = FahrtenKFZ.Fahrtbeginn then
                                    Error('Die Fahrt wurde schon erfasst!');
                            until FahrtenKFZ.Next() = 0;

                    end;

                }
                field(Fahrtende; Rec.Fahrtende)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec.Fahrtbeginn > Rec.Fahrtende then
                            Error('Das Fahrtende liegt vor dem Fahrtbeginn!');
                    end;

                }
                field("Zweck der Fahrt"; Rec."Zweck der Fahrt")
                {
                    ApplicationArea = All;

                }
                field("KM Fahrtbeginn;"; Rec."KM Fahrtbeginn")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("KM Fahrtende"; Rec."KM Fahrtende")
                {
                    ApplicationArea = All;


                    trigger OnValidate()

                    begin
                        if Rec."KM Fahrtende" > Rec."KM Fahrtbeginn" then
                            Rec."Gefahrene KM" := Rec."KM Fahrtende" - Rec."KM Fahrtbeginn"
                        else
                            Error('Ungueltige Eingabe');
                    end;

                }
                field("Gefahrene KM"; Rec."Gefahrene KM")
                {
                    ApplicationArea = All;
                    Editable = false;

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