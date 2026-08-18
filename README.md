# homebrew-freki

Homebrew tap for [Freki](https://github.com/lixni/Freki) (an interactive coding-CLI agent)
and Freki.Hall (its local web dashboard).

macOS only for now (Apple Silicon / `osx-arm64`).

## Install

```bash
brew tap lixni/homebrew-freki
brew install freki
brew install freki-hall   # optional: web dashboard for freki
```

May also need to run brew tap lixni/homebrew-freki

`freki-hall` depends on `freki` and installs it automatically if it isn't already present.

## Freki (CLI)

```bash
freki
```

Starts the interactive terminal agent. On first run it walks you through configuring a
model provider — a local/OpenAI-compatible endpoint, an Azure AI Foundry deployment, or a
GitHub Copilot subscription (device-flow login). Provider config is stored in
`~/.freki/providers.json`.

## Freki.Hall (web dashboard)

```bash
freki-hall
```

Starts a local web server on **`http://127.0.0.1:5171`** — open that in your browser.
It drives one or more `freki` sessions (spawned automatically from `freki` on your `PATH`)
from a browser UI: chat sessions, a kanban board, and an autonomous orchestrator.

Run it in the background with `freki-hall &`, or stop it with `Ctrl+C`.

## Updating

```bash
brew update
brew upgrade freki freki-hall
```

## Uninstall

```bash
brew uninstall freki freki-hall
brew untap lixni/homebrew-freki
```
