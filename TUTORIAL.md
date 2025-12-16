# PRP Skill Tutorial

A practical guide to using the PRP Project Setup skill for AI-assisted development.

---

## What is PRP?

**PRP (Product Requirement Prompt)** is a framework for giving AI coding assistants everything they need to implement features correctly on the first pass.

The formula:

```
PRP = PRD + Codebase Intelligence + Agent Runbook
```

- **PRD (Product Requirements)**: What you want to build — goals, requirements, success criteria
- **Codebase Intelligence**: Your existing patterns, documentation, examples to follow
- **Agent Runbook**: Step-by-step implementation tasks with validation commands

### The Problem PRP Solves

When you ask an AI to "add user authentication," it doesn't know:
- Your project structure
- Your preferred patterns
- Your testing requirements
- Your linting rules
- Common mistakes with your stack
- What "done" looks like

Without this context, the AI guesses. Sometimes it's right. Often it's not.

**PRP eliminates the guessing** by packaging all necessary context into a structured format the AI can follow.

---

## How Does This Skill Work?

The PRP Project Setup skill automates the setup process through an **interactive questionnaire**. Instead of manually creating 6+ interconnected files, you answer questions and the skill generates everything.

### What Gets Generated

```
your-project/
├── .claude/
│   └── commands/
│       ├── generate-prp.md      # /generate-prp command
│       └── execute-prp.md       # /execute-prp command
├── PRPs/
│   ├── templates/
│   │   └── prp_base.md          # Base PRP template
│   └── ai_docs/                 # Custom documentation
├── examples/
│   └── README.md                # Code patterns folder
├── CLAUDE.md                    # Global AI rules
├── INITIAL.md                   # Your feature request
├── PLANNING.md                  # Architecture document
└── TASK.md                      # Task tracking
```

Each file is customized based on your answers — your tech stack, your commands, your patterns.

---

## Why Does This Matter?

### The Difference in Practice

**Without PRP:**
```
You: Add a notification service that emails users when tasks are overdue

AI: *creates notification_service.py*
    - Uses wrong import style
    - Puts file in wrong directory
    - Doesn't follow your async patterns
    - Forgets your error handling conventions
    - No tests
    - Uses deprecated Pydantic v1 syntax

You: *spends 30 minutes fixing issues*
```

**With PRP:**
```
You: /execute-prp PRPs/notification-service.md

AI: *reads PRP with full context*
    - Follows your service pattern from examples/
    - Uses your project structure
    - Applies async patterns from CLAUDE.md
    - Writes tests in your style
    - Uses correct Pydantic v2 syntax
    - Runs validation commands after each step

Result: Working code that fits your codebase
```

### The Core Insight

> "Most agent failures aren't model failures — they're context failures."

The AI is capable. It just doesn't know what you know about your project. PRP transfers that knowledge.

---

## The Workflow

### Two Modes

The skill operates in two modes depending on what you need:

| Mode | When to Use | Output |
|------|-------------|--------|
| **Setup** | New project or adding PRP to existing code | All files |
| **Add Feature** | You already have PRP set up | New INITIAL.md only |

### Mode 1: Project Setup (One-Time)

Use this when starting fresh or adding PRP to an existing codebase.

**What You Do:**

1. **Start the skill**: Say "Help me set up a PRP project"

2. **Answer questions** (10 phases, ~30 questions):
   - Project basics (name, description)
   - Tech stack (language, framework, database)
   - Code standards (file limits, organization, linting)
   - Testing (framework, location, requirements)
   - Development workflow (commands, environment)
   - Feature definition (what to build first)
   - Examples (patterns to follow)
   - Documentation (URLs the AI needs)
   - Gotchas (mistakes to avoid)
   - Success criteria (definition of done)

3. **Review generated files**: Check that commands are correct, patterns make sense

4. **Add code examples**: Put good patterns in `examples/` folder

**What the Skill Does:**

