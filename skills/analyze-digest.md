---
name: analyze-digest
description: Generate and analyze weekly Claude Code repository digest with TL;DR, explanations, and importance ratings. Use when asked about Claude Code updates, weekly digest, or repository changes.
---

# Claude Code Digest Analysis

Generate an analyzed weekly digest of the anthropics/claude-code repository with TL;DR, explanations, and importance ratings.

## Workflow

### Step 1: Fetch Raw Data
Run the digest script. Accept optional days parameter (default: 7):

```bash
~/.claude/plugins/claude-code-digest/scripts/digest.sh [DAYS] [OUTPUT_DIR]
```

Examples:
- `digest.sh` - Last 7 days, output to Desktop
- `digest.sh 14` - Last 14 days
- `digest.sh 7 ~/Documents` - Custom output directory

### Step 2: Read the Generated Digest
Read the generated file from the output directory (default: `~/Desktop/claude-code-weekly-digest-YYYY-MM-DD.md`).

### Step 3: Analyze Each Issue

For each issue, determine:

**Brief Explanation**: 1-2 sentences explaining what this change means for users

**Importance Rating**:
- 🔴 **Critical** - Security fixes, major breaking changes, widespread issue fixes
- 🟠 **High** - Major new features, significant UX improvements, common pain point fixes
- 🟡 **Medium** - Useful features, quality-of-life improvements, platform-specific fixes
- 🟢 **Low** - Minor enhancements, edge case fixes, documentation updates

### Step 4: Generate Enhanced Digest

Create a new file: `[OUTPUT_DIR]/claude-code-analyzed-digest-YYYY-MM-DD.md`

Structure:
```markdown
# Claude Code Weekly Digest (Analyzed)
**Period:** [date range]
**Generated:** [timestamp]

---

## TL;DR - Key Changes This Week

[3-5 bullet points highlighting the MOST important changes. Focus on:
- Features that change how Claude Code is used
- Security or stability fixes
- Changes relevant to the user's workflow]

---

## 🔴 Critical Changes
[If any - security, data loss, breaking changes]

## 🟠 High Importance
[Major features and significant fixes with explanations]

## 🟡 Medium Importance
[Useful changes in table format]

## 🟢 Low Importance
[Minor changes, grouped by category]

---

## Stats
[Counts by category]
```

### Step 5: Present Summary
Show the TL;DR section and ask if user wants details on any section.

## Analysis Guidelines

Consider the user's context - prioritize:
- Changes affecting productivity and workflows
- Reliability and stability fixes
- Security issues
- Breaking changes or behavior modifications

Flag anything related to:
- Hooks and skills
- MCP servers
- IDE integrations (VS Code, JetBrains)
- API changes
- Context/memory management
