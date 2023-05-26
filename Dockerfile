FROM significantgravitas/auto-gpt
RUN apt -y update && apt -y install nodejs npm
ENTRYPOINT ["python", "-m", "autogpt", "--install-plugin-deps"]
