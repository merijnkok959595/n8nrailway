FROM node:22-bullseye-slim

USER root

# Install system dependencies + ffmpeg + python for yt-dlp
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ffmpeg \
     python3 \
     python3-pip \
     curl \
     git \
     ca-certificates \
     tini \
  && rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp

# Install n8n globally (requires Node >= 20.19)
RUN npm install -g n8n@latest

# Create node user and directories
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Verify installations
RUN node --version && \
    ffmpeg -version && \
    yt-dlp --version && \
    n8n --version

USER node

WORKDIR /home/node

EXPOSE 5678

ENV N8N_PORT=5678
ENV NODES_EXCLUDE="[]"

ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
