FROM node:18-bullseye-slim

# Install n8n dependencies and our custom tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    python3 \
    python3-pip \
    git \
    ca-certificates \
    curl && \
    pip3 install --break-system-packages yt-dlp openai-whisper && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n

# Set working directory
WORKDIR /data

# Install custom npm packages
RUN npm install cheerio axios moment

# Expose n8n port
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

# Run n8n
CMD ["n8n", "start"]
