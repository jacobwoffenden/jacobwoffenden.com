# jacobwoffenden.com

![Production Deployment](https://github.com/jacobwoffenden/jacobwoffenden.com/actions/workflows/deploy-production.yml/badge.svg)

A static site hosted on Cloudflare Pages

## Development

[![Open in Dev Container](site/content/devcontainers/badge.svg)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/jacobwoffenden/jacobwoffenden.com)

[![Open in Codespace](https://github.com/codespaces/badge.svg)](https://codespaces.new/jacobwoffenden/jacobwoffenden.com)

### Preview Site

```bash
npx wrangler pages dev --live-reload
```

## Deployment

### Log in to Cloudflare

```bash
npx wrangler login --no-browser
```

### Deploy

```bash
npx wrangler pages deploy
```
