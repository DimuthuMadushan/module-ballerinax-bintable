// Reports the account balance and warns when a lookup of a sample BIN fails.

import ballerina/io;
import ballerinax/bintable;

configurable string apiKey = ?;
configurable string sampleBin = ?;

public function main() returns error? {
    bintable:Client bintableClient = check new ({apiKey});

    // Step 1: Read the account balance and expiry.
    bintable:ResponseItem[] balance = check bintableClient->getBalance();
    foreach bintable:ResponseItem item in balance {
        io:println("Balance status: ", item.message, " ", item.data);
    }

    // Step 2: Verify the key can serve BIN lookups.
    bintable:ResponseItem[]|error lookup = bintableClient->lookupBin(sampleBin);
    if lookup is error {
        io:println("Lookup failed: ", lookup.message());
        return;
    }
    io:println("Lookup returned ", lookup.length(), " record(s).");
}
