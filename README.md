# Sarah Matchmaking

A collection of relationship and personality self-reflection quizzes. They run entirely on your device — no backend, no data leaves your machine. Everything ships in two forms: a self-contained HTML page (a standard web interface) and a runnable terminal program, which share a common saved-profile format.

Both the web page ([`index.html`](index.html)) and the terminal program
([`attachment-style-test`](attachment-style-test)) open to a **quiz picker** offering six quizzes:

| Quiz | Questions | What it measures |
|------|-----------|------------------|
| Attachment Style | 24 (Likert 1–5) | Attachment anxiety and avoidance, mapping to one of four adult attachment styles. Based on the two-dimension ECR model (Brennan, Clark & Shaver, 1998). |
| Love Language | 30 (forced-choice) | How you most feel loved across the five love languages. Mirrors the official Chapman scoring exactly (balanced round-robin, each language in 12 of 30 questions, highest tally is primary). |
| Big Five (OCEAN) | 50 (Likert 1–5) | The five core personality dimensions — Openness, Conscientiousness, Extraversion, Agreeableness, Neuroticism. Uses the real **public-domain IPIP** Big-Five Factor Markers. |
| Dark Triad | 27 (Likert 1–5) | Machiavellianism, narcissism, and psychopathy. Mirrors the **SD3** structure (9 items per trait, reverse-keys, mean 1–5 per trait). |
| Personality Type | 30 (Likert 1–5) | A 4-letter type plus Assertive/Turbulent identity (e.g. `INFJ-T`). Mirrors the **16Personalities** structure (four Jungian dichotomies + identity). |
| Rice Purity | 100 (yes/no checklist) | A lighthearted "purity" score out of 100 — your score is 100 minus the number of life-experience items you've done. Original, deliberately non-graphic item wording. |

**On sourcing:** Big Five uses the genuinely public-domain IPIP items. The Love Language,
Dark Triad, Personality Type, and Rice Purity quizzes replicate the *structure and scoring* of
their well-known counterparts but use **original item wording** (those instruments' exact text
is copyrighted/proprietary). None are affiliated with the original tests.

After any result — fresh or saved — you can **View answers** (web) or press **[A]** (terminal)
to see every question alongside the answer you gave, since each profile records its answers.

## Running the terminal version

```bash
sarah    # runs the quiz right here in your terminal
```

`sarah` is a launcher installed at `~/.local/bin/sarah` that runs `attachment-style-test`
(a Python 3 script, no dependencies) in the current terminal. You can also run the script
directly: `./attachment-style-test`.

From the menu pick a quiz (`1`–`6`) or `V` to browse saved profiles. Answer with number keys
(`1`–`5` for the Likert quizzes, `1`/`2` for the love-language and Rice Purity yes/no choices)
· `B` to go back · `Q` to quit. After a result you can `[S]ave` it (a menu lets you create a
**new** profile or add to an existing one) or press `[A]` to review your answers.

## Running the web version

Open [`index.html`](index.html) directly in a browser, or serve the folder:

```bash
python3 -m http.server 8765
# then visit http://localhost:8765/
```

## The web version (Vercel)

Live at **https://sarah-matchmaking.vercel.app**

The web app is a single static file (`index.html`) with no build step, so it deploys
zero-config. To redeploy after changes:

```bash
vercel deploy --prod --scope jmattkope-9478s-projects
```

For automatic deploys on every push, connect the GitHub repo once in the Vercel dashboard
(Project → Settings → Git → connect `matthewkope/sarah-matchmaking`).

## Installing the terminal version (anyone)

The terminal program is a single dependency-free Python 3 script. Install it with one line —
it downloads the script into `~/.local/bin/sarah` (this only downloads and marks it executable;
it doesn't run anything):

```bash
curl -fsSL https://sarah-matchmaking.vercel.app/install | sh
```

Prefer to read it first? Download straight from the repo instead:

```bash
curl -fsSL https://raw.githubusercontent.com/matthewkope/sarah-matchmaking/main/attachment-style-test \
  -o ~/.local/bin/sarah && chmod +x ~/.local/bin/sarah
```

Then run `sarah` (make sure `~/.local/bin` is on your `PATH`). Requires Python 3, which ships
with macOS and most Linux distros. Saved profiles live in `profiles.json` next to the installed
script.

## Profiles — one per person, holding every test

After any quiz you can **save the result onto a named profile**. Saving more results under the
same name builds a single profile for that person, so one profile can hold their Attachment,
Love Language, Big Five, Dark Triad, and Personality Type results together. The saved-profiles
screen groups results by person and shows which quizzes each person hasn't taken yet.

Both versions share a common JSON format:

- **Terminal** stores profiles in `profiles.json` next to the script (in this folder).
- **Web** stores profiles in the browser's `localStorage`, and can **Export** to a
  `profiles.json` download or **Import** a `profiles.json` file.

The two files use the **same schema**, so to move profiles between them: drop a web-exported
`profiles.json` into this folder for the terminal to read, or use the web **Import** button on
the terminal's `profiles.json`. (`profiles.json` is personal data and is git-ignored.)

## Future Plans

The goal is to grow this into a full suite of compatibility and self-knowledge tests for matchmaking:

- **Compatibility scoring between two completed profiles** — now that one profile holds five tests, compare two people across all of them.
- More quizzes (e.g. a lighthearted life-experience checklist).
- Shareable result links / a printable combined profile card.

## Disclaimer

These are educational self-reflection tools, not clinical instruments. Results should not be treated as diagnoses.
