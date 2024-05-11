report 50115 Fahrerliste
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';


    dataset
    {
        dataitem(Mitarbeiterdaten; Employee)
        {
            column(Number; "No.")
            {

            }
            column(First_Name; "First Name")
            {

            }
            column(Last_Name; "Last Name")
            {

            }
            column(Jo_Title; "Job Title")
            {

            }
            column(Mobile_Phone_No_; "Mobile Phone No.")
            {

            }
            column("Führerschein"; "Führerschein")
            {

            }
        }
    }


}