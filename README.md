## Getting Started

Follow these steps to build and run Ollama locally using Docker with NVIDIA GPU support.

### 1. Build the Docker Image

Navigate to the repository directory:

```powershell
cd C:\work\github\run-ollama-local
```

Build the Docker image:

```bash
docker build -t ollama-local:latest .
```

### 2. Create a Persistent Volume

Create a Docker volume to persist downloaded models and Ollama configuration:

```bash
docker volume create ollama-data
```

To list all available Docker volumes:

```bash
docker volume ls
```

### 3. Run the Container with NVIDIA GPU Support

Start the Ollama container:

```bash
docker run -d \
  --name ollama-local \
  --restart unless-stopped \
  --gpus all \
  -p 127.0.0.1:11434:11434 \
  -v ollama-data:/root/.ollama \
  ollama-local:latest
```

The API will be available at:

```text
http://localhost:11434
```

To list all installed models:

```bash
docker exec -it ollama-local ollama list
```

To display the models currently loaded in memory:

```bash
docker exec ollama-local ollama ps
```

### 4. Download an AI Model

Download Qwen 2.5 (3B parameters):

```bash
docker exec -it ollama-local ollama pull qwen2.5:3b
```

To run the model interactively:

```bash
docker exec -it ollama-local ollama run qwen2.5:3b
```

### 5. Check GPU Usage

To verify which models are currently loaded and using GPU resources:

```bash
docker exec ollama-local ollama ps
```

**Note:** GPU acceleration requires a compatible NVIDIA GPU, up-to-date NVIDIA drivers, and NVIDIA Container Toolkit support configured for Docker.