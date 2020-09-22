import ballerina/io;

const ACCOUNT_NOT_FOUND = "AccountNotFound";

const INVALID_ACCOUNT_ID = "InvalidAccountID";

public function main() {
    int|error negResult = getAccountBalance(-1);
    if (negResult is error) {
        io:println("Error returned:", negResult.message());
    }

    int|error invalidResult = getAccountBalance(200);
    if (invalidResult is error) {
        io:println("Error returned:", invalidResult.message());
    }
}

function getAccountBalance(int accountID) returns int|error {
     if (accountID < 0) {
         // Creates an error with "InvalidAccountID" as the reason if
         //`accountID` is less than zero.
         error invalidAccoundIdError = error(INVALID_ACCOUNT_ID, accountID = accountID);
         // Returns the error. Invokable return type should be assignable to the returned error type.
         fail invalidAccoundIdError;
     } else if (accountID > 100) {
         // Returns an error with "AccountNotFound" as the reason if
         //`accountID` is greater than hundred.
         error accountNotFoundError = error(ACCOUNT_NOT_FOUND, accountID = accountID);
         fail accountNotFoundError;
     }
     return 600;
}
