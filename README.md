# Sarah Matchmaking

A collection of relationship and personality diagnostic tests that run entirely in the browser — no backend, no dependencies, no data leaves your device. Each test is a single self-contained HTML file.

## Available Tests

| Test | File | What it measures |
|------|------|------------------|
| Attachment Style Assessment | [`attachment-style-test.html`](attachment-style-test.html) | Attachment anxiety and avoidance across 24 questions, mapping to one of four adult attachment styles (Secure, Anxious-Preoccupied, Dismissive-Avoidant, Fearful-Avoidant). Based on the two-dimension ECR model (Brennan, Clark & Shaver, 1998). |

## Running Locally

Open any test file directly in a browser, or serve the folder:

```bash
python3 -m http.server 8765
# then visit http://localhost:8765/attachment-style-test.html
```

## Future Plans

The goal is to grow this into a full suite of compatibility and self-knowledge tests for matchmaking, adapting well-known assessments from around the internet:

- **Love Languages** — how people prefer to give and receive affection (words of affirmation, quality time, acts of service, gifts, physical touch). Useful for matching complementary expression styles.
- **Myers-Briggs (MBTI-style) personality test** — the 16-type model built on four dichotomies (E/I, S/N, T/F, J/P), for personality compatibility matching.
- **Dark Triad assessment** — screening for narcissism, Machiavellianism, and psychopathy traits (e.g., adapted from the Short Dark Triad / SD3).
- **Rice Purity Test** — the classic 100-question life-experience checklist, as a lighthearted compatibility data point.

Longer-term ideas:

- A shared results/profile format so scores from multiple tests combine into one matchmaking profile
- Compatibility scoring between two completed profiles
- A unified web app shell with a test picker, saved results (localStorage), and shareable result links

## Disclaimer

These are educational self-reflection tools, not clinical instruments. Results should not be treated as diagnoses.
