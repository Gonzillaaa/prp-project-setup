# Mode 1: Project Setup Questionnaire

This is the **full 10-phase questionnaire** for users setting up a new PRP project from scratch.

**When to use:** User needs complete PRP setup (no existing CLAUDE.md or PRP structure)

**Triggers:**
- "Help me set up a PRP project"
- "Create a new project with context engineering"
- "Set up PRP for my codebase"
- User has no existing CLAUDE.md or PRP structure

**What it does:** Full 10-phase questionnaire → Generates all project files

After completing this questionnaire, proceed to the **File Generation Phase** in SKILL.md.

---

## Phase 1: Introduction & Project Type (1/10)

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

## Phase 2: Tech Stack Discovery (2/10)

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
- Supabase
- None / Not sure yet
```

**Question 2.4**: AI/ML frameworks (if relevant)
```
Are you building anything with AI/ML? If so, what libraries?
- Pydantic AI
- LangChain
- OpenAI SDK
- Anthropic SDK
- CrewAI
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
- Cloudflare Workers
- Vercel
- AWS Lambda
- Railway
- Local only (for now)
- Not sure yet
```

### Web Research Triggers for Phase 2

If user says "I don't know" or "help me choose", use web_search:

- "best Python web framework 2024 comparison"
- "FastAPI vs Flask vs Django which to choose"
- "best database for [their use case]"
- "recommended AI agent framework Python 2024"

Summarize findings and make a recommendation based on their project description.

---

## Phase 3: Code Standards (3/10)

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

## Phase 4: Testing Requirements (4/10)

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

## Phase 5: Development Workflow (5/10)

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

## Phase 6: The Feature (6/10)

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

### Web Research for APIs

If user doesn't know the documentation URL, search:
- "[API name] API documentation"
- "[API name] Python/TypeScript SDK guide"
- "[API name] getting started tutorial"

---

## Phase 7: Examples & Patterns (7/10)

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

## Phase 8: Documentation (8/10)

**Question 8.1**: Documentation URLs
```
List all documentation URLs the AI will need to reference.

I'll help find them if you're not sure. Just tell me the libraries/APIs you're using.
```

### Web Research for Documentation

For each library/API mentioned, search:
- "[library] official documentation"
- "[library] API reference"
- "[library] best practices guide"

Compile a list of specific, useful documentation URLs with section anchors where possible.

---

## Phase 9: Gotchas & Considerations (9/10)

**Question 9.1**: AI mistakes
```
What mistakes do AI coding assistants commonly make with your tech stack?

Examples:
- "Forgets to close database connections"
- "Uses wrong import style"
- "Doesn't handle async properly"

If you're not sure, I can research common gotchas for your stack.
```

### Web Research for Gotchas

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

## Phase 10: Success Criteria (10/10)

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
