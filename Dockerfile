# Official Ollama image
FROM ollama/ollama:latest

# API port
EXPOSE 11434

# Server listening address
ENV OLLAMA_HOST=0.0.0.0:11434