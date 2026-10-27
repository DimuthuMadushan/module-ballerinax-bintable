_Author_:  @DimuthuMadushan \
_Created_: 2026/10/26 \
_Updated_: 2026/10/26 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Bintable. 
The OpenAPI specification is obtained from https://github.com/wso2/api-specs/blob/main/openapi/bintable/bintable/1.0.0-oas3/openapi.yaml.
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. **Security scheme added.** The spec declared no security scheme, and `api_key` was a required query parameter on both operations. Added an `ApiKeyAuth` `apiKey` security scheme (name `api_key`, in query) with a top-level `security` requirement, and removed the `api_key` query parameter from `binLookup` and `balanceLookup`, so the client takes an `ApiKeysConfig`. Changed in `docs/spec/openapi.yaml`.

2. **`info.description` rewritten** as a short plain-text summary of the connector, used as the `Client` doc comment. Changed in `docs/spec/openapi.yaml`.

3. **Missing schema descriptions added** for `ResponseItem` and its `result`, `message` and `data` properties and for the security scheme, so `bal build` has no `undocumented field` warnings. Changed in `docs/spec/openapi.yaml`.

4. **`balanceLookup` response media type** changed from `*/*` to `application/json`, so the operation returns `ResponseItem[]` instead of `http:Response`. Changed in `docs/spec/openapi.yaml`.

5. **Operation renames.** `binLookup` is `lookupBin` and `balanceLookup` is `getBalance` (persisted in `docs/spec/ai-mappings.json`).
6. **200 response schemas** of `binLookup` and `balanceLookup` changed from an array of `ResponseItem` to a single `ResponseItem`, as the API returns a bare object. Changed in `docs/spec/openapi.yaml`.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --license docs/license.txt --client-methods remote
```

