---
name: prp-project-setup
description: Interactive PRP project setup with questionnaire and file generation
---

# PRP Project Setup Skill

## Overview

This skill guides users through an interactive questionnaire to set up a complete PRP (Product Requirement Prompt) project. It collects information conversationally, uses web search to help with unknowns, and generates all necessary files for context engineering with AI coding assistants.

## Official PRP Repositories

**IMPORTANT**: Always reference these repositories for examples, templates, and patterns:

### Primary Repository - Context Engineering Intro
```
https://github.com/coleam00/Context-Engineering-Intro
```

This is the main template repository containing:
- Base PRP templates and commands
- MCP Server use case (`use-cases/mcp-server/`)
- Pydantic AI use case (`use-cases/pydantic-ai/`)
- Template generator for new use cases (`use-cases/template-generator/`)
- Complete examples and documentation

**Key files to reference:**
- `CLAUDE.md` - Example global rules file
- `INITIAL.md` / `INITIAL_EXAMPLE.md` - Feature request examples
- `.claude/commands/generate-prp.md` - PRP generation command
- `.claude/commands/execute-prp.md` - PRP execution command
- `PRPs/templates/prp_base.md` - Base PRP template
- `PRPs/EXAMPLE_multi_agent_prp.md` - Complete PRP example

### Secondary Repository - PRPs Agentic Engineering
```
https://github.com/Wirasm/PRPs-agentic-eng
```

Created by Raasmus, the original PRP framework creator. Contains:
- Advanced PRP commands and templates
- Additional slash commands for code review, refactoring, debugging
- Detailed documentation on PRP methodology

**Key resources:**
- Extended command library (12+ commands)
- AI docs patterns for library documentation
- Advanced PRP templates (spec, planning, task)

### Use Case Templates

When users are building specific types of projects, reference these specialized templates:

**MCP Servers:**
```
https://github.com/coleam00/Context-Engineering-Intro/tree/main/use-cases/mcp-server
```
- Complete MCP server template with GitHub OAuth
- Cloudflare Workers deployment
- Database integration patterns

**Pydantic AI Agents:**
```
https://github.com/coleam00/Context-Engineering-Intro/tree/main/use-cases/pydantic-ai
```
- AI agent development patterns
- Tool integration examples
- Testing with TestModel/FunctionModel

### When to Reference Repositories

1. **User asks for examples**: Point them to specific files in the repos
2. **User wants to see a complete PRP**: Reference `PRPs/EXAMPLE_multi_agent_prp.md`
3. **User building MCP server**: Suggest cloning the mcp-server use case
4. **User building AI agent**: Suggest cloning the pydantic-ai use case
5. **User wants more commands**: Reference Wirasm/PRPs-agentic-eng for extended commands
6. **Generating files**: Use the repo files as authoritative templates

## When to Use This Skill

Use this skill when:
- User wants to start a new project using the PRP framework
- User wants to add PRP workflow to an existing codebase
- User says things like "help me set up PRP", "create a PRP project", "I want to use context engineering"
- User asks about setting up CLAUDE.md, INITIAL.md, or PRP templates

## Template Selection Logic

**IMPORTANT**: Before going through the full questionnaire, check if a specialized template would be better:

### Suggest Cloning MCP Server Template When:
- User mentions "MCP server", "Model Context Protocol", or "AI tools"
- User mentions "Cloudflare Workers" + "OAuth"
- User wants to build tools for Claude or other AI assistants

**Response:**
```
For building an MCP server, there's a complete specialized template available:

git clone https://github.com/coleam00/Context-Engineering-Intro.git
cd Context-Engineering-Intro/use-cases/mcp-server
python copy_template.py /path/to/your-project

This includes GitHub OAuth, database integration, and Cloudflare deployment 
already configured. Would you like to use this template, or set up from scratch?
```

### Suggest Cloning Pydantic AI Template When:
- User mentions "Pydantic AI", "AI agent", or "agent with tools"
- User wants LLM-powered features with structured outputs
- User mentions building agents similar to research/email agents

**Response:**
```
For building AI agents with Pydantic AI, there's a specialized template:

git clone https://github.com/coleam00/Context-Engineering-Intro.git
cd Context-Engineering-Intro/use-cases/pydantic-ai
python copy_template.py /path/to/your-project

This includes agent patterns, tool integration, and testing examples.
Would you like to use this template, or set up from scratch?
```

### Use Full Questionnaire When:
- User's project doesn't match existing templates
- User explicitly wants a custom setup
- User is adding PRP to existing codebase
- User wants to learn by going through the process

---

## Two Modes: Setup vs. Add Feature

This skill operates in **two modes** depending on what the user needs:

### Mode 1: Project Setup (Full Questionnaire)
**Triggers:**
- "Help me set up a PRP project"
- "Create a new project with context engineering"
- "Set up PRP for my codebase"
- User has no existing CLAUDE.md or PRP structure

**What it does:** Full 10-phase questionnaire → Generates all project files

### Mode 2: Add New Feature (Light Questionnaire)
**Triggers:**
- "I want to add a new feature"
- "Help me create an INITIAL.md for a new feature"
- "I need to build [feature] in my project"
- User already has PRP set up (has CLAUDE.md, PRPs/ folder)

**What it does:** 6-question feature questionnaire → Generates new INITIAL.md

### How to Detect Which Mode

Ask the user:
```
Do you need to:
A) Set up a new PRP project from scratch
B) Add a new feature to an existing PRP project

(If you already have CLAUDE.md and a PRPs/ folder, choose B)
```

Or detect automatically if user mentions they already have PRP set up.

## Fetching Resources from Repositories

