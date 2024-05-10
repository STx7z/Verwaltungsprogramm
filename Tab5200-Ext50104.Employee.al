tableextension 50104 Tab5200 extends Employee
{
    fields
    {
        field(50000; "Führerschein"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Keinen","PKW","LKW";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}