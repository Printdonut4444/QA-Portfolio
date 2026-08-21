page 50100 "QA Customer API"
{
    PageType = API;

    APIPublisher = 'donut';
    APIGroup = 'qa';
    APIVersion = 'v1.0';

    EntityName = 'customer';
    EntitySetName = 'customers';

    SourceTable = "Customer API";

    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(no; Rec."No.")
            {
            }

            field(name; Rec."Name")
            {
            }

            field(email; Rec."Email")
            {
            }

            field(phoneNo; Rec."Phone No.")
            {
            }

            field(address; Rec."Address")
            {
            }

            field(city; Rec."City")
            {
            }

            field(country; Rec."Country")
            {
            }

            field(postalCode; Rec."Postal Code")
            {
            }

            field(customerType; Rec."Customer Type")
            {
            }

            field(status; Rec."Status")
            {
            }

            field(registrationDate; Rec."Registration Date")
            {
            }

            field(lastModifiedDate; Rec."Last Modified Date")
            {
            }

            field(creditLimit; Rec."Credit Limit")
            {
            }

            field(currencyCode; Rec."Currency Code")
            {
            }

            field(marketingConsent; Rec."Marketing Consent")
            {
            }
        }
    }
}