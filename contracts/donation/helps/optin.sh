# load vars from config
source "$(dirname ${BASH_SOURCE[0]})/config.sh"

# opt-in user
goal app optin --app-id $APP_ID --from $DONATE_ACCOUNT