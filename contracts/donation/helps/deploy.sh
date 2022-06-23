# load vars from config
source "$(dirname ${BASH_SOURCE[0]})/config.sh"

# create app
goal app create \
    --creator $CREATOR_ACCOUNT \
    --approval-prog /data/build/approval.teal \
    --clear-prog /data/build/clear.teal \
    --local-ints 2 \
    --local-byteslices 0 \
    --global-ints 0 \
    --global-byteslices 0