default:
  just --list

# Generate client source code from the OpenAPI specification
generate:
  openapi3-code-generator-exe \
    --incremental \
    --package-name cardano-wallet-client \
    --module-name Wallet \
    --output-dir generated \
    --do-not-generate-stack-project \
    --use-numbered-variant-constructors \
    cardano_wallet_specification.yaml

# Build generated code
build:
  cabal build cardano-wallet-client

# Test generated code
test:
  cabal test cardano-wallet-client-test

