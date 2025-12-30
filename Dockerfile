FROM node:18-bullseye-slim

USER root

# Install system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    wget \
    ca-certificates \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install yt-dlp

# Install n8n globally
RUN npm install -g n8n@latest

# Create working directory
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node

WORKDIR /home/node

EXPOSE 5678

ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

CMD ["n8n", "start"]
