You are helping Luke process his personal Gmail inbox (lukebichard@gmail.com). This is for personal email only — do not attempt to access or surface work emails.

Keep the session focused and efficient. The goal is zero unread by the end, or a clear picture of what needs action.

---

## Step 1 — Fetch unread threads

Use `mcp__claude_ai_Gmail__search_threads` with query `is:unread` to get all unread threads.

If there are more than 20 unread threads, also run a separate search for `is:unread is:important` to prioritise.

---

## Step 2 — Categorise

For each thread, read the subject, sender, and snippet. Assign one of these categories:

| Category | Criteria |
|---|---|
| **Reply needed** | Personal contact expects a response |
| **Action required** | Booking confirmation, form to fill, deadline |
| **FYI** | Receipt, notification, newsletter Luke might want |
| **Noise** | Automated email, marketing, irrelevant |

Present a grouped summary to Luke — don't list every thread individually for Noise/FYI. E.g.:
```
Reply needed (2):
- Kim — re: weekend plans
- Mats — stag do dates

Action required (1):
- Premier Inn — check-in confirmation for [date]

FYI (3): 3 receipts/notifications

Noise (12): skipped
```

---

## Step 3 — Work through it with Luke

For **Reply needed** threads:
- Ask Luke if he wants to reply now, later, or skip
- If "now": read the full thread with `mcp__claude_ai_Gmail__get_thread`, draft a reply using `mcp__claude_ai_Gmail__create_draft`, show it to Luke for approval before saving
- If "later": note it but don't create a draft yet

For **Action required** threads:
- Surface the key details (date, what's needed)
- Ask if he wants to action it now or note it

For **FYI**:
- Present briefly, ask if he wants to keep or archive

**Noise** threads are skipped unless Luke asks to review them.

---

## Step 4 — Label and clean up

After Luke has reviewed each category:
- Use `mcp__claude_ai_Gmail__label_thread` to label threads Luke wants to keep (e.g. "Later", "Receipts")
- Never delete or archive anything without Luke explicitly saying so
- Mark threads as read once reviewed

---

## Step 5 — Summary

End with a one-line inbox status:
> "Inbox: 2 drafts saved, 1 actioned, 12 noise threads skipped. Nothing urgent outstanding."
