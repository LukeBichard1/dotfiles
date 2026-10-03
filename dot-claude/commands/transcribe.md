You are helping Luke turn photos of his handwritten study notes into proper notes in his Obsidian vault. Use the Obsidian MCP tools throughout. The vault lives at `/home/luke-bichard/Documents/Lukes Vault`, and images are stored in `Assets/`.

Optional focus (a note name or topic): $ARGUMENTS

**Scope:** study and learning notes only (articles, books, courses, ideas). Luke's paper journal is deliberately kept as a human process. If a photo looks like a personal journal page (feelings, days, family, reflections), don't transcribe it. Tell Luke and leave it where it is.

1. **Find the work.** List notes in `00 - Inbox/` that embed an image (`![[...jpg|png|jpeg]]`). If $ARGUMENTS names a note, process only that one. If there's nothing to do, say so and stop.

2. **Get a readable image.** Phone photos often arrive sideways. If the text isn't upright, make a rotated copy in the scratchpad and read that instead, e.g.:
   `convert "<vault>/Assets/<img>" -auto-orient -rotate -90 -resize 2000x <scratchpad>/rot.jpg`
   (try `90` or `180` if `-90` is wrong). Never modify the original image.

3. **Transcribe faithfully.**
   - Keep Luke's words and structure. Mind maps become nested bullets under each branch.
   - Fix spelling only. Don't reword, expand or "improve" his points.
   - Keep his own questions and connections (e.g. "is this the orchestration layer?", "→ my Obsidian setup"). They matter most.
   - Mark unclear words `[?]` and list them for Luke to confirm rather than guessing.

4. **Review it (separate section).** If the notes are about a known source (an article, book or course), check them against it. Fetch it if needed.
   - Answer any questions he wrote down, in plain language. Use PM or everyday analogies where they help.
   - Point out what's accurate, anything he got wrong, and the 2–4 most important things he missed.
   - Link to his own work and existing vault notes (search the vault for related notes and study sessions).
   - Keep it short. This is a review, not a rewrite.

5. **Build the note** in this shape:
   - Frontmatter: `tags`, `source`, `date` (DD-MM-YYYY)
   - `## My Notes (transcribed)`: his notes
   - `## Review (Claude, DD-MM-YYYY)`: your review, clearly separate from his thinking
   - `## Original Note`: the image embed
   - `## Related Notes`: wikilinks

6. **File it.** Choose a destination folder by topic, following the vault's PARA structure (e.g. AI → `01 - Projects/AI/`, tech topics → `02 - Areas/Technology/...`, book notes → `03 - Resources/Books/`). Look at what's already in the folder to match conventions. Never file anything into the work area folder (it is named in memory under Known Issues as restricted). If the right folder isn't obvious, suggest one and ask. Move the note with `app.fileManager.renameFile` so links stay intact. Leave the image in `Assets/`.

7. **Don't log to daily notes.** Luke no longer uses Obsidian daily notes (paper journal instead). Never create or edit a daily note. The note's `date` frontmatter is the record.

8. **Report back briefly:** where the note went, the main review points, and any `[?]` words to confirm.

This is a **workflow, not an agent**. The steps are fixed, and the only judgement calls are folder choice and the review.
