#!/usr/bin/env bash

# load variables from config file
source "$(dirname ${BASH_SOURCE[0]})/config.sh"

goal app call \
    --app-id "$APP_ID" \
    -f "$DONATE_ACCOUNT" \
    --app-arg "str:donate" \
    -o donate-call.tx

goal clerk send \
    -a "$DONATE_BALANCE" \
    -t "$APP_ACCOUNT" \
    -f "$DONATE_ACCOUNT" \
    -o donate-payment.tx

# group transactions
cat donate-call.tx donate-payment.tx > donate-combined.tx
goal clerk group -i donate-combined.tx -o donate-grouped.tx
goal clerk split -i donate-grouped.tx -o donate-split.tx

# sign individual transactions
goal clerk sign -i donate-split-0.tx -o donate-signed-0.tx
goal clerk sign -i donate-split-1.tx -o donate-signed-1.tx

# re-combine individually signed transactions
cat donate-signed-0.tx donate-signed-1.tx > donate-signed-final.tx

# send transaction
goal clerk rawsend -f donate-signed-final.tx
