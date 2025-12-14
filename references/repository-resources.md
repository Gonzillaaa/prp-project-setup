# Repository Resources Reference

Detailed guide to resources available in the official PRP repositories.

---

## Primary Repository: Context Engineering Intro

**URL:** `https://github.com/coleam00/Context-Engineering-Intro`

### Root Level Files

| File | Purpose | When to Reference |
|------|---------|-------------------|
| `CLAUDE.md` | Example global rules for Python projects | When generating user's CLAUDE.md |
| `INITIAL.md` | Feature request template | When explaining INITIAL.md format |
| `INITIAL_EXAMPLE.md` | Complete feature request example | When user wants to see a real example |
| `README.md` | Full documentation on context engineering | When user asks "what is PRP?" |

### Commands (`.claude/commands/`)

| Command | File | Purpose |
|---------|------|---------|
| `/generate-prp` | `generate-prp.md` | Generates PRP from INITIAL.md |
| `/execute-prp` | `execute-prp.md` | Executes PRP to implement feature |

### PRP Templates (`PRPs/templates/`)

| Template | Purpose | Use When |
|----------|---------|----------|
| `prp_base.md` | Base PRP structure | Default for most projects |
| `prp_base_typescript.md` | TypeScript-specific PRP | TypeScript/Node.js projects |
| `prp_planning.md` | Planning/PRD generation | High-level planning needed |
| `prp_spec.md` | Specification template | Detailed specs for refactoring |

### Example PRPs (`PRPs/`)

| File | Description |
|------|-------------|
| `EXAMPLE_multi_agent_prp.md` | Complete PRP for Pydantic AI agents with research + email tools |

---

## MCP Server Use Case

**Path:** `use-cases/mcp-server/`
**URL:** `https://github.com/coleam00/Context-Engineering-Intro/tree/main/use-cases/mcp-server`

### When to Suggest This Template

- User is building an MCP (Model Context Protocol) server
- User mentions Cloudflare Workers
- User needs OAuth authentication for AI tools
- User wants to build tools for Claude/AI assistants

### Key Files

```
use-cases/mcp-server/
├── CLAUDE.md                    # MCP-specific global rules
├── copy_template.py             # Script to copy template to new project
├── .claude/commands/
│   ├── prp-mcp-create.md       # MCP-specific PRP generation
│   └── prp-mcp-execute.md      # MCP-specific PRP execution
├── PRPs/
│   ├── INITIAL.md              # Example MCP server request
│   ├── templates/
│   │   └── prp_mcp_base.md     # MCP-specialized PRP template
│   └── ai_docs/
│       ├── mcp_patterns.md     # MCP development patterns
│       └── claude_api_usage.md # Anthropic API integration
├── src/
│   ├── index.ts                # Main MCP server with OAuth
│   ├── github-handler.ts       # GitHub OAuth implementation
│   ├── database.ts             # PostgreSQL integration
│   └── tools/
│       └── register-tools.ts   # Tool registration system
└── examples/
    ├── database-tools.ts       # Example tool implementation
    └── database-tools-sentry.ts # Tools with monitoring
```

### Usage

```bash
# Clone and copy template
git clone https://github.com/coleam00/Context-Engineering-Intro.git
cd Context-Engineering-Intro/use-cases/mcp-server
python copy_template.py /path/to/my-mcp-server
```

---

## Pydantic AI Use Case

**Path:** `use-cases/pydantic-ai/`
**URL:** `https://github.com/coleam00/Context-Engineering-Intro/tree/main/use-cases/pydantic-ai`

### When to Suggest This Template

- User is building AI agents with Python
- User mentions Pydantic AI framework
- User wants tool-enabled AI assistants
- User needs structured outputs from LLMs

### Key Files

```
use-cases/pydantic-ai/
├── CLAUDE.md                           # Pydantic AI global rules
├── copy_template.py                    # Template copy script
├── .claude/commands/
│   ├── generate-pydantic-ai-prp.md    # Agent PRP generation
│   └── execute-pydantic-ai-prp.md     # Agent PRP execution
├── PRPs/
│   ├── INITIAL.md                     # Example agent request
│   └── templates/
│       └── prp_pydantic_ai_base.md    # Agent-specific PRP template
└── examples/
    ├── main_agent_reference/          # Complete reference implementation
    │   ├── settings.py                # Environment configuration
    │   ├── providers.py               # LLM provider abstraction
    │   ├── research_agent.py          # Multi-tool research agent
    │   └── email_agent.py             # Email draft agent
    ├── basic_chat_agent/              # Simple chat agent
    ├── tool_enabled_agent/            # Agent with tools
    └── testing_examples/              # TestModel patterns
```

