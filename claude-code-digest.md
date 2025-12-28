---
name: claude-code-digest
description: Generate weekly Claude Code repository digest with TL;DR, explanations, and importance ratings. Use when asked about Claude Code updates, weekly digest, changelog, or repository changes.
---

# Claude Code Weekly Digest

Generate an analyzed weekly digest of the anthropics/claude-code repository.

## Prerequisites
- GitHub CLI (`gh`) must be installed and authenticated
- `jq` for JSON processing

## Workflow

### Step 1: Fetch Closed Issues

Run these commands to gather data. Default is 7 days, but user can specify different period.

```bash
# Set the lookback period (default 7 days)
DAYS_AGO=7
REPO="anthropics/claude-code"

# Calculate date (macOS)
SINCE_DATE=$(date -v-${DAYS_AGO}d +%Y-%m-%d)
# For Linux use: SINCE_DATE=$(date -d "${DAYS_AGO} days ago" +%Y-%m-%d)
```

Fetch each category:

```bash
# High priority issues
gh issue list --repo "$REPO" --state closed \
  --search "closed:>=$SINCE_DATE label:priority:high" \
  --limit 50 --json number,title,labels,closedAt

# Enhancements (new features)
gh issue list --repo "$REPO" --state closed \
  --search "closed:>=$SINCE_DATE label:enhancement" \
  --limit 50 --json number,title,labels,closedAt

# Bug fixes
gh issue list --repo "$REPO" --state closed \
  --search "closed:>=$SINCE_DATE label:bug -label:invalid -label:duplicate" \
  --limit 50 --json number,title,labels,closedAt

# Other closed issues
gh issue list --repo "$REPO" --state closed \
  --search "closed:>=$SINCE_DATE -label:enhancement -label:bug -label:invalid -label:duplicate -label:wontfix -label:\"not planned\"" \
  --limit 50 --json number,title,labels,closedAt
```

### Step 2: Analyze Each Issue

For each issue, determine:

**Brief Explanation**: 1-2 sentences explaining what this change means for users

**Importance Rating**:
- 🔴 **Critical** - Security fixes, major breaking changes, widespread issue fixes
- 🟠 **High** - Major new features, significant UX improvements, common pain point fixes
- 🟡 **Medium** - Useful features, quality-of-life improvements, platform-specific fixes
- 🟢 **Low** - Minor enhancements, edge case fixes, documentation updates

### Step 3: Generate Analyzed Digest

Create file: `~/Desktop/claude-code-digest-YYYY-MM-DD.md`

Structure:
```markdown
# Claude Code Weekly Digest
**Period:** [start date] to [end date]
**Generated:** [timestamp]

---

## TL;DR - Key Changes This Week

[3-5 bullet points highlighting the MOST important changes:
- Features that change how Claude Code is used
- Security or stability fixes
- Breaking changes or behavior modifications]

---

## 🔴 Critical Changes
[Security, data loss, breaking changes - if any]

## 🟠 High Importance

### [Issue Title]
**[1-2 sentence explanation of what this means for users]**
- Labels: [labels]
- Link: [url]

## 🟡 Medium Importance
[Table format for brevity]

## 🟢 Low Importance
[Grouped by category, minimal detail]

---

## Stats
| Metric | Count |
|--------|-------|
| Total closed | X |
| Enhancements | X |
| Bug fixes | X |
```

### Step 4: Present Summary

Show the TL;DR section first and ask if user wants details on any section.

## Analysis Guidelines

Prioritize for the user's workflow:
- Changes affecting productivity
- Reliability and stability fixes
- Security issues
- Breaking changes

Flag anything related to:
- Hooks and skills
- MCP servers
- IDE integrations (VS Code, JetBrains)
- API changes
- Context/memory management

## Label Reference

The repo uses these labels:
- **Priority**: `priority:high`, `priority:med`
- **Type**: `enhancement`, `bug`, `documentation`
- **Area**: `area:core`, `area:mcp`, `area:tools`, `area:hooks`, `area:sdk`, `area:ide`
- **Platform**: `platform:windows`, `platform:macos`, `platform:linux`
