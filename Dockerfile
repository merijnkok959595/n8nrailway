FROM n8nio/n8n:latest

USER root

# Install ffmpeg and Python for yt-dlp (Alpine uses apk)
RUN apk add --no-cache ffmpeg python3 py3-pip && \
    pip3 install --break-system-packages yt-dlp

WORKDIR /data

# Install custom npm packages
RUN npm install cheerio axios moment

USER node
