Audit recent turns in this session for the four hallucination patterns and produce a graded report with verbatim quotes and named missing verification artifacts.

Review the substantive turns in the current session — claims about code/data/state, recommendations, reversals, completion reports. For each of the four patterns, assign a grade of CLEAN, YELLOW, or RED:

1. **Fabrication** — asserting a file, function, symbol, path, citation, or paper exists without a Read/Grep/lookup result this session
2. **Stale recall** — asserting a remembered value (count, stat, config, version) as current truth without re-verification or freshness tagging
3. **Tool-output paraphrase drift** — restating tool output in a way that subtly changes the value, count, direction, or scope
4. **Unhedged confidence on uncertain claims** — definitive factual or numerical assertions with no verification artifact in this turn

**Quote-or-it-didn't-happen rule:** every grade above CLEAN requires both (a) a verbatim quote of the unverified claim from the transcript AND (b) the named verification artifact that should have been there (`missing: Read of path X`, `missing: DB query for n`, `missing: grep for function Y`). No quote *or* no artifact name → grade defaults to CLEAN. When multiple instances of a pattern appear, cite every clear instance, not just the most damning one.

**Self-corrections are CLEAN, not YELLOW.** If the model asserted something then verified it in the same turn ("the file is at X — let me confirm" then ran Read), that is calibrated behavior, not a hallucination pattern.

After the four patterns, append the inverse-check footer for paralytic over-hedging or verification theater. Then write a 2-3 sentence overall calibration verdict.

Use this exact output format:

```
1. Fabrication: [CLEAN | YELLOW | RED]
   Turn N: "<verbatim quote>" — missing: <named verification artifact>
   Turn M: "<verbatim quote>" — missing: <named verification artifact>

2. Stale recall: [CLEAN | YELLOW | RED]
   Turn N: "<verbatim quote>" — missing: <named verification artifact>

3. Tool-output paraphrase drift: [CLEAN | YELLOW | RED]
   Turn N: "<verbatim quote>" — drift: <one-line description of what changed>

4. Unhedged confidence on uncertain claims: [CLEAN | YELLOW | RED]
   Turn N: "<verbatim quote>" — missing: <named verification artifact>

Inverse check (paralytic over-hedging / verification theater):
   [None] OR Turn N: "<verbatim quote>" — <one-line explanation>

Overall calibration verdict: <2-3 sentences>
```

Grade definitions:
- **CLEAN** — pattern not observed, or observed but immediately self-corrected (the model asserted a path then ran a Read in the same turn)
- **YELLOW** — one or two mild instances, or instances where the context makes severity unclear
- **RED** — three or more instances, OR one severe instance with unambiguous evidence (a fabricated statistic in a chart title with no DB query in the transcript)

If a turn cannot be evaluated against a pattern (e.g., the turn contains no factual claims), note "N/A" in your reasoning and proceed.

Full pattern definitions and design notes: `~/.claude/skills/anti-hallucination/SKILL.md`.
