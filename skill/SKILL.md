---
name: prp-project-setup
description: Interactive questionnaire that guides users through setting up a complete PRP (Product Requirement Prompt) project structure. Walks through project basics, tech stack, code standards, and feature requirements conversationally. Uses web search to help users who don't know answers (e.g., "best testing framework for FastAPI"). Generates all necessary files (CLAUDE.md, INITIAL.md, slash commands, templates) at the end. Use when someone wants to start a new project with the PRP framework or add PRP to an existing codebase.
---

# PRP Project Setup Skill

## Overview

This skill guides users through an interactive questionnaire to set up a complete PRP (Product Requirement Prompt) project. It collects information conversationally, uses web search to help with unknowns, and generates all necessary files for context engineering with AI coding assistants.

## When to Use This Skill

Use this skill when:
- User wants to start a new project using the PRP framework
- User wants to add PRP workflow to an existing codebase
- User says things like "help me set up PRP", "create a PRP project", "I want to use context engineering"
- User asks about setting up CLAUDE.md, INITIAL.md, or PRP templates

## Core Workflow

### Phase 1: Introduction & Project Type

Start by explaining what we're doing and asking the first critical question:

```markdown
I'll help you set up a complete PRP (Product Requirement Prompt) project structure. This will create everything you need for effective AI-assisted development:

- **CLAUDE.md** - Global rules for the AI assistant
- **INITIAL.md** - Your feature request template  
- **Slash commands** - /generate-prp and /execute-prp
- **PRP templates** - Base templates for generating PRPs
- **Examples folder** - Code patterns for the AI to follow

Let's start with the basics. I'll ask questions one section at a time, and if you're unsure about anything, just say "I don't know" and I'll research it for you.
```

**Question 1.1**: Project basics
```
What is the name of your project? (lowercase, hyphens for spaces)
Example: "invoice-processor" or "ai-research-agent"
```

**Question 1.2**: Project description
```
In one sentence, what does this project do?
```

**Question 1.3**: New or existing
```
Is this a new project or adding PRP to an existing codebase?
- New project (starting from scratch)
- Existing project (I already have code)
```

---

### Phase 2: Tech Stack Discovery

This section determines the technology stack. **Use web search** when the user says "I don't know" or asks for recommendations.

**Question 2.1**: Primary language
```
What is the primary programming language?
- Python
- TypeScript/JavaScript  
- Go
- Rust
- Other (specify)
```

**Question 2.2**: Framework (adapt based on language)

For **Python**:
```
What backend framework are you using?
- FastAPI
- Flask
- Django
- None / CLI application
- I don't know (I'll help you choose)
```

For **TypeScript/JavaScript**:
```
What framework(s) are you using?

Backend:
- Express
- NestJS
- Hono
- Cloudflare Workers
- None

Frontend:
- React
- Next.js
- Vue/Nuxt
- Svelte
- None
```

**Question 2.3**: Database
```
What database will you use?
- PostgreSQL
- MySQL
- SQLite
- MongoDB
- Supabase or Neon
- None / Not sure yet
```

**Question 2.4**: AI/ML frameworks (if relevant)
```
Are you building anything with AI/ML? If so, what libraries?
- Pydantic AI
- LangChain
- OpenAI SDK
- Anthropic SDK
- None
```

**Question 2.5**: Package manager
```
What package manager do you use?
- pip / uv (Python)
- poetry (Python)
- npm
- yarn
- pnpm
```

**Question 2.6**: Deployment target
```
Where will this be deployed?
- Docker
- Vercel
- AWS Lambda
- Cloudflare Workers
- Railway
- Local only (for now)
- Not sure yet
```

#### Web Research Triggers for Phase 2

If user says "I don't know" or "help me choose", use web_search:

- "best Python web framework 2024 comparison"
- "FastAPI vs Flask vs Django which to choose"
- "best database for [their use case]"
- "recommended AI agent framework Python 2024"

Summarize findings and make a recommendation based on their project description.

---

### Phase 3: Code Standards

