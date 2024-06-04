import ballerina/http;

type Product record {
    string name;
    float interestRate;
};

final Product[] dummyProductList = [
    {name: "Savings Account", interestRate: 4.5},
    {name: "Fixed Deposit", interestRate: 9.5},
    {name: "Personal Loan", interestRate: 12.0}
];

# A dummy service to list services offered by the bank.
# bound to port `9090`.
service /api/v1/product\-service on new http:Listener(9089) {

    # A resource function to list products offered by the bank.
    # + return - Product list.
    resource function get products() returns @http:Cache {maxAge: 300} Product[] {
        
        return dummyProductList;
    }
}
