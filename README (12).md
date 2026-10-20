# Agentic Video Generator

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](LICENSE)
[![Python 3.14](https://img.shields.io/badge/python-3.14-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-009688?logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![Powered by Gemini](https://img.shields.io/badge/Powered%20by-Gemini-4285F4)](https://ai.google.dev/)
[![LangChain Deep Agents](https://img.shields.io/badge/LangChain-Deep%20Agents-1C3C3C)](https://docs.langchain.com/oss/python/deepagents/overview)

Give it a topic. It researches the web, writes a storyboard, and generates a **30–60 second video** — narration, music, and a thumbnail included — end to end, with zero manual editing.

```
"a short video about the northern lights"  →  🎬 30s video + 🖼️ thumbnail
```

## How it works

```
query
  │
  ▼
┌─────────────────────┐   LangChain Deep Agent: plans research, scrapes pages
│ 1. RESEARCH          │   (crawl4ai), downloads & parses documents (MarkItDown),
│                       │   writes a Wikipedia-style research_wiki.md
└─────────────────────┘
  │
  ▼
┌─────────────────────┐   Gemini structured output turns the wiki into a shot-by-
│ 2. STORYBOARD         │   shot storyboard: Veo prompts, a Lyria music brief,
│                       │   and a thumbnail prompt
└─────────────────────┘
  │
  ▼
┌─────────────────────┐   Veo 3.1 renders each shot (parallel + extended chains),
│ 3. GENERATE           │   Lyria 3 composes the music bed, Nano Banana generates
│                       │   the poster thumbnail
└─────────────────────┘
  │
  ▼
┌─────────────────────┐   ffmpeg normalizes, concatenates, and mixes native Veo
│ 4. ASSEMBLE           │   audio with the music bed into the final .mp4
└─────────────────────┘
  │
  ▼
final.mp4 + thumbnail.jpg
```

Every phase updates a job's status in SQLite, so the whole pipeline runs as a background task the UI polls — submit a query and watch it move through `researching → storyboarding → generating → assembling → completed`.

## Screenshots

| | |
|---|---|
| **Submit a query** | **Live progress** |
| ![Empty state](assets/01-empty-state.png) | ![Progress](assets/03-progress-researching.png) |
| **Generated video + storyboard** | **Research wiki** |
| ![Storyboard panel](assets/06-storyboard-panel.png) | ![Wiki panel](assets/07-wiki-panel.png) |
| **History (multiple completed jobs)** | |
| ![History grid](assets/08-history-grid.png) | |

## Sample outputs

Five real, fully-generated videos (research → storyboard → Veo → Lyria → assembly, no manual edits) live in [`output/`](output/):

| Topic | Preview |
|---|---|
| [Northern Lights](output/northern-lights/video.mp4) — the science of the aurora borealis | ![](output/northern-lights/thumbnail.jpg) |
| [Coffee Brewing Science](output/coffee-brewing-science/video.mp4) — extraction, grind size, pour-over | ![](output/coffee-brewing-science/thumbnail.jpg) |
| [E-commerce Ad: Wireless Headphones](output/ecommerce-headphones-ad/video.mp4) — a 30s product ad | ![](output/ecommerce-headphones-ad/thumbnail.jpg) |
| [Deep Sea Twilight Zone](output/deep-sea-twilight-zone/video.mp4) — a 46s nature documentary, music only (pre-dates the narrator voiceover fix below) | ![](output/deep-sea-twilight-zone/thumbnail.jpg) |
| [How Volcanoes Shape the Earth](output/volcanoes-shaping-earth/video.mp4) — a 44s nature documentary with **narrator voiceover + orchestral score**, verified by transcript | ![](output/volcanoes-shaping-earth/thumbnail.jpg) |

> **Narrator voiceover:** the storyboard writer always drafts a per-shot narration script, but early runs never actually sent it to Veo (see [`_build_veo_prompt`](app/services/video_job_service.py) for the fix) — Veo only lip-syncs *on-screen* speech, so dialogue is now injected as an explicit off-screen narrator line. The volcanoes video above is real end-to-end proof: its audio was transcribed with Gemini and matched the storyboard's narration exactly.

## Stack

- **Research**: [LangChain Deep Agents](https://docs.langchain.com/oss/python/deepagents/overview) + Gemini, with [crawl4ai](https://docs.crawl4ai.com/) for scraping and [MarkItDown](https://github.com/microsoft/markitdown) for document parsing (pdf/docx/pptx/xlsx)
- **Video**: [Veo 3.1](https://ai.google.dev/gemini-api/docs/veo) (native audio, scene extension)
- **Music**: [Lyria 3](https://ai.google.dev/gemini-api/docs/music-generation)
- **Thumbnail**: [Nano Banana 2](https://ai.google.dev/gemini-api/docs/image-generation) (`gemini-3.1-flash-image-preview`)
- **Assembly**: ffmpeg (concat, audio mix, frame-extraction fallback)
- **Backend**: FastAPI + SQLAlchemy (async) + SQLite
- **UI**: vanilla HTML/CSS/JS, no build step, served at `/ui`

Uses **Python 3.14.2** and [`uv`](https://docs.astral.sh/uv/) for fast, reproducible dependency management.

## Prerequisites

- [`uv`](https://docs.astral.sh/uv/getting-started/installation/):
  ```bash
  curl -LsSf https://astral.sh/uv/install.sh | sh
  ```
- **ffmpeg** (system binary): `brew install ffmpeg` (macOS) or `apt-get install ffmpeg` (Debian/Ubuntu)
- A **Gemini API key** with Veo/Lyria/Nano Banana access (billing enabled — these are paid preview models) from [Google AI Studio](https://aistudio.google.com/)

## Setup

1. Create a virtual environment with the pinned Python version:

```bash
uv venv --python 3.14.2
```

2. Activate it:

```bash
source .venv/bin/activate
```

3. Install dependencies:

```bash
uv pip install -r requirements.txt
python -m playwright install --with-deps chromium  # for crawl4ai's scrape_url tool
```

4. Configure environment variables — copy `.env.sample` to `.env` and fill in your Gemini API key:

```bash
cp .env.sample .env
```

Key variables (see `.env.sample` for the full list): `GEMINI_API_KEY`, `RESEARCH_MODEL`/`RESEARCH_THINKING`, `STORYBOARD_MODEL`/`STORYBOARD_THINKING`, `IMAGE_MODEL`, `VEO_MODEL`/`VEO_FAST_MODEL`, `LYRIA_MODEL`, `MAX_OUTPUT_TOKENS`/`MAX_INPUT_TOKENS`, `MEDIA_DIR`, `VEO_MAX_CONCURRENCY`. Every model ID and thinking level is env-configurable — no code changes needed to swap models.

## Run the app

```bash
uv run uvicorn main:app --reload
```

- **UI**: `http://127.0.0.1:8000/ui` — submit a query, watch it progress, browse history
- **API**: `POST /api/v1/videos/generate`, `GET /api/v1/videos/{job_id}/status`, `GET /api/v1/videos/{job_id}/result`, `GET /api/v1/videos/history`, `GET /api/v1/videos/{job_id}/details`
- **Health check**: `http://127.0.0.1:8000/health`

> ⚠️ Veo/Lyria/Nano Banana are paid preview models with a monthly project spend cap — if you see `429 RESOURCE_EXHAUSTED`, raise it at [ai.studio/spend](https://ai.studio/spend).

## Test

```bash
uv run pytest -v
```

## Docker

```bash
docker compose up --build
```

The image is `python:3.14.2-slim` with `ffmpeg` and Playwright's Chromium installed, dependencies managed by `uv`.

## Project docs

See [`docs/implementation-plan.md`](docs/implementation-plan.md) for the full architecture, model rationale, and build order.

## Notes

- `uv run` executes commands inside the project environment automatically — no manual activation needed.
- Job state and media are stored locally (SQLite + `MEDIA_DIR`) — intentionally simple, ephemeral dev storage; swap in S3/Postgres for production.
- For production deployments, replace `--reload` with a production-ready configuration.
