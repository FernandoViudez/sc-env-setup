# Environment setup :rocket:

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Install [Algorand sandbox](https://github.com/algorand/sandbox)
3. Add this project folder as bind volume in sandbox `docker-compose.yml` under key `services.algod`:
    ```yml
    volumes:
      - type: bind
        source: <path>
        target: /data
    ```
4. Start sandbox:
    ```txt
    $ ./sandbox up
    ```
5. Install Python virtual environment in project folder:
    ```txt
    $ python -m venv venv
    $ source ./venv/Scripts/activate # Windows
    $ source ./venv/bin/activate # Linux
    ```
6. Use Python interpreter: `./venv/Scripts/python.exe`
    VSCode: `Python: Select Interpreter`

# Links

- [Official Algorand Smart Contract Guidelines](https://developer.algorand.org/docs/get-details/dapps/avm/teal/guidelines/)
- [PyTeal Documentation](https://pyteal.readthedocs.io/en/latest/index.html)
- [Algorand DevRel Example Contracts](https://github.com/algorand/smart-contracts)


<p> Rights reserved to ~> https://github.com/algorand-devrel/pyteal-course </p>
 
 <hr>
 
minimal code updates: 
- added personal donation project
- config.sh updated
- comments added to deeply understand the code and how it works
