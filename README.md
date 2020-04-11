# anvs
Automatically switch node version based on the projects package.json

## Installation

1. Uninstall avn so that there are no conflicts. You can do this by running 
    ```
    npm uninstall -g avn
    npm uninstall -g avn-nvm
    
    rm -rf ~/.avn
    rm -rf ~/.avnrc
    ```
2. Run the command below in your terminal
    ```
    curl -o- https://raw.githubusercontent.com/bjulian5/anvs/master/install.sh | bash
    ```

3. Once installed, you can install new node version of node by running
    ```shell script
    nvm install <node-version>
    nvm alias default <node-version> # optionally sets your default node version
     ```
