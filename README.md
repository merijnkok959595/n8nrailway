# n8n on Railway (with custom npm packages + media tools)

Run your own automation workflows with [n8n](https://n8n.io/) using Railway's simple deployment setup.

This repo gives you a containerized version of n8n with a few handy packages pre-installed (like `axios`, `cheerio`, `moment`, `yt-dlp`, and `ffmpeg`) so you can build custom workflows without extra config. It's meant to be quick and hassle-free.

---

## Wait, what's n8n?

If you're not familiar, n8n is like a low-code Swiss Army knife for automation. You build workflows visually, and it connects to pretty much everything: APIs, databases, apps like Slack, Gmail, etc.

---

## What this repo does

- Pulls the latest n8n Docker image
- Installs some helpful Node.js packages so your n8n workflows can use them
- Tells Railway how to run everything (`startCommand = "n8n start"`)

---

## Packages Included

You'll get these pre-installed in your container:

**Node.js packages:**
- `axios` — HTTP client for making API calls
- `cheerio` — jQuery-like HTML parser
- `moment` — date/time utility

**Media tools:**
- `yt-dlp` — Download videos from YouTube and 1000+ other platforms
- `ffmpeg` — Video/audio processing and conversion

Perfect for video scraping, processing, and upload workflows.

---

## How to use this

Here's how to get it running:

### 1. Clone this repo

```bash
git clone https://github.com/merijnkok959595/n8n-railway.git
cd n8n-railway
```

### 2. Go the Railway dashboard:

1. Go to railway.app
2. Create a new project
3. Link your GitHub repo
4. It'll detect the Dockerfile and set everything up
5. Configure the ENV variables on the service container
6. Hit the **Deploy** button
7. Done

Railway handles the port (default for n8n is 5678), and starts the app using the n8n start command.

## Customize it
You can edit the Dockerfile to add more packages or change the base image.
Want to mount external volumes, tweak the environment, or persist workflows? You'll probably need to set up Railway plugins or tweak volume configs, check their [docs](https://docs.railway.com/) for that.

## Heads up on data persistence
By default, n8n saves workflows in /data. If you restart the container without persistent storage, they're gone.
Make sure you've configured Railway's volumes (or backup) if you care about keeping your workflows.

## Got questions?
You can always check:

- [n8n Docs](https://docs.n8n.io/)
- [Railway Docs](https://docs.railway.com/)
- Or [file an issue](https://github.com/maneja81/n8n-railway/issues) on this repo if something's off

## License
[MIT](https://mit-license.org/)
