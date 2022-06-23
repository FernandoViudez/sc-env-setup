steps to follow:

1. build app
2. update config.sh
    - update app-id
    - update app account (must be smart contract account)
    - update creator
    - update other specific vars for your smart contract
3. deploy app with depoy.sh script. 
Note: check if your memory is ok when deploying the smart contract 
    - local bytes
    - local ints
    - global bytes
    - global ints
4. opt-in user with optin.sh if needed for smart contract
5. execute donate.sh for example, to create a txn group and call an smart contract to do something.