When you need to show users specific examples or verify patterns, fetch from GitHub:

### Fetch Commands
```python
# Show example INITIAL.md
web_fetch("https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/INITIAL_EXAMPLE.md")

# Show complete PRP example
web_fetch("https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/PRPs/EXAMPLE_multi_agent_prp.md")

# Show CLAUDE.md example
web_fetch("https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/CLAUDE.md")

# Show base PRP template
web_fetch("https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/PRPs/templates/prp_base.md")
```

### When to Fetch
- User asks "show me an example"
- User wants to see what a complete file looks like
- You need to verify the exact format/structure
- User is confused about a section

## Mode Questionnaires

### Mode 1: Full Project Setup

For users setting up PRP from scratch, see the detailed 10-phase questionnaire in `references/mode-1-project-setup.md`.

This comprehensive questionnaire covers:
- Project basics and tech stack
- Code standards and testing requirements
- Development workflow
- Feature definition
- Examples, documentation, and gotchas
- Success criteria

---

### Mode 2: Add New Feature

For users who already have PRP set up and want to add a new feature to their project, see the detailed flow in `references/mode-2-add-feature.md`.

This is a lighter 6-question questionnaire that generates only a new INITIAL.md file.

---

## File Generation Phase

After collecting all information in the full setup questionnaire, generate the complete project structure.

### Files to Generate

#### 1. CLAUDE.md

Generate based on:
- Tech stack answers (Phase 2)
- Code standards (Phase 3)
- Testing requirements (Phase 4)
- Development workflow (Phase 5)
- Gotchas (Phase 9)

Template structure:
```markdown
# Project Guidelines for AI Assistant

## Project Overview
[From Q1.2 - project description]

## Tech Stack
[From Phase 2 answers]

## Project Awareness & Context
- Always read PLANNING.md at the start of a new conversation
- Check TASK.md before starting work
- Use consistent naming conventions as described below

## Code Structure & Modularity
[From Phase 3 answers - file limits, organization]

## Testing & Reliability
[From Phase 4 answers]

## Development Commands
[From Phase 5 answers]

## Style & Conventions
[From Phase 3 answers - linting, types, docstrings]

## Known Gotchas
[From Phase 9 answers]

## AI Behavior Rules
- Never assume missing context - ask questions if uncertain
- Never hallucinate libraries or functions
- Always confirm file paths exist before referencing them
[Add stack-specific rules based on research]
```

#### 2. INITIAL.md

Generate based on:
- Feature description (Phase 6)
- Examples (Phase 7)
- Documentation (Phase 8)
- Gotchas (Phase 9)
- Success criteria (Phase 10)

Template:
```markdown
## FEATURE:

[Detailed feature description from Q6.1 and Q6.2]

## EXAMPLES:

[From Phase 7 - list each example and its purpose]

## DOCUMENTATION:

[From Phase 8 - all documentation URLs with descriptions]

## OTHER CONSIDERATIONS:

[From Phase 9 - gotchas, security, additional files]
[From Phase 10 - success criteria]
```

#### 3. .claude/commands/generate-prp.md

Standard command file - customize validation commands based on their tech stack.

#### 4. .claude/commands/execute-prp.md

Standard command file - customize based on their workflow.

#### 5. PRPs/templates/prp_base.md

Standard PRP template - customize validation loop commands for their stack.

#### 6. Folder Structure

Create:
```
project-name/
├── .claude/
│   └── commands/
│       ├── generate-prp.md
│       └── execute-prp.md
├── PRPs/
│   ├── templates/
│   │   └── prp_base.md
│   └── ai_docs/
├── examples/
│   └── README.md
├── CLAUDE.md
├── INITIAL.md
├── PLANNING.md (basic template)
└── TASK.md (basic template)
```

---

## Conversation Flow Guidelines

### Be Conversational
- Ask one question (or one related group) at a time
- Acknowledge answers before moving on
- Summarize periodically: "Great, so far we have: Python + FastAPI + PostgreSQL..."

### Handle Uncertainty
When user says "I don't know" or "not sure":
1. Acknowledge it's okay to not know
2. Ask clarifying questions about their use case
3. Use web_search to research options
4. Present 2-3 recommendations with pros/cons
5. Make a recommendation based on their needs

### Adapt Questions
- Skip irrelevant questions (no frontend questions for CLI tools)
- Add follow-up questions when needed
- Combine simple questions when appropriate

### Research Proactively
For any library/framework mentioned:
- Search for best practices
- Find common gotchas
- Locate official documentation
- Add these to the generated files automatically

---

## Output Delivery

After all questions are answered:

1. **Summarize** everything collected
2. **Confirm** with user before generating
3. **Generate all files** with full content
4. **Provide next steps**:
   ```
   Your PRP project is set up! Here's what to do next:
   
   1. Review CLAUDE.md and adjust any rules
   2. Add code examples to the examples/ folder
   3. Edit INITIAL.md if you want to refine your feature description
   4. Run: /generate-prp INITIAL.md
   5. Review the generated PRP
   6. Run: /execute-prp PRPs/[your-feature].md
   ```

---

## Quality Standards

### For Generated CLAUDE.md
- [ ] All commands are correct for their stack
- [ ] Testing requirements match their framework
- [ ] Gotchas are specific and actionable
- [ ] Style rules match their preferences

### For Generated INITIAL.md
- [ ] Feature description is detailed and specific
- [ ] All documentation URLs are valid
- [ ] Examples are properly referenced
- [ ] Gotchas prevent common AI mistakes

### For Slash Commands
- [ ] Validation commands match their stack
- [ ] File paths are correct
- [ ] Template references are accurate
