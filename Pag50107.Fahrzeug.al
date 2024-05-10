page 50107 "Fahrzeug Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrzeug;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field(Kilometerstand; Rec.Kilometerstand)
                {
                    ApplicationArea = All;


                }
            }
        }
        area(Factboxes)
        {
            part(Fahrtlistfactbox; "Fahrt List Factbox")
            {
                SubPageView = sorting(Fahrtbeginn) order(ascending);
                SubPageLink = Fahrzeug = field(Kennzeichen);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Karte)
            {
                ApplicationArea = All;
                RunObject = page Fahrzeug;
                RunPageLink = Kennzeichen = field(Kennzeichen);
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AnalysisView;
                trigger OnAction()
                begin

                end;
            }
        }
    }
}