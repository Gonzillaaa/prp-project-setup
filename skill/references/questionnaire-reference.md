# PRP Questionnaire Quick Reference

Quick lookup for all questions and their mapping to generated files.

## Question Summary by Phase

### Phase 1: Project Foundation
| # | Question | Maps To |
|---|----------|---------|
| 1.1 | Project name | Folder name, CLAUDE.md header |
| 1.2 | One-sentence description | CLAUDE.md overview |
| 1.3 | New or existing project | Setup approach |

### Phase 2: Tech Stack
| # | Question | Maps To |
|---|----------|---------|
| 2.1 | Primary language | CLAUDE.md tech stack, file extensions |
| 2.2 | Framework(s) | CLAUDE.md, validation commands |
| 2.3 | Database | CLAUDE.md, gotchas |
| 2.4 | AI/ML libraries | INITIAL.md documentation |
| 2.5 | Package manager | CLAUDE.md commands |
| 2.6 | Deployment target | CLAUDE.md, optional configs |

### Phase 3: Code Standards
| # | Question | Maps To |
|---|----------|---------|
| 3.1 | Max file length | CLAUDE.md code structure |
| 3.2 | Code organization | CLAUDE.md modularity rules |
| 3.3 | Linter/formatter | CLAUDE.md style, validation loop |
| 3.4 | Type checking | CLAUDE.md requirements |
| 3.5 | Docstring style | CLAUDE.md documentation rules |

### Phase 4: Testing
| # | Question | Maps To |
|---|----------|---------|
| 4.1 | Test framework | CLAUDE.md, validation commands |
| 4.2 | Test location | CLAUDE.md structure |
| 4.3 | Test types required | CLAUDE.md testing rules |
| 4.4 | Min test cases | CLAUDE.md testing rules |

### Phase 5: Development Workflow
| # | Question | Maps To |
|---|----------|---------|
| 5.1 | Dev server command | CLAUDE.md commands |
| 5.2 | Test command | CLAUDE.md, prp_base.md validation |
| 5.3 | Lint command | CLAUDE.md, prp_base.md validation |
| 5.4 | Env var management | CLAUDE.md, INITIAL.md considerations |
| 5.5 | Virtual environment | CLAUDE.md commands |

### Phase 6: Feature Definition
| # | Question | Maps To |
|---|----------|---------|
| 6.1 | Feature description | INITIAL.md FEATURE section |
| 6.2 | Component breakdown | INITIAL.md FEATURE details |
| 6.3 | External APIs | INITIAL.md DOCUMENTATION |

### Phase 7: Examples
| # | Question | Maps To |
|---|----------|---------|
| 7.1 | Has existing examples | INITIAL.md EXAMPLES |
| 7.2 | Example file details | INITIAL.md EXAMPLES |
| 7.3 | External references | INITIAL.md EXAMPLES/DOCUMENTATION |

### Phase 8: Documentation
| # | Question | Maps To |
|---|----------|---------|
| 8.1 | Documentation URLs | INITIAL.md DOCUMENTATION |

### Phase 9: Gotchas
| # | Question | Maps To |
|---|----------|---------|
| 9.1 | Common AI mistakes | CLAUDE.md gotchas, INITIAL.md |
| 9.2 | Library quirks | CLAUDE.md gotchas |
| 9.3 | Security requirements | INITIAL.md considerations |
| 9.4 | Additional files | INITIAL.md considerations |

### Phase 10: Success Criteria
| # | Question | Maps To |
|---|----------|---------|
| 10.1 | Definition of done | INITIAL.md success criteria |
| 10.2 | Manual tests | INITIAL.md considerations |

---

## Web Search Triggers

### When User Says "I Don't Know"

**Tech Stack Questions:**
```
"best [language] web framework 2024"
"[framework A] vs [framework B] comparison"
"best database for [use case]"
"recommended testing framework [language]"
```

**Documentation:**
```
"[library] official documentation"
"[library] API reference guide"
"[library] getting started tutorial"
```

**Gotchas:**
```
"[framework] common mistakes pitfalls"
"[framework] best practices"
"AI coding assistant mistakes [framework]"
"[library] gotchas"
```

**Recommendations:**
```
"best practices [use case] [language]"
"production ready [framework] setup"
"[framework] project structure recommended"
```

---

## Adaptive Question Logic

### Skip Conditions

| If User Says | Skip These Questions |
|--------------|---------------------|
| "No frontend" | All frontend framework questions |
| "CLI application" | Web framework, deployment |
| "No database" | Database, ORM questions |
| "Not using AI/ML" | AI framework questions |
| "TypeScript" | Python-specific (venv, docstrings) |
| "Python" | TypeScript-specific questions |

### Add Follow-up When

| User Answer | Add Question |
|-------------|--------------|
| "FastAPI" | "Using SQLAlchemy or SQLModel?" |
| "PostgreSQL" | "Using an ORM? Which one?" |
| "Pydantic AI" | "Which LLM provider (OpenAI, Anthropic)?" |
| "Docker" | "Need docker-compose setup?" |
| "Multiple frameworks" | "Which is primary vs secondary?" |

---

## File Generation Checklist

### Before Generating
- [ ] All required phases completed
- [ ] Tech stack is consistent (no conflicting choices)
- [ ] At least one feature component defined
- [ ] Development commands make sense for the stack
- [ ] User confirmed summary is accurate

### Generated Files Quality Check
- [ ] CLAUDE.md commands are executable
- [ ] INITIAL.md URLs are valid (if researched)
- [ ] prp_base.md validation commands match their stack
- [ ] Folder structure matches their organization preference
- [ ] All gotchas are specific, not generic

---

## Common Tech Stack Presets

### Python REST API
```yaml
language: Python
framework: FastAPI
database: PostgreSQL
orm: SQLAlchemy or SQLModel
testing: pytest
linting: ruff
types: mypy
package_manager: uv or pip
```

### Python AI Agent
```yaml
language: Python
framework: Pydantic AI
ai_provider: OpenAI or Anthropic
testing: pytest
linting: ruff
types: mypy
package_manager: uv
```

### TypeScript API
```yaml
language: TypeScript
framework: Express or Hono
database: PostgreSQL
orm: Prisma or Drizzle
testing: Vitest or Jest
linting: ESLint + Prettier
package_manager: npm or pnpm
```

### MCP Server
```yaml
language: TypeScript
framework: Cloudflare Workers
runtime: @modelcontextprotocol/sdk
auth: GitHub OAuth
testing: Vitest
linting: ESLint + Prettier
package_manager: npm
```

### Next.js Full Stack
```yaml
language: TypeScript
framework: Next.js (App Router)
database: PostgreSQL or Supabase
orm: Prisma
testing: Vitest + Playwright
linting: ESLint + Prettier
package_manager: npm or pnpm
```
