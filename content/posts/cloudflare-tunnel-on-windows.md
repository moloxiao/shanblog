
---
title: "Cloudflare Tunnel on Windows"
date: 2025-03-28T14:20:52+12:00
tags: ["cloudflare", "tunnel", "windows", "localhost", "nextjs"]
description: "A step-by-step guide to exposing your local development server to the internet using Cloudflare Tunnel on Windows."
---

When developing locally, you often want to preview or share your application over the internet. This guide walks through how to use **Cloudflare Tunnel** to expose your local server (like a Next.js project running on `localhost:3000`) using a secure custom subdomain.

---

## ✅ Prerequisites

- A [Cloudflare](https://cloudflare.com) account
- A domain added and managed under Cloudflare DNS (e.g., `yourareastupidgay.com`)
- A Windows machine running a local development server (e.g., `npm run dev` for Next.js)

---

## 🔧 Step 1: Download and Install `cloudflared`

1. Go to [Cloudflare Tunnel GitHub releases](https://github.com/cloudflare/cloudflared/releases/latest)
2. Download `cloudflared-windows-amd64.exe`
3. Rename it to `cloudflared.exe`
4. Move it to a folder, for example: `C:\cloudflared\`
5. Add this folder to your **System Environment Variable** `Path`
6. Open a new terminal (CMD or PowerShell) and verify:
   ```bash
   cloudflared --version
   ```

---

## 🔐 Step 2: Authenticate Cloudflare

```bash
cloudflared tunnel login
```

This will open a browser window for you to log in and authorize access to your domain.

---

## 🛠️ Step 3: Create a Tunnel

```bash
cloudflared tunnel create aj-shan-tunnel
```

This will generate a tunnel ID and create a credentials JSON file in `C:\Users\YourName\.cloudflared\`.

---

## 🧾 Step 4: Create `config.yml`

In `C:\Users\YourName\.cloudflared\`, create a file named `config.yml`:

```yaml
tunnel: aj-shan-tunnel
credentials-file: C:\Users\YourName\.cloudflared\your-tunnel-id.json

ingress:
  - hostname: aj-shan.yourareastupidgay.com
    service: http://localhost:3000
  - service: http_status:404
```

> Make sure to replace `your-tunnel-id.json` with the actual filename from the `.cloudflared` folder.

---

## 🌐 Step 5: Map DNS

Run:

```bash
cloudflared tunnel route dns aj-shan-tunnel aj-shan.yourareastupidgay.com
```

This adds a CNAME record to your Cloudflare DNS settings automatically.

---

## 🚀 Step 6: Run the Tunnel

Start the tunnel (in foreground):

```bash
cloudflared tunnel run aj-shan-tunnel
```

Then start your local app (e.g., `npm run dev`) and access it via:

```
https://aj-shan.yourareastupidgay.com
```

---

## 🧠 Common Commands

| Task | Command |
|------|---------|
| Start Tunnel | `cloudflared tunnel run aj-shan-tunnel` |
| List Tunnels | `cloudflared tunnel list` |
| View Tunnel Info | `cloudflared tunnel info aj-shan-tunnel` |
| Install as Service | `cloudflared service install` |
| Start Service | `net start cloudflared` |
| Stop Service | `net stop cloudflared` |
| Uninstall Service | `cloudflared service uninstall` |

---

## 🧩 Notes

- If you see logs like `context canceled`, they are harmless and indicate Cloudflare is rotating or retrying connections.
- You don’t need to use `:3000` in the public URL, Cloudflare handles port forwarding.

---

Now you have a secure tunnel from the internet to your local app, all under your custom domain! 🚀