### Usage

```bash
# Clone and copy template
git clone https://github.com/coleam00/Context-Engineering-Intro.git
cd Context-Engineering-Intro/use-cases/pydantic-ai
python copy_template.py /path/to/my-agent-project
```

---

## Extended Repository: PRPs Agentic Engineering

**URL:** `https://github.com/Wirasm/PRPs-agentic-eng`

### Additional Commands

| Command | Purpose |
|---------|---------|
| `/create-base-prp` | Generate comprehensive PRPs with research |
| `/execute-base-prp` | Execute PRPs against codebase |
| `/planning-create` | Create planning documents with diagrams |
| `/spec-create-adv` | Advanced specification creation |
| `/spec-execute` | Execute specifications |
| `/review-general` | General code review |
| `/review-staged-unstaged` | Review git changes |
| `/refactor-simple` | Simple refactoring tasks |
| `/create-pr` | Create pull requests |
| `/prime-core` | Prime Claude with project context |
| `/onboarding` | Onboarding for new team members |
| `/debug` | Debugging workflow |

### When to Reference

- User wants more slash commands beyond generate/execute
- User needs code review workflows
- User wants PR creation automation
- User asks about Raasmus's original framework

---

## Template Generator Use Case

**Path:** `use-cases/template-generator/`
**URL:** `https://github.com/coleam00/Context-Engineering-Intro/tree/main/use-cases/template-generator`

### Purpose

Meta-template for creating NEW use case templates. Use when:
- Creating a template for a new framework (e.g., Supabase, CrewAI)
- User wants to extend PRP for their own tech stack
- Building organization-specific templates

### Key Files

```
use-cases/template-generator/
├── .claude/commands/
│   ├── generate-template-prp.md    # Generate template creation PRP
│   └── execute-template-prp.md     # Execute to create new template
├── PRPs/
│   ├── INITIAL.md                  # Example template request
│   └── templates/
│       └── prp_template_base.md    # Meta-template
└── README.md                       # Template generator documentation
```

---

## Quick Reference: Which Template for Which Project?

| Project Type | Recommended Template | Clone Command |
|--------------|---------------------|---------------|
| Generic Python API | Base template (root) | `git clone https://github.com/coleam00/Context-Engineering-Intro.git` |
| Generic TypeScript | Base template (root) | Same as above, use TS templates |
| MCP Server | `use-cases/mcp-server` | `python copy_template.py` from that directory |
| AI Agent (Pydantic AI) | `use-cases/pydantic-ai` | `python copy_template.py` from that directory |
| New Framework Template | `use-cases/template-generator` | Follow template generator workflow |
| Extended Commands | Clone Wirasm repo | `git clone https://github.com/Wirasm/PRPs-agentic-eng.git` |

---

## Fetching Specific Files

When users need to see specific examples, use web_fetch on raw GitHub URLs:

### Raw File URLs

```
# Base PRP template
https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/PRPs/templates/prp_base.md

# Example INITIAL.md
https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/INITIAL_EXAMPLE.md

# Example complete PRP
https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/PRPs/EXAMPLE_multi_agent_prp.md

# CLAUDE.md example
https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/CLAUDE.md

# MCP patterns documentation
https://raw.githubusercontent.com/coleam00/Context-Engineering-Intro/main/use-cases/mcp-server/PRPs/ai_docs/mcp_patterns.md
```

### When to Fetch

1. User asks "show me an example INITIAL.md" → Fetch INITIAL_EXAMPLE.md
2. User asks "what does a complete PRP look like?" → Fetch EXAMPLE_multi_agent_prp.md
3. User asks about MCP patterns → Fetch mcp_patterns.md
4. User wants to see CLAUDE.md format → Fetch CLAUDE.md

---

## Integration with Questionnaire

### During Phase 2 (Tech Stack)

If user is building:
- **MCP Server** → Mention the mcp-server template, ask if they want to use it
- **AI Agent** → Mention the pydantic-ai template, ask if they want to use it
- **Something else** → Use base template

### During Phase 6 (Feature Definition)

- Reference `INITIAL_EXAMPLE.md` as example format
- If their feature matches a use case, suggest that template

### During File Generation

- Pull patterns from the appropriate repository template
- Use repository examples as authoritative references
- Include links to repos in generated README