- Asks questions one at a time, conversationally
- Researches when you say "I don't know" (e.g., finds best testing framework for your stack)
- Summarizes periodically so you can verify
- Generates all files customized to your answers
- Includes gotchas specific to your tech stack

### Mode 2: Add Feature (Repeatable)

Use this for each new feature after initial setup.

**What You Do:**

1. **Start the flow**: Say "I want to add a new feature"

2. **Answer 6 questions**:
   - What feature to build
   - Component breakdown
   - External APIs/libraries needed
   - Existing patterns to follow
   - Gotchas and constraints
   - Success criteria

3. **Run the commands**:
   ```bash
   /generate-prp INITIAL.md    # Creates the full PRP
   /execute-prp PRPs/feature.md  # Implements the feature
   ```

**What the Skill Does:**

- Generates a new INITIAL.md with your feature request
- Researches documentation URLs if you don't know them
- Structures the request so `/generate-prp` can expand it

---

## What You Do vs What the Framework Does

### Your Responsibilities

| Task | When | Why You Do It |
|------|------|---------------|
| Answer questionnaire | Setup | Only you know your project requirements |
| Add code examples | Setup + ongoing | Real patterns are better than descriptions |
| Define features | Each feature | Only you know what to build |
| Review generated PRPs | Each feature | Catch any missing context |
| Update CLAUDE.md | When you discover gotchas | Keep rules current |

### Framework Responsibilities

| Task | How | Why It Helps |
|------|-----|--------------|
| Generate CLAUDE.md | From your tech stack answers | Consistent AI rules |
| Generate slash commands | Customized to your stack | Commands that actually work |
| Generate PRP templates | With your validation commands | Tests that match your setup |
| Research unknowns | Web search when you're unsure | Finds best practices |
| Structure PRPs | Standard format | AI can parse consistently |
| Validation loops | Built into execute-prp | AI self-corrects errors |

---

## The Complete Cycle

Here's what a typical feature implementation looks like:

```
┌─────────────────────────────────────────────────────────────┐
│                     1. DEFINE FEATURE                       │
│                                                             │
│  You: "I want to add a notification service"                │
│  Skill: Asks 6 questions, generates INITIAL.md              │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     2. GENERATE PRP                         │
│                                                             │
│  You: /generate-prp INITIAL.md                              │
│  AI: Reads INITIAL.md + CLAUDE.md + examples/               │
│      Researches documentation                               │
│      Creates PRPs/notification-service.md                   │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      3. REVIEW PRP                          │
│                                                             │
│  You: Read PRPs/notification-service.md                     │
│       Verify: correct files, right patterns, all context    │
│       Add anything missing                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     4. EXECUTE PRP                          │
│                                                             │
│  You: /execute-prp PRPs/notification-service.md             │
│  AI: Reads all context                                      │
│      Implements tasks in order                              │
│      Runs validation after each task                        │
│      Fixes issues automatically                             │
│      Verifies success criteria                              │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    5. VERIFY & ITERATE                      │
│                                                             │
│  You: Test the implementation                               │
│       Add new gotchas to CLAUDE.md if discovered            │
│       Move PRP to PRPs/completed/                           │
│       Update TASK.md                                        │
└─────────────────────────────────────────────────────────────┘
```

---

## Key Files Explained

### CLAUDE.md — The Rulebook

This is the **global context** that applies to everything. The AI reads this at the start of every conversation.

Contains:
- Tech stack (so AI uses correct syntax)
- Code structure rules (so AI puts files in right places)
- Testing requirements (so AI writes proper tests)
- Development commands (so AI can run validation)
- Gotchas (so AI avoids known mistakes)
- AI behavior rules (so AI asks instead of guessing)

**Example rule:**
```markdown
## Known Gotchas

# CRITICAL: Pydantic v2 uses model_validate() not parse_obj()
# The old parse_obj() method was removed in Pydantic v2

# CRITICAL: Always use async endpoints in FastAPI for database calls
# Sync endpoints block the event loop and kill performance
```

### INITIAL.md — The Feature Request

This is your **feature definition**. It's the input to `/generate-prp`.