**Question 3.1**: File length limit
```
What's your maximum preferred file length? (Helps AI know when to split files)
- 200 lines (strict)
- 300 lines
- 500 lines (recommended default)
- No limit
```

**Question 3.2**: Code organization
```
How do you organize your source code?

For a feature like "user authentication", would you prefer:

A) Single file: auth.py contains everything
B) By layer: models/auth.py, services/auth.py, routes/auth.py  
C) By feature: auth/models.py, auth/services.py, auth/routes.py
D) I don't know / recommend something
```

**Question 3.3**: Linter/formatter
```
What linter/formatter do you use (or want to use)?

Python: ruff, black, flake8, pylint
TypeScript: ESLint, Prettier, Biome
Other: specify

If unsure, I'll recommend based on your stack.
```

**Question 3.4**: Type checking
```
Do you use type hints (Python) or TypeScript strict mode?
- Yes, always enforced
- Yes, but not strictly enforced
- No
```

**Question 3.5**: Docstring style (for Python)
```
What docstring format do you prefer?
- Google style (recommended)
- NumPy style
- Sphinx style
- I don't know
```

---

### Phase 4: Testing Requirements

**Question 4.1**: Testing framework
```
What testing framework do you use?

Python: pytest (recommended), unittest
TypeScript: Jest, Vitest

If unsure, I'll recommend one.
```

**Question 4.2**: Test location
```
Where do tests live?
- /tests folder at project root (recommended)
- Alongside source files (*.test.ts pattern)
- Both
```

**Question 4.3**: Test requirements
```
What types of tests should be required for new features?
- Unit tests only
- Unit + integration tests
- Unit + integration + e2e for critical paths
- I'll let you recommend
```

**Question 4.4**: Minimum test cases
```
For each new feature, what test cases should be required?
- 1 happy path test (minimum)
- Happy path + 1 edge case
- Happy path + edge case + failure case (recommended)
```

---

### Phase 5: Development Workflow

**Question 5.1**: Development server command
```
What command starts your development server?
Examples: 
- "uvicorn main:app --reload"
- "npm run dev"
- "python main.py"
```

**Question 5.2**: Test command
```
What command runs your tests?
Examples: "pytest", "npm test", "uv run pytest"
```

**Question 5.3**: Lint/type check command
```
What command runs linting and type checking?
Examples: 
- "ruff check . && mypy ."
- "npm run lint && npm run type-check"
```

**Question 5.4**: Environment variables
```
How do you manage environment variables?
- .env file with python-dotenv / dotenv
- Environment-specific files (.env.local, .env.prod)
- System environment variables only
```

**Question 5.5**: Virtual environment (Python only)
```
Do you use a virtual environment?
- venv (specify name if not 'venv')
- poetry
- conda
- uv
```

---

### Phase 6: The Feature (INITIAL.md Content)

This is the most important section. Be thorough.

**Question 6.1**: Feature description
```
Now let's define the feature you want to build.

Describe what you want to build in detail. Include:
- What it does
- Main components/tools/endpoints
- Inputs and outputs
- Any integrations needed

Take your time - the more detail, the better the results.
```

**Question 6.2**: Break down components
```
Let's break that down into specific components.

For each component, tell me:
1. Component name
2. What it does
3. Inputs/outputs

Example:
- "ResearchAgent" - searches the web for information, takes a query, returns summarized results
- "EmailDrafter" - creates email drafts, takes research results, returns formatted email
```

**Question 6.3**: External APIs/services
```
Does this feature need any external APIs or services?

For each one:
- Service name (e.g., "Brave Search API", "Gmail API", "Stripe")
- What you'll use it for
- Documentation URL (if you know it, otherwise I'll find it)
```

#### Web Research for APIs

If user doesn't know the documentation URL, search:
- "[API name] API documentation"
- "[API name] Python/TypeScript SDK guide"
- "[API name] getting started tutorial"

---

### Phase 7: Examples & Patterns

**Question 7.1**: Existing examples
```
Do you have existing code examples the AI should follow?
- Yes, I have files in an examples/ folder
- Yes, they're elsewhere in my codebase
- No, but I can describe patterns
- No examples yet
```

