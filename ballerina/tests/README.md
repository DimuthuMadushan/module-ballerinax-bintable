# Running Tests

## Prerequisites

You need a Bintable API key to run the tests against the live service. Set it as an environment variable:

```bash
export BINTABLE_API_KEY="<your-api-key>"
```

## Running the tests

The tests run against a local mock server by default:

```bash
bal test
```

To run them against the live Bintable API, set `IS_LIVE_SERVER` and the API key:

```bash
IS_LIVE_SERVER=true bal test
```

## Test coverage

The suite covers both operations: `lookupBin` and `getBalance`. Each test is in the `mock_tests` and `live_tests` groups.
