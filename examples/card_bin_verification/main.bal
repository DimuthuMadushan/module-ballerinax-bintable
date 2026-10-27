// Looks up the card details of a BIN after checking that the account has balance left.

import ballerina/io;
import ballerinax/bintable;

configurable string apiKey = ?;
configurable string bin = ?;

public function main() returns error? {
    bintable:Client bintableClient = check new ({apiKey});

    // Step 1: Check the remaining balance before spending a lookup.
    bintable:ResponseItem balance = check bintableClient->getBalance();
    io:println("Account balance: ", balance);

    // Step 2: Look up the card details of the BIN.
    bintable:ResponseItem details = check bintableClient->lookupBin(bin);
    io:println("Result ", details.result, ": ", details.message, " - ", details.data);
}
