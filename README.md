# Ballerina Bintable connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-bintable/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-bintable/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-bintable.svg)](https://github.com/ballerina-platform/module-ballerinax-bintable/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/bintable.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fbintable)

## Overview

[Bintable](https://bintable.com) is a Bank Identification Number (BIN) lookup service that returns card metadata such as the brand, type and issuer for the leading digits of a payment card, and reports the balance and expiry of the account that is used to make lookups.

The Bintable connector lets Ballerina applications call the Bintable API (version `1.0.0-oas3`) to look up card information by BIN and to check the remaining account balance and expiry.

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
        bintable:ResponseItem[] _ = check bintableClient->lookupBin("457173");
    }
    ```

## Examples

The `Bintable` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/), covering the following use cases:

1. [Card BIN verification](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/card_bin_verification) - Check the account balance, then look up the card details of a BIN.
2. [Account balance monitoring](https://github.com/ballerina-platform/module-ballerinax-bintable/tree/main/examples/account_balance_monitoring) - Report the account balance and verify that the key can serve lookups.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`bintable` package](https://central.ballerina.io/ballerinax/bintable/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
