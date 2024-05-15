table 50118 Exam
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Exam ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Title"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Subject"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Exam ID")
        {
            Clustered = true;
        }
    }


}