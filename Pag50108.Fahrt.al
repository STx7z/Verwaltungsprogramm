page 50108 "Fahrt Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;
    SourceTableView = sorting(Fahrtbeginn) order(ascending);

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Fahrer; Rec.Fahrer)
                {
                    ApplicationArea = All;

                }
                field(Nummer; Rec.Nummer)
                {
                    ApplicationArea = All;


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
                field("Gefahrene KM"; Rec."Gefahrene KM")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Karte)
            {
                ApplicationArea = All;
                RunObject = Page "Fahrt";
                RunPageLink = Nummer = field(Nummer);
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                image = AnalysisView;
                trigger OnAction()
                begin

                end;
            }
        }
    }
}