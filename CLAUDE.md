# LibreStock Remote Desktop - Agent Context

> Tauri v2 desktop app for LibreStock inventory management.

## Tech Stack

Tauri 2 · Rust (backend) · Vanilla JS (frontend)

## Directory Structure

```
src-tauri/          # Rust backend (Tauri core)
├── src/            # Rust source
├── Cargo.toml      # Rust dependencies
├── tauri.conf.json  # Tauri configuration
└── icons/          # App icons
src-ui/             # JavaScript frontend
```

## Commands

```bash
pnpm dev            # Start Tauri dev mode (hot reload)
pnpm build          # Build production app
pnpm test           # Run tests (Vitest)
pnpm lint           # Lint frontend (ESLint)
```