Contains:
- What you want to build
- Components and their responsibilities
- Examples to follow
- Documentation URLs
- Gotchas specific to this feature
- Success criteria

**Example:**
```markdown
## FEATURE:

Build a notification service that emails users when their tasks are overdue.

### Components

**OverdueChecker**
- Purpose: Queries database for tasks past due date
- Inputs: None (runs on schedule)
- Outputs: List of overdue tasks with user info

**EmailSender**
- Purpose: Sends emails via SendGrid
- Inputs: User email, task details
- Outputs: Delivery status

## DOCUMENTATION:

- https://docs.sendgrid.com/api-reference/mail-send
  - Why: Email sending API

## SUCCESS CRITERIA:

- [ ] Users receive email within 5 minutes of task becoming overdue
- [ ] Failed sends are logged and retried
- [ ] Rate limited to 100 emails/minute
```

### PRPs/ — Generated Implementation Plans

After running `/generate-prp`, you get a full PRP in this folder.

The PRP expands your INITIAL.md with:
- Specific file paths to create
- References to example patterns
- Ordered implementation tasks
- Validation commands for each step
- Complete context from CLAUDE.md

### examples/ — Code Patterns

Put your best code here. When the AI sees "follow the pattern in examples/base_service.py," it knows exactly what style to use.

Good examples to add:
- A well-structured service class
- Your async patterns
- Your test structure
- Your model definitions

---

## Practical Tips

### 1. Be Specific in INITIAL.md

**Vague:**
```
Build a notification system
```

**Better:**
```
Build a notification service that:
- Checks for overdue tasks every hour via cron
- Sends emails via SendGrid API
- Logs all send attempts to the notifications table
- Retries failed sends up to 3 times with exponential backoff
```

### 2. Add Real Examples

The AI learns better from code than descriptions. A real `examples/async_service.py` is worth more than paragraphs explaining your async patterns.

### 3. Update CLAUDE.md When You Find Gotchas

If the AI makes a mistake, add it to CLAUDE.md:

```markdown
# CRITICAL: Don't use datetime.now() — use datetime.utcnow() for consistency
# We store all timestamps in UTC and convert on display
```

Next time, the AI won't make that mistake.

### 4. Review Generated PRPs Before Executing

The `/generate-prp` command expands your feature request. Check that:
- File paths are correct
- Referenced examples exist
- Tasks are in right order
- Success criteria are measurable

### 5. Use Mode 2 for Each New Feature

After initial setup, you only need the lightweight 6-question flow. Don't re-run the full setup — just create a new INITIAL.md for each feature.

---

## Quick Reference

### Starting Fresh
```
"Help me set up a PRP project"
→ Answer ~30 questions
→ Get all files generated
→ Add examples to examples/
```

### Adding Features
```
"I want to add a new feature"
→ Answer 6 questions
→ Run /generate-prp INITIAL.md
→ Review the PRP
→ Run /execute-prp PRPs/feature.md
```

### When Something Goes Wrong
```
1. Check CLAUDE.md — is the rule there?
2. Check examples/ — is there a pattern to follow?
3. Check the PRP — is context complete?
4. Add missing gotcha to CLAUDE.md
5. Regenerate PRP if needed
```

---

## Summary

| Concept | Purpose |
|---------|---------|
| **PRP** | The full context package for AI implementation |
| **CLAUDE.md** | Global rules that apply to everything |
| **INITIAL.md** | Your feature request |
| **Generated PRP** | Expanded plan with full context |
| **/generate-prp** | Creates PRP from INITIAL.md |
| **/execute-prp** | Implements PRP with validation loops |
| **examples/** | Code patterns for AI to follow |

The PRP skill automates setup. You answer questions, it generates files. After that, you define features and the framework ensures the AI has everything it needs to build them right.

---

*For more information, see the [official PRP repositories](https://github.com/coleam00/Context-Engineering-Intro) and [Raasmus's original framework](https://github.com/Wirasm/PRPs-agentic-eng).*
