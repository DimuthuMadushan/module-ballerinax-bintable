# Account balance monitoring

This example reports the Bintable account balance and verifies that the API key can serve BIN lookups.

## Prerequisites

1. A Bintable API key from [bintable.com](https://bintable.com).

2. Create a `Config.toml` file in the example directory with the following values.

```toml
apiKey = "<API_KEY>"
sampleBin = "<BIN>"
```

> **Note**: Each successful BIN lookup draws down the account balance, so running this example repeatedly, for example on a schedule, can exhaust the balance. The Bintable API then responds with `401` (balance exhausted or package expired).

## Run the example

```bash
bal run
```
