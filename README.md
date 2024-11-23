# jacobwoffenden.com

A statically generated site hosted on Cloudflare Pages

## Development

### Log in to Cloudflare

```bash
npx wrangler login --browser false
```

```bash
npx wrangler pages dev --live-reload
```

## Deploy to Preview Environment

```bash
npx wrangler pages deploy --branch preview
```

## Deploy to Production Environment

```bash
npx wrangler pages deploy --branch production
```
