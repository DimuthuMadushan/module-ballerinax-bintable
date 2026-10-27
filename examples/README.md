# Examples

The `ballerinax/bintable` connector provides practical examples illustrating usage in various scenarios.

1. [Card BIN verification](./card_bin_verification/card_bin_verification.md) - Check the account balance, then look up the card details of a BIN.
2. [Account balance monitoring](./account_balance_monitoring/account_balance_monitoring.md) - Report the account balance and verify that the key can serve lookups.

## Prerequisites

1. A Bintable API key from [bintable.com](https://bintable.com).

2. A `Config.toml` file in the example directory with the values described in the example's documentation.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
