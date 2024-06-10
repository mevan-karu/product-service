import ballerina/http;
import ballerina/log;

type Product record {
    string name;
    float interestRate;
};

final Product[] dummyProductList = [
    {name: "Money Saver Account", interestRate: 4.5},
    {name: "Double Saver Account", interestRate: 5.0},
    {name: "Super Saver Account", interestRate: 5.5}
];

# A dummy service to list services offered by the bank.
# bound to port `9090`.
service /product\-service on new http:Listener(9089) {

    # A resource function to list products offered by the bank.
    # + return - Product list.
    resource function get products() returns @http:Cache {maxAge: 300} Product[] {
        
        log:printInfo("Returning product list to the client.");
        return dummyProductList;
    }
}
