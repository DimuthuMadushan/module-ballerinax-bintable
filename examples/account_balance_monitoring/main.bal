// Reports the account balance and fails when a lookup of a sample BIN fails.

import ballerina/io;
import ballerinax/bintable;

configurable string apiKey = ?;
configurable string sampleBin = ?;

public function main() returns error? {
    bintable:Client bintableClient = check new ({apiKey});

    // Step 1: Read the account balance and expiry.
    bintable:ResponseItem balance = check bintableClient->getBalance();
    io:println("Balance status: ", balance.message, " ", balance.data);

    // Step 2: Verify the key can serve BIN lookups. A failure is returned to the caller.
    bintable:ResponseItem lookup = check bintableClient->lookupBin(sampleBin);
    io:println("Lookup result ", lookup.result, ": ", lookup.message);
}
