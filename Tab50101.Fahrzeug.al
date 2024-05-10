table 50101 Fahrzeug
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Kennzeichen"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Typ"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Kombi","Transporter","LKW";

        }
        field(3; "Hersteller"; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Modell"; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Kaufpreis"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Kraftstoff"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Benzin","Diesel","Hybrid";
        }
        field(7; "Kilometerstand"; Decimal)
        {
            FieldClass = FlowField;
            DecimalPlaces = 1 : 1;
            CalcFormula = Sum(Fahrt."Gefahrene KM" WHERE(Fahrzeug = FIELD(Kennzeichen)));

        }
        field(8; "Anhängerkupplung"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Kaufdatum"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Restbuchwert"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Min(Abschreibung.Restbuchwert WHERE(Fahrzeug = Field(Kennzeichen)));

        }
    }

    keys
    {
        key(PK; Kennzeichen)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}