FROM n8nio/n8n:latest

USER root

# Install ffmpeg and python3 for yt-dlp
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ffmpeg \
     python3 \
     python3-pip \
  && rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp

# Verify installations work
RUN ffmpeg -version && yt-dlp --version

USER node
