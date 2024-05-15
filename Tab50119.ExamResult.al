table 50119 ExamResult
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Result ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Student ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Exam ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student"."Student ID";

        }
        field(4; "Grade"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Attempt"; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Result ID")
        {
            Clustered = true;
        }
    }
}