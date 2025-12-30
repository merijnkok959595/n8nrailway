FROM n8nio/n8n:latest

USER root

# Install ffmpeg and yt-dlp
RUN apk update && \
    apk add --no-cache ffmpeg python3 py3-pip && \
    pip3 install --break-system-packages yt-dlp

WORKDIR /data

RUN npm install cheerio axios moment

USER node
