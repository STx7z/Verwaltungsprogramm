page 50120 Student
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Student";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Student ID"; rec."Student ID")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Matrikelnummer; rec.Matrikelnummer)
                {
                    ApplicationArea = All;

                }
                field(Studiengang; rec.Studiengang)
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

    var
        myInt: Integer;
}