**Question 7.2**: Example details (if they have examples)
```
For each example file, tell me:
- File path
- What pattern it demonstrates

Example:
- "examples/async_client.py" - shows how to make async HTTP requests
- "src/agents/base_agent.py" - shows the agent structure pattern to follow
```

**Question 7.3**: External references
```
Are there any external code examples, repos, or tutorials the AI should reference?

Example:
- "https://github.com/example/repo - shows the auth pattern I want"
- "The Pydantic AI documentation examples"
```

---

### Phase 8: Documentation

**Question 8.1**: Documentation URLs
```
List all documentation URLs the AI will need to reference.

I'll help find them if you're not sure. Just tell me the libraries/APIs you're using.
```

#### Web Research for Documentation

For each library/API mentioned, search:
- "[library] official documentation"
- "[library] API reference"
- "[library] best practices guide"

Compile a list of specific, useful documentation URLs with section anchors where possible.

---

### Phase 9: Gotchas & Considerations

**Question 9.1**: AI mistakes
```
What mistakes do AI coding assistants commonly make with your tech stack?

Examples:
- "Forgets to close database connections"
- "Uses wrong import style"
- "Doesn't handle async properly"

If you're not sure, I can research common gotchas for your stack.
```

#### Web Research for Gotchas

Search for:
- "[framework] common mistakes"
- "[framework] gotchas and pitfalls"
- "[framework] best practices to avoid errors"
- "AI coding assistant mistakes with [framework]"

**Question 9.2**: Library quirks
```
Any specific library quirks or requirements I should document?

Examples:
- "Pydantic v2 requires model_validate() not parse_obj()"
- "FastAPI endpoints must be async"
- "This ORM doesn't support batch inserts over 1000 records"
```

**Question 9.3**: Security requirements
```
Any security requirements to enforce?
- Authentication type (JWT, OAuth, API keys)
- Input validation requirements
- Rate limiting
- Other security concerns
```

**Question 9.4**: Additional files needed
```
What additional files should be created alongside the feature?
- .env.example
- README with setup instructions
- Migration files
- Docker configuration
- Other: specify
```

---

### Phase 10: Success Criteria

**Question 10.1**: Definition of done
```
How will you know this feature is complete? List specific, measurable criteria.

Examples:
- "User can authenticate via GitHub OAuth"
- "API returns response in under 200ms"
- "All endpoints have input validation"
```

**Question 10.2**: Manual verification
```
What manual tests should pass to verify it works?

Example:
- "POST to /api/search returns relevant results"
- "Running the CLI with --help shows usage instructions"
```

---

## File Generation Phase

After collecting all information, generate the complete project structure.

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

---

## Example Conversation Flow

```
Claude: I'll help you set up a PRP project. What's the name of your project?

User: task-manager-api

Claude: Great! In one sentence, what does task-manager-api do?

User: A REST API for managing tasks with user authentication and team collaboration

Claude: Perfect. Is this a new project or are you adding PRP to existing code?

User: New project

Claude: What programming language will you use?

User: Python

Claude: For a REST API in Python, I'd recommend FastAPI - it's fast, has great 
type hints support, and automatic API documentation. Are you okay with FastAPI, 
or would you prefer Flask or Django?

User: FastAPI sounds good

Claude: What database will you use? For a task manager with teams, PostgreSQL 
would work well for relational data.

User: I'm not sure actually

Claude: Let me help. For a task management API with users and teams, you'll 
want a relational database for the relationships. Let me search for the best 
options...

[web_search: "best database for REST API Python 2024"]

Based on my research, I'd recommend PostgreSQL because:
- Great for relational data (users → teams → tasks)
- Excellent Python support via SQLAlchemy or SQLModel
- Free tier available on Supabase, Neon, or Railway

Would PostgreSQL work for you?

User: Yes, let's do PostgreSQL

Claude: Great choices so far! We have:
- Python + FastAPI + PostgreSQL

Let's talk about code standards. What's your maximum preferred file length?
...
```

This continues through all phases until files are generated.
