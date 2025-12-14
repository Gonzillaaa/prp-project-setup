# Web Research Patterns

Reference for when and how to use web_search during the questionnaire.

---

## Research Trigger Phrases

When user says any of these, initiate web research:

### Direct Uncertainty
- "I don't know"
- "I'm not sure"
- "What do you recommend?"
- "Help me choose"
- "What's best for..."
- "I haven't decided yet"
- "What should I use?"

### Implicit Uncertainty
- "Maybe [option]?"
- "I think [option]..."
- "Probably [option]"
- "I've heard of [option]"
- "People use [option] right?"

---

## Research Query Templates

### Framework Selection

**Python Web Framework:**
```
Query: "best Python web framework FastAPI Flask Django comparison"
Follow-up: "[framework] getting started production ready"
```

**TypeScript Backend:**
```
Query: "best TypeScript backend framework Express NestJS Hono"
Follow-up: "[framework] production setup best practices"
```

**Database Selection:**
```
Query: "best database for [use case] [language]"
Follow-up: "[database] with [framework] integration guide"
```

**AI/ML Framework:**
```
Query: "best AI agent framework Python LangChain Pydantic AI"
Follow-up: "[framework] vs [framework] comparison production"
```

### Testing Framework

**Python:**
```
Query: "best Python testing framework pytest unittest comparison"
Expected answer: pytest (99% of cases)
```

**TypeScript:**
```
Query: "best TypeScript testing framework Jest Vitest"
Follow-up: "[framework] with [runtime] setup"
```

### Linting & Formatting

**Python:**
```
Query: "best Python linter ruff black flake8"
Expected answer: ruff (fast, comprehensive)
```

**TypeScript:**
```
Query: "ESLint vs Biome TypeScript"
Follow-up: "Prettier ESLint configuration [framework]"
```

### Documentation URLs

**Find Official Docs:**
```
Query: "[library] official documentation"
Verify: URL ends in official domain (e.g., fastapi.tiangolo.com)
```

**Find Specific Sections:**
```
Query: "[library] [feature] documentation guide"
Example: "FastAPI dependency injection documentation"
```

**Find API Reference:**
```
Query: "[library] API reference [specific class/function]"
```

### Gotchas & Best Practices

**Common Mistakes:**
```
Query: "[framework] common mistakes pitfalls avoid"
Query: "[framework] gotchas developers"
```

**Best Practices:**
```
Query: "[framework] best practices production"
Query: "[framework] project structure recommended"
```

**AI-Specific Issues:**
```
Query: "AI coding assistant mistakes [framework]"
Query: "Claude/Copilot errors [framework] common"
```

---

## Research Response Format

When presenting research results to user:

### For Framework Recommendations

```markdown
Based on my research, here are the top options for [use case]:

**Option 1: [Framework]** ⭐ Recommended
- Pros: [bullet points]
- Cons: [bullet points]
- Best for: [use case]

**Option 2: [Framework]**
- Pros: [bullet points]
- Cons: [bullet points]
- Best for: [use case]

**My recommendation**: [Framework] because [reason based on their project].

Would you like to go with [Framework]?
```

### For Documentation Links

```markdown
I found the following documentation you'll need:

1. **[Library] Official Docs**: [URL]
   - Key section: [specific page/anchor]
   
2. **[Library] API Reference**: [URL]
   - You'll need this for: [specific feature]

3. **[Tutorial/Guide]**: [URL]
   - Covers: [what it explains]

I'll include all of these in your INITIAL.md file.
```

### For Gotchas

```markdown
Here are important gotchas I found for [framework]:

⚠️ **[Gotcha 1]**
- What happens: [description]
- How to avoid: [solution]

⚠️ **[Gotcha 2]**
- What happens: [description]  
- How to avoid: [solution]

I'll add these to your CLAUDE.md to prevent AI mistakes.
```

---

## Stack-Specific Research

### Python + FastAPI
```yaml
always_research:
  - "FastAPI async database best practices"
  - "FastAPI dependency injection patterns"
  - "Pydantic v2 validation patterns"

common_gotchas:
  - "FastAPI async vs sync endpoints performance"
  - "SQLAlchemy async session management"
  - "Pydantic v1 vs v2 migration"
```

### Python + Pydantic AI
```yaml
always_research:
  - "Pydantic AI agent patterns"
  - "Pydantic AI tools integration"
  - "Pydantic AI testing TestModel"

common_gotchas:
  - "Pydantic AI context management"
  - "Pydantic AI model provider configuration"
  - "Pydantic AI async patterns"
```

### TypeScript + Next.js
```yaml
always_research:
  - "Next.js App Router best practices"
  - "Next.js server components patterns"
  - "Next.js data fetching strategies"

common_gotchas:
  - "Next.js use client vs server components"
  - "Next.js caching behavior"
  - "Next.js hydration errors"
```

### TypeScript + Cloudflare Workers
```yaml
always_research:
  - "Cloudflare Workers best practices"
  - "Cloudflare Durable Objects patterns"
  - "Cloudflare Workers D1 database"

common_gotchas:
  - "Cloudflare Workers CPU time limits"
  - "Cloudflare Workers cold starts"
  - "Cloudflare Workers memory limits"
```

---

## Verification Checklist

Before adding researched information to generated files:

### Documentation URLs
- [ ] URL is accessible (not 404)
- [ ] URL is official source (not random blog)
- [ ] URL points to specific section (not just homepage)
- [ ] URL is current (not deprecated version)

### Framework Recommendations
- [ ] Recommendation matches user's use case
- [ ] Recommendation is actively maintained
- [ ] Recommendation has good community/docs
- [ ] Recommendation works with their other choices

### Gotchas
- [ ] Gotcha is still relevant (not fixed in latest version)
- [ ] Gotcha has actionable solution
- [ ] Gotcha is specific (not generic advice)
- [ ] Gotcha applies to their specific setup

---

## Example Research Flow

**User says**: "I'm not sure what database to use"

**Step 1**: Ask clarifying question
```
What kind of data will you be storing? 
- Relational data with relationships (users, orders, products)
- Document/JSON data
- Time-series data
- Key-value pairs
- Something else
```

**Step 2**: Based on answer, research
```
User: "Relational - users, teams, and tasks"

Search: "best relational database Python FastAPI"
Search: "PostgreSQL vs MySQL Python async"
```

**Step 3**: Present findings
```
For relational data with users/teams/tasks, I'd recommend PostgreSQL:

**Why PostgreSQL:**
- Excellent async support with asyncpg
- Great Python ecosystem (SQLAlchemy, SQLModel)  
- Free managed options (Supabase, Neon, Railway)
- Strong for complex relationships and queries

**Alternatives:**
- MySQL: Also good, slightly less Python tooling
- SQLite: Great for development, limited for production

Would PostgreSQL work for you?
```

**Step 4**: Research integration
```
Search: "FastAPI PostgreSQL SQLAlchemy async setup"
Search: "PostgreSQL FastAPI connection pooling"
```

**Step 5**: Add to generated files
- CLAUDE.md: Add database commands and gotchas
- INITIAL.md: Add documentation URLs
- prp_base.md: Add validation commands
