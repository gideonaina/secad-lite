# SECAD

## Summary
This repo containers the containers for runing SECAD. SECAD is an **agentic, AI-powered** security workflow augmentation application. See the main project her - https://github.com/gideonaina/secad

For more details on design and use case, read this article: 
https://medium.com/@gideonaina/workflow-augmentation-with-multi-agent-ai-system-3c3223c948dc


## Setup

### Pre-requisite (Required)
- Clone this repo: `git clone git@github.com:gideonaina/secad-lite.git`
- Install Docker (recommend v27). It comes with docker compose (minimum needed is v2, v1 version will not work with this lab).
    - Mac: https://docs.docker.com/desktop/setup/install/mac-install/
    - Windows: https://docs.docker.com/desktop/setup/install/windows-install/ 
    - Run `docker --version`  to confirm the version of docker.
    - Run `docker compose version`  to confirm the version of docker compose.

### Pre-requisite (Optional)

- Install pgAdmin: Used to inspect the content of the vector database
    - Mac: https://www.pgadmin.org/download/pgadmin-4-macos/
    - Windows: https://www.pgadmin.org/download/pgadmin-4-windows/

- Just: Makes it easier to run the necessary commands as receipes (See Justfile in the repo for details)
    - Mac: run `brew install just`
    - Window: 
        * Install Scoop or Chocolatey
        ``` 
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
        ```
        * Once installed run `scoop install just`
- Install vscode: https://code.visualstudio.com/download

### Running SECAD
- Go to https://platform.openai.com/settings/organization/api-keys, register/login into your account and create an API key. Load some money into your account ($10 is more than enough).
- Create a `.env` at the root of this project and copy the content of the `.env.sample` file into it. Provide the `OPENAI_API_KEY` value. Leave the rest as default.
- Run the the just command `just start` or copy the command int he receipe and run it from your command line `docker compose -f secad.docker-compose.yml up`
- SECAD should be running on `localhost` on port `8501`. i.e. `localhost:8501`