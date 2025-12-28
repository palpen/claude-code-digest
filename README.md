# Claude Code Digest

A tool to generate weekly digests of the [anthropics/claude-code](https://github.com/anthropics/claude-code) repository with AI-powered analysis, explanations, and importance ratings.

## What It Does

1. **Fetches closed issues** from the Claude Code repo for a configurable time period
2. **Categorizes by type**: High priority, enhancements, bug fixes, other
3. **Claude analyzes** each issue and rates importance (Critical → Low)
4. **Generates TL;DR** highlighting the most important changes

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

- [GitHub CLI](https://cli.github.com/) (`gh`) - authenticated
- `jq` for JSON processing

```bash
# Install prerequisites (macOS)
brew install gh jq

# Authenticate with GitHub
gh auth login
```

### Install the Plugin

```bash
# Clone to Claude Code plugins directory
git clone https://github.com/palpen/claude-code-digest.git ~/.claude/plugins/claude-code-digest

# Make script executable
chmod +x ~/.claude/plugins/claude-code-digest/scripts/digest.sh

# Optional: Add to PATH for easy access
echo 'export PATH="$PATH:$HOME/.claude/plugins/claude-code-digest/scripts"' >> ~/.zshrc
```

## Usage

### Generate Raw Digest

```bash
# Default: last 7 days, output to Desktop
~/.claude/plugins/claude-code-digest/scripts/digest.sh

# Custom: last 14 days
~/.claude/plugins/claude-code-digest/scripts/digest.sh 14

# Custom: last 7 days, output to specific directory
~/.claude/plugins/claude-code-digest/scripts/digest.sh 7 ~/Documents
```

### Analyze with Claude

After generating the raw digest, ask Claude Code to analyze it:

```
"Analyze the Claude Code digest on my Desktop"
```

Or use the skill directly:

```
"Run the analyze-digest skill"
```

Claude will:
- Read the raw digest
- Evaluate each issue's importance
- Generate an analyzed digest with explanations
- Present a TL;DR summary

## Output Files

| File | Description |
|------|-------------|
| `claude-code-weekly-digest-YYYY-MM-DD.md` | Raw digest with all closed issues |
| `claude-code-analyzed-digest-YYYY-MM-DD.md` | Analyzed digest with TL;DR and explanations |

## Importance Ratings

| Rating | Meaning |
|--------|---------|
| 🔴 Critical | Security fixes, breaking changes, data loss bugs |
| 🟠 High | Major features, significant UX improvements |
| 🟡 Medium | Useful features, platform-specific fixes |
| 🟢 Low | Minor enhancements, documentation |

## Customization

### Change Default Lookback Period

Edit `scripts/digest.sh` line 4:
```bash
DAYS_AGO="${1:-7}"  # Change 7 to your preferred default
```

### Change Default Output Directory

Edit `scripts/digest.sh` line 5:
```bash
OUTPUT_DIR="${2:-$HOME/Desktop}"  # Change to your preferred location
```

## License

MIT
