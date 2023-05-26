# Auto AutoGPT

This will create a folder and run an individual AutoGPT instance with a single comand.

1. Place this repository in `~/ai` (or change `$DIR` and `env_file:` path in `run.sh`)
2. Build a new Docker image with AutoGPT + NodeJS: just run `make build`
3. Copy `.env.template` to `.env` and paste your OpenAI API Key
    - Go to https://platform.openai.com/account/billing/overview and click "Set up paid account" button
    - Go to https://platform.openai.com/account/api-keys and create a new secret key
    - Paste the new key without spaces in `.env` where it says `OPENAI_API_KEY=`
4. Execute with `./run.sh <name>` or `make`
5. (optional) add `alias ai='~/ai/run.sh'` to your `.bashrc`
6. Profit
