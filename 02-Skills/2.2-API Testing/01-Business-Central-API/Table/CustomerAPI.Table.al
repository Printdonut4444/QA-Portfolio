table 50100 "Customer API"
{
    Caption = 'Customer API';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }

        field(3; "Email"; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }

        field(4; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }

        field(5; "Address"; Text[250])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(6; "City"; Text[50])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(7; "Country"; Code[10])
        {
            Caption = 'Country';
            DataClassification = CustomerContent;
        }

        field(8; "Postal Code"; Code[20])
        {
            Caption = 'Postal Code';
            DataClassification = CustomerContent;
        }

        field(9; "Customer Type"; Option)
        {
            Caption = 'Customer Type';
            OptionMembers = Individual,Company;
            DataClassification = CustomerContent;
        }

        field(10; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive,Blocked;
            DataClassification = CustomerContent;
        }

        field(11; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            DataClassification = CustomerContent;
        }

        field(12; "Last Modified Date"; DateTime)
        {
            Caption = 'Last Modified Date';
            DataClassification = CustomerContent;
        }

        field(13; "Credit Limit"; Decimal)
        {
            Caption = 'Credit Limit';
            DecimalPlaces = 2 : 2;
            DataClassification = CustomerContent;
        }

        field(14; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
        }

        field(15; "Marketing Consent"; Boolean)
        {
            Caption = 'Marketing Consent';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(Email; "Email")
        {
        }

        key(Status; "Status")
        {
        }

        key(CustomerType; "Customer Type")
        {
        }
    }
}