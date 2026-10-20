# ShotLoom / 镜织

> **Weave a story into executable shots.**
> **把故事织成可执行的镜头。**

![Abstract midnight-blue film ribbon weaving into luminous shot frames](assets/brand/shotloom-hero.png)

[中文介绍](README.zh-CN.md) · [Architecture](docs/architecture.md) · [Roadmap](docs/roadmap.md) · [Contributing](CONTRIBUTING.md)

ShotLoom is an open-source, story-first production workflow for AI-assisted short films. It turns a premise into a reviewable production package: a scene script, director-ready shot plan, visual contract, asset briefs, and video-generation task cards.

It is deliberately **not** a “one-click movie generator”. Strong short films still need causality, choices, continuity, and human taste. ShotLoom makes those decisions explicit and portable between people and tools.

## What is included in v0.2.0

- A dependency-free Node.js CLI that creates and validates a ShotLoom project folder.
- A complete seven-skill pipeline: from story development to generation review.
- A lightweight project layout and Markdown templates.
- A complete miniature example, **The Last Projection**, from premise to video task cards.
- English and Simplified Chinese documentation.

## The production package

```text
Premise
  → scene script
  → director storyboard
  → visual contract
  → image-asset briefs
  → video task cards
  → review log
```

## The seven-skill system

![Seven physical production stations connected by a woven film ribbon](assets/brand/shotloom-skill-system.png)

Each skill owns one decision boundary. They are designed to run in sequence, but a creator may enter at any approved stage. The handoff is always a reviewable file, not hidden chat context.

| # | Skill | It decides | It hands off |
| --- | --- | --- | --- |
| 01 | [Story](skills/shotloom-story/SKILL.md) | Is the premise a causally sound, shootable short-film story? | Scene script and causality audit |
| 02 | [Director Storyboard](skills/shotloom-storyboard/SKILL.md) | What does the audience see and hear, shot by shot? | Shot table and continuity plan |
| 03 | [Visual Contract](skills/shotloom-visual-contract/SKILL.md) | Which visual rules must remain consistent? | Colour, light, character, space, prop, and asset rules |
| 04 | [Asset Brief](skills/shotloom-asset-brief/SKILL.md) | What static image assets are actually needed? | Generation-ready asset briefs and acceptance checks |
| 05 | [Cinematic Image Polish](skills/shotloom-cinematic-image-polish/SKILL.md) | Is each image brief visually specific, filmic, and consistent? | Final image prompt plus separated constraints |
| 06 | [Video Task Cards](skills/shotloom-video-task-cards/SKILL.md) | How should approved assets become short video-generation tasks? | Segment prompts, references, sound, transitions, and QC |
| 07 | [Execution Review](skills/shotloom-execution-review/SKILL.md) | Does a generated clip pass continuity and story checks? | Review log, pass/fail decision, and targeted retry brief |

Read the detailed [skill catalog](skills/README.md) or [中文技能说明](skills/README.zh-CN.md) before installing a skill.

## Quick start

Requirements: Node.js 18 or later. No package installation is required.

```bash
git clone https://github.com/bohu6888/shotloom.git
cd shotloom
node ./bin/shotloom.mjs init my-first-film
node ./bin/shotloom.mjs validate my-first-film
```

Open the generated `my-first-film/` folder and begin with `01-story/brief.md`. The command creates editable Markdown files; it never uploads your material or calls a model.

### Use the skills with Codex

Copy the relevant folder under [`skills/`](skills/) into your local Codex skills directory, then start a task with the project brief and the matching skill. The first four skills establish story and assets; the last three turn approved assets into controlled generation and review. Each skill defines what it may assume, what it must produce, and how to check the result.

For image generation, ShotLoom produces a reviewed **asset brief** first. Generate the image in the model or canvas tool you are authorized to use; keep each result and its approval status in the project folder.

## Repository map

| Path | Purpose |
| --- | --- |
| [`bin/shotloom.mjs`](bin/shotloom.mjs) | Project bootstrapper and structural validator |
| [`skills/`](skills/) | Reusable, tool-agnostic creative skills |
| [`templates/`](templates/) | Copyable project and deliverable templates |
| [`examples/the-last-projection/`](examples/the-last-projection/) | Small end-to-end example |
| [`docs/`](docs/) | Architecture, roadmap, and conventions |

## Principles

1. **Story before spectacle.** Every visual choice must serve a character decision, information change, or emotional turn.
2. **An artifact at every stage.** Outputs are files that a collaborator can inspect, revise, and reuse.
3. **Visual continuity is a contract.** Characters, spaces, props, palette, and time-of-day are explicit constraints.
4. **Generation is a handoff, not a black box.** The workflow creates task cards; execution stays with the creator and their approved tools.
5. **Human authorship remains visible.** ShotLoom helps structure work; it does not claim authorship of a user’s story or assets.

## Status and roadmap

ShotLoom is in an early, usable alpha. The first release focuses on transparent Markdown artifacts rather than a heavy GUI. See the [roadmap](docs/roadmap.md) for planned visual review, asset manifests, and local desktop tooling.

## Contributing

Contributions are welcome: new genre templates, better review rubrics, translations, CLI improvements, and complete example projects. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

The code and workflow materials in this repository are licensed under [Apache-2.0](LICENSE). “ShotLoom” and “镜织” are project names; no trademark license is granted by the code license.

## Safety and rights

You are responsible for the rights and permissions for scripts, likenesses, images, music, reference material, and the model platforms you use. Do not automate logins, bypass platform controls, or share personal accounts through this project.
