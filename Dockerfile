FROM n8nio/n8n:latest

USER root

# Install ffmpeg, yt-dlp, and whisper for video processing and transcription
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip && \
    pip3 install --break-system-packages yt-dlp openai-whisper && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

RUN npm install cheerio axios moment

USER node
