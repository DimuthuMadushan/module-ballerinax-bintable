## Overview

[Bintable](https://bintable.com) is a Bank Identification Number (BIN) lookup service that returns card metadata such as the brand, type and issuer for the leading digits of a payment card, and reports the balance and expiry of the account that is used to make lookups.

The Bintable connector lets Ballerina applications call the Bintable API (version `1.0.0-oas3`) to look up card information by BIN and to check the remaining account balance and expiry.

### Key features

- Look up card brand, type, issuer and country details from a BIN
- Check the account balance and package expiry
- Authenticate with a single API key

## Setup guide

To use the Bintable connector, you need an API key.

1. Create an account on [bintable.com](https://bintable.com) and sign in.

2. Open the account dashboard and copy the API key shown there.

3. Keep the key safe and supply it to the connector through your `Config.toml` file.

## Quickstart

To use the `bintable` connector in your Ballerina application, update the `.bal` file as follows:

1. Import the `bintable` module.

    ```ballerina
    import ballerinax/bintable;
    ```

2. Add the API key to the `Config.toml` file.

    ```toml
    apiKey = "<API_KEY>"
    ```

3. Create a `bintable:Client` with the API key.

    ```ballerina
    configurable string apiKey = ?;

    bintable:Client bintableClient = check new ({apiKey});
    ```

4. Look up a BIN.

    ```ballerina
    public function main() returns error? {
        bintable:ResponseItem _ = check bintableClient->lookupBin("457173");
    }
    ```

## Examples

The `Bintable` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/), covering the following use cases:

1. [Card BIN verification](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/card_bin_verification) - Check the account balance, then look up the card details of a BIN.
2. [Account balance monitoring](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/account_balance_monitoring) - Report the account balance and verify that the key can serve lookups.
