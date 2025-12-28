# Claude Code Digest

A Claude Code skill that generates weekly digests of the [anthropics/claude-code](https://github.com/anthropics/claude-code) repository with AI-powered analysis, explanations, and importance ratings.

## What It Does

1. **Fetches closed issues** from the Claude Code repo for a configurable time period
2. **Analyzes each issue** and rates importance (Critical → Low)
3. **Generates TL;DR** highlighting the most important changes
4. **Saves analyzed digest** to your Desktop

## Sample Output

```
## TL;DR - Key Changes This Week

- 🔴 Security Fix: Username data leakage fixed in statusline agent
- 🔴 Security Fix: .env.local no longer loaded (was exposing secrets)
- 🟠 Feature: Session naming with --session-name (finally!)
- 🟠 Feature: Context persists across compaction events
```

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
