# Claude Code Digest

This tool helps me stay up-to-date on developments on Claude Code.

It's a Claude Code skill that generates weekly digests of the [anthropics/claude-code](https://github.com/anthropics/claude-code) repository with AI-powered analysis, explanations, and importance ratings.

## What It Does

1. **Fetches closed issues** from the Claude Code repo for a configurable time period
2. **Analyzes each issue** and rates importance (Critical → Low)
3. **Generates TL;DR** highlighting the most important changes
4. **Saves analyzed digest** to your Desktop

## Example Output

<details>
<summary>Click to expand full example digest</summary>

```markdown
# Claude Code Weekly Digest
**Period:** December 20-27, 2025
**Generated:** 2025-12-27

---

## TL;DR - Key Changes This Week

- 🔴 Security Fix: Username data leakage fixed in statusline agent (#15420)
- 🔴 Security Fix: .env.local no longer loaded into environment (#15293)
- 🟠 Feature: Session naming with --session-name flag (#2112)
- 🟠 Feature: Context persists across compaction events (#15323)
- 🟠 Feature: Auto-resume on rate limits with configurable retry (#15522)
- 🟠 Feature: "Allow for this session only" permission option (#14891)

---

## 🔴 Critical Changes

### [#15420] Username Data Leakage in statusline-setup Agent
**The statusline-setup agent was using the wrong username, potentially leaking data between users on shared systems. Fixed.**
- Labels: bug, security, platform:windows

### [#15293] .env.local Being Loaded Into Environment
**Claude Code was inadvertently loading .env.local files into its environment, which could expose sensitive credentials. Now prevented.**
- Labels: bug, security, platform:macos

---

## 🟠 High Importance

### [#2112] Session Naming Support
**You can now name your sessions with --session-name or /session-name. Makes it much easier to find and resume specific work sessions.**
- Labels: enhancement, area:tui, area:core
- Why it matters: Long-requested feature. Essential for managing multiple concurrent projects.

### [#15323] Context Persistence Across Compaction
**Context now natively persists when the conversation gets compacted. Previously, important context could be lost during auto-compaction.**
- Labels: enhancement, area:core, memory
- Why it matters: Addresses a major pain point where Claude would "forget" key information after long sessions.

### [#15522] Auto-Resume on Rate Limit
**When hitting API rate limits, Claude Code can now automatically wait and retry instead of failing.**
- Labels: enhancement, platform:linux, area:core, area:api

### [#14891] "Allow for This Session Only" Option
**New permission option that grants access only for the current session, preventing permanent settings changes.**
- Labels: enhancement

---

## 🟡 Medium Importance

| Issue | What It Does |
|-------|--------------|
| #15515 | `--acceptEdits` CLI flag for auto-accepting edits |
| #15346 | `PostToolUseError` hook for failed tool executions |
| #15271 | Time awareness as built-in MCP |
| #15309 | Context breakdown visible in statusline |
| #15277 | `/clear --keep N` to preserve last N messages |
| #14940 | Token usage metrics exposed to the model |

---

## 🟢 Low Importance

- #15294 History in VSCode extension
- #15072 /status command in non-interactive mode
- #14949 /issue skill to create GitHub issues
- #12140 /skills command to list available skills

---

## Stats
| Metric | Count |
|--------|-------|
| Total closed | 93 |
| Enhancements | 29 |
| Bug fixes | 52 |
| Other | 12 |
```

</details>

## Installation

### Prerequisites

```bash
# Install GitHub CLI (required)
brew install gh

# Authenticate with GitHub
gh auth login
```

### Install the Skill

```bash
# One-liner: download skill to Claude Code skills directory
curl -o ~/.claude/skills/claude-code-digest.md \
  https://raw.githubusercontent.com/palpen/claude-code-digest/main/claude-code-digest.md
```

Or manually:
```bash
# Clone and copy
git clone https://github.com/palpen/claude-code-digest.git
cp claude-code-digest/claude-code-digest.md ~/.claude/skills/
```

## Usage

Just ask Claude Code:

```
"Generate the Claude Code weekly digest"
"What's new in Claude Code this week?"
"Run the claude-code-digest skill"
"Show me Claude Code updates from the last 14 days"
```

Claude will:
1. Fetch closed issues from GitHub
2. Analyze and rate each issue's importance
3. Generate a digest with TL;DR summary
4. Save to `~/Desktop/claude-code-digest-YYYY-MM-DD.md`

## Customization

Ask Claude to adjust:
- **Lookback period**: "Show me the last 30 days"
- **Output location**: "Save it to ~/Documents instead"
- **Focus area**: "Only show MCP-related changes"

## Importance Ratings

| Rating | Meaning |
|--------|---------|
| 🔴 Critical | Security fixes, breaking changes, data loss bugs |
| 🟠 High | Major features, significant UX improvements |
| 🟡 Medium | Useful features, platform-specific fixes |
| 🟢 Low | Minor enhancements, documentation |

## License

MIT
