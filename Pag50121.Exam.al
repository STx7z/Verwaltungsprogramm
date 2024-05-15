page 50121 Exam
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Exam";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Exam ID"; Rec."Exam ID")
                {
                    ApplicationArea = All;

                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field(Subject; Rec.Subject)
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