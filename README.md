# jacobwoffenden.com

![Production Deployment](https://github.com/jacobwoffenden/jacobwoffenden.com/actions/workflows/deploy-production.yml/badge.svg)

A static site generated with Zola hosted on Cloudflare Workers

## Development

[![Open in Dev Container](site/static/devcontainers/badge.svg)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/jacobwoffenden/jacobwoffenden.com)

[![Open in Codespace](https://github.com/codespaces/badge.svg)](https://codespaces.new/jacobwoffenden/jacobwoffenden.com)

### Preview Site

```bash
npm run serve
```

### Build Site

```bash
npm run build
```

## Deployment

### Log in to Cloudflare

```bash
npm run wrangler-login
```

### Deploy

```bash
npm run wrangler-deploy
```
