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

Homebrew may refuse to load formulae from a third-party tap the first time, with
`Error: Refusing to load formula ... from untrusted tap`. If you see that, trust the tap
once and re-run install:

```bash
brew trust lixni/freki
```

`freki-hall` depends on `freki` and installs it automatically if it isn't already present.

## Freki (CLI)

```bash
freki
```

Starts the interactive terminal agent.

### Provider configuration (`~/.freki/providers.json`)

Freki reads its model provider(s) from `~/.freki/providers.json` — this file is required
and read at startup; there is no other provider config source. It's a set of **named
providers** plus a few shared defaults:

```json
{
  "Active": "openai",
  "Providers": {
    "openai": {
      "Kind": "OpenAiCompatible",
      "BaseUrl": "https://api.openai.com/v1",
      "ApiKeyEnv": "OPENAI_API_KEY",
      "Model": "gpt-5"
    }
  }
}
```

`Kind` is one of:

| Kind | What it is | Minimal config |
|---|---|---|
| `OpenAiCompatible` | Any OpenAI-compatible endpoint — a local server (Ollama, LM Studio, vLLM), OpenAI itself, or an Azure AI Foundry deployment | `BaseUrl` + `ApiKey`/`ApiKeyEnv` + `Model` |
| `Copilot` | A GitHub Copilot subscription | `{ "Kind": "Copilot" }` — logs in via device-flow on first use, no key needed |
| `ChatGptSubscription` | A ChatGPT Plus/Pro subscription | `{ "Kind": "ChatGptSubscription" }` — same device-flow pattern |

Local Ollama example:

```json
{
  "Active": "ollama",
  "Providers": {
    "ollama": {
      "Kind": "OpenAiCompatible",
      "BaseUrl": "http://localhost:11434/v1",
      "ApiKey": "ollama",
      "Model": "qwen2.5-coder"
    }
  }
}
```

You can define multiple named providers and switch between them at runtime with
`/provider` (and pick a model with `/model`). `/reload` re-reads the file without
restarting.

### Skills

Skills are markdown procedures Freki can pull into context on demand. They're loaded
from up to four locations, in priority order (first match on a given name wins):

1. `<project root>/.freki/skills`
2. `<project root>/.claude/skills`
3. `~/.freki/skills` (global — the default location for skills you want available in
   every project)
4. `~/.claude/skills`

Each location supports two layouts: flat `*.md` files with `name:`/`description:`
frontmatter, or Claude-style `<folder>/SKILL.md`. Run `/skills` inside Freki to see
what's actually loaded and from where.

## Freki.Hall (web dashboard)

```bash
freki-hall
```

Starts a local web server on **`http://127.0.0.1:5171`** — open that in your browser.
It drives one or more `freki` sessions (spawned automatically from `freki` on your `PATH`)
from a browser UI: chat sessions, a kanban board, and an autonomous orchestrator.

Run it in the background with `freki-hall &`, or stop it with `Ctrl+C`.

### Changing the port or auth token

Write overrides to `~/.freki-hall/config.json` — it persists across `brew upgrade`:

```json
{
  "Urls": "http://127.0.0.1:6000",
  "Security": { "AuthToken": "my-secret-token" }
}
```

(Environment variables, e.g. `ASPNETCORE_URLS=...`, still work too and take precedence
over the file — useful for a one-off run without touching disk.)

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
