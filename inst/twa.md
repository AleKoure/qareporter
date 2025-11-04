# 🧩 Team Working Agreement (TWA)

_Last updated: YYYY-MM-DD_

## 1. Purpose
To keep code reviews consistent, respectful, and effective — ensuring trust, clarity, and flow across our scientific software projects.

---

## 2. Core Principles
- **Respect:** Comment on code, not people.  
- **Curiosity:** Ask questions, don’t accuse.  
- **Clarity:** Explain *why* a change matters.  
- **Fairness:** Apply the same standards to everyone.

---

## 3. Code Review Process
1. **PR Preparation**
   - Include context, what changed, and how to test.
   - Keep PRs small and self-contained.

2. **Review Expectations**
   - Reviews start within **2 business days**.
   - Use **Triple-R**: Request → Rationale → Result.
   - Use `nit:` for optional suggestions.
   - Summarize decisions inside the PR thread.

3. **Feedback Tone**
   - Use collaborative phrasing (“Could we…” / “We might…”).
   - Acknowledge well-written or elegant contributions.
   - No directives, sarcasm, or blame.

4. **Ownership**
   - Review rotation weekly.
   - Everyone maintains and evolves this TWA.

---

## 4. Automation Support
Automation helps us focus on scientific and statistical reasoning.

| Automated Check | Tool | Purpose |
|-----------------|------|----------|
| Linting | `{lintr}` / `{styler}` | Enforce consistency |
| Tests | `{testthat}` | Validate functionality |
| Coverage | `{covr}` | Measure test completeness |
| CI/CD | GitHub Actions | Enforce reproducibility |
| Review Assignment | CODEOWNERS | Distribute workload |

---

## 5. Automation Ratio
To track review maturity:

\[
\text{Automation Ratio} = \frac{\text{Automated Review Actions}}{\text{Automated + Manual Review Actions}}
\]

### Targets
| Level | Ratio | Description |
|--------|--------|-------------|
| Foundational | < 0.4 | Mostly manual — build CI coverage |
| Balanced | 0.4–0.7 | Humans + automation in synergy |
| Mature | > 0.7 | Routine checks automated, focus on science |

---

## 6. Review Health Checks
- **PR Size:** Small, focused, and testable.  
- **Review Time:** ≤ 48h turnaround.  
- **Participation:** ≥ 2 reviewers per PR.  
- **Automation Ratio:** Tracked monthly via CI logs.

---

## 7. Continuous Improvement
- Review this TWA quarterly.  
- Use retrospectives to refine process and tone.  
- Keep automation ratio balanced — automate repetition, not reasoning.

---

> _The purpose of code review is not control — it’s collaboration._  
> _Culture sets the tone, communication keeps it human, automation makes it sustainable._
