You are helping Luke summarise a piece of content and build it into his Obsidian second brain. The content could be a YouTube video, podcast, article, or PDF.

---

## Vault paths (use exactly these)

- Summaries: `03 - Resources/Summaries/`
- References: `03 - Resources/References/`
- People: `02 - Areas/People/`
- Daily note: `Daily Notes/YYYY/Month/DD-MM-YYYY.md` (e.g. `Daily Notes/2026/April/24-04-2026.md`) — Month is full name, capitalised

---

## Step 1 — Detect content type and extract

Determine the URL type and extract content accordingly:

**YouTube / podcast hosted on YouTube:**
Run: `yt-dlp --write-auto-sub --sub-lang en --skip-download --output "/tmp/yt_%(id)s" "<URL>"`
Then read the `.vtt` or `.srt` file from `/tmp/`. Strip timestamps and formatting to get plain transcript text. If no auto-subtitles exist, use `yt-dlp -x --audio-format mp3 -o "/tmp/yt_audio.%(ext)s" "<URL>"` and note that transcription is unavailable — summarise from video description and comments instead.

**Article / blog post / web page:**
Use WebFetch to retrieve the full content. Extract the main body text.

**PDF:**
Run: `pdftotext "<path>" -` to extract text.

Also extract: title, author/creator, publish date, and URL.

---

## Step 2 — Ask for depth (if not already specified)

Ask: "Detailed or minimal summary?"

- **Detailed** — full section breakdown, rich reference notes, use Opus model via subagents where possible
- **Minimal** — TL;DR + key points, wikilinks only, no reference notes created

Default to **detailed** if not specified.

---

## Step 3 — Analyse and plan structure

Before writing, read the content and decide:
- How many sections it naturally breaks into (aim for 3–8)
- Estimate summary length: roughly 1:6 ratio to source (a 60-minute podcast ≈ 1000-word summary)
- Identify all concepts, tools, people, companies, and titles worth wikilinking

---

## Step 4 — Write the summary note

Save to `03 - Resources/Summaries/<Title>.md`

Use this structure:

```
---
title: "<title>"
source: "<URL or file path>"
author: "<name if known>"
date: <publish date if known>
summarised: <today's date YYYY-MM-DD>
type: <youtube | podcast | article | pdf | book>
tags: [summary]
unread: true
---

> [!tldr]
> <2-4 sentence overview of the whole piece>

## Context
Brief background on the creator/source and why this content matters.

## <Section 1 Title>
...

## <Section 2 Title>
...

(continue for all sections)

## Key Takeaways
- Bullet list of the most actionable or memorable points

## People Mentioned
- [[Person Name]] — one-line role/relevance

## Related
- [[concept]] [[tool]] [[idea]]
```

**Wikilink rules:**
- Wikilink every significant concept, tool, person, company, book, and framework on first mention
- Every wikilink MUST resolve to a real note — no dangling links (see Step 5)
- Never use `# Title` headings — the filename is the title
- Don't wikilink common words or generic phrases

---

## Step 5 — Create reference and people notes

For every wikilink in the summary, check if the note already exists in the vault. If it doesn't, create it.

**Reference note** → `03 - Resources/References/<Concept>.md`
```
---
tags: [reference]
unread: true
---

One paragraph definition/overview of the concept.

## Related
- [[related concept]]
```

**Person note** → `02 - Areas/People/<Name>.md`
- Public figure: include role, background, notable work, and any direct quotes from the content
- Private individual (not publicly known): just name and role — no additional detail
```
---
tags: [person]
---

**Role:** ...
**Known for:** ...
```

Only create notes that don't already exist — check first.

---

## Step 6 — Log to today's daily note

Find today's daily note at `Daily Notes/YYYY/Month/DD-MM-YYYY.md`. If a `## Summaries` section exists, append to it. If not, append this to the end of the note:

```
## Summaries
- [[<Summary Note Title>]] — <one sentence on what it was>
```

---

## Step 7 — Report back

Tell Luke:
- Title of the summary note created
- How many sections it contains
- How many reference/people notes were created
- Any wikilinks that couldn't be resolved (should be zero)
