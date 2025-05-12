# SECAD

## Summary
This repo containers the containers for runing SECAD. SECAD is an **agentic, AI-powered** security workflow augmentation application. See the main project her - https://github.com/gideonaina/secad

For more details on design and use case, read this article: 
https://medium.com/@gideonaina/workflow-augmentation-with-multi-agent-ai-system-3c3223c948dc


## Setup

### Pre-requisite
- Install Docker

### Optional pre-requisite
- Install Just: If you would like to to use the Justfile receipes instead of typing out commands
- Install pgAdmin: If you would like to see the content of the RAG

### Running SECAD
- Create a `.env` at the root of this project and copy the content of the `.env.sample` file into it. Provide the `OPENAI_API_KEY` value. Leave the rest as default if you choose.
- Run the the just command `just start` or copy the command int he receipe and run it from your command line `docker compose -f secad.docker-compose.yml up`
- SECAD should be running on `localhost` on port `8501`. i.e. `localhost:8501`