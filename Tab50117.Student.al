table 50117 Student
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Matrikelnummer"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Studiengang"; Text[50])
        {
            DataClassification = CustomerContent;

        }

    }

    keys
    {
        key(PK; "Student ID")
        {
            Clustered = true;
        }
    }

}