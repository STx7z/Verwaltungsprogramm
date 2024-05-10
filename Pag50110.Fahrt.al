page 50110 "Fahrt List Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Fahrtbeginn; Rec.Fahrtbeginn)
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
}