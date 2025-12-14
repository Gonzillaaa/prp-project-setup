# 🚀 PRP Project Setup Skill

An interactive Claude skill that guides users through setting up complete **PRP (Product Requirement Prompt)** projects with AI-assisted research and file generation.

> **Context Engineering is 10x better than prompt engineering and 100x better than vibe coding.**

[![Claude Skill](https://img.shields.io/badge/Claude-Skill-blueviolet?style=flat-square&logo=anthropic)](https://claude.ai)
[![PRP Framework](https://img.shields.io/badge/PRP-Framework-orange?style=flat-square)](https://github.com/Wirasm/PRPs-agentic-eng)
[![Context Engineering](https://img.shields.io/badge/Context-Engineering-green?style=flat-square)](https://github.com/coleam00/Context-Engineering-Intro)

---

## 🎯 What This Skill Does

This skill walks users through an **interactive questionnaire** to set up a complete PRP project structure, then **generates all necessary files** automatically.

### The Problem It Solves

Setting up context engineering for AI-assisted development requires creating multiple interconnected files:

- `CLAUDE.md` — Global rules for the AI assistant
- `INITIAL.md` — Feature request template
- Slash commands — `/generate-prp` and `/execute-prp`
- PRP templates — Base templates for generating PRPs
- Supporting files — Examples, planning docs, task tracking

**This skill automates the entire setup process** by asking the right questions and generating customized files based on your specific tech stack and project needs.

### Key Features

| Feature                           | Description                                                                       |
| --------------------------------- | --------------------------------------------------------------------------------- |
| 🎤 **Interactive Questionnaire**  | Conversational flow through 10 phases covering project basics to success criteria |
| 🔄 **Two Modes**                  | Full setup for new projects OR lightweight flow for adding features               |
| 🔍 **Web Research Integration**   | When you don't know an answer, Claude researches best practices for your stack    |
| 📁 **Complete File Generation**   | Generates all PRP files customized to your tech stack                             |
| 🎯 **Smart Template Suggestions** | Recommends specialized templates (MCP Server, Pydantic AI) when applicable        |
| 📚 **Repository Integration**     | Fetches real examples from official PRP repositories                              |

---

## 🔄 Two Modes

### Mode 1: Project Setup

For new projects or adding PRP to existing codebases.

**Triggers:** "Set up a PRP project", "Create context engineering structure"

**Process:** Full 10-phase questionnaire → Generates all files (CLAUDE.md, INITIAL.md, commands, templates)

### Mode 2: Add New Feature

For projects that already have PRP set up.

**Triggers:** "Add a new feature", "Create an INITIAL.md for [feature]"

**Process:** 6-question lightweight flow → Generates new INITIAL.md

```
Mode 1 (Setup)                    Mode 2 (Add Feature)
─────────────────                 ────────────────────
10 phases                         6 questions
~30 questions                     ~5 minutes
Generates all files               Generates INITIAL.md only
One-time per project              Repeat for each feature
```

---

## 📦 What's Included

```
prp-project-setup-skill/
├── SKILL.md                              # Main skill definition
├── README.md                             # This file
└── references/
    ├── questionnaire-reference.md        # Quick lookup for all questions
    ├── file-templates.md                 # Templates for generated files
    ├── mode-2-add-feature.md             # Add Feature flow (Mode 2)
    ├── repository-resources.md           # Guide to official PRP repositories
    └── web-research-patterns.md          # When and how to use web search
```

### Skill Files

| File                         | Purpose                                                                                                   |
| ---------------------------- | --------------------------------------------------------------------------------------------------------- |
| `SKILL.md`                   | Core skill definition with questionnaire flow, template selection logic, and file generation instructions |
| `questionnaire-reference.md` | Quick reference mapping questions to generated file sections                                              |
| `file-templates.md`          | Mustache-style templates for CLAUDE.md, INITIAL.md, and all generated files                               |
| `mode-2-add-feature.md`      | Lightweight 6-question flow for adding features to existing PRP projects                                  |
| `repository-resources.md`    | Detailed guide to fetching examples from official PRP repositories                                        |
| `web-research-patterns.md`   | Patterns for when and how to search for framework recommendations                                         |

---

## 🚀 Installation

### For Claude.ai Projects

1. Create a new Claude Project (or open an existing one)
2. Go to **Project Knowledge** → **Add Content**
3. Upload `SKILL.md` and all files from the `references/` folder
4. Start a conversation with: _"Help me set up a PRP project"_

### For Claude Code CLI

1. Create the skills directory:

   ```bash
   mkdir -p ~/.claude/skills/prp-project-setup/references
   ```

2. Copy files:

   ```bash
   cp SKILL.md ~/.claude/skills/prp-project-setup/
   cp references/* ~/.claude/skills/prp-project-setup/references/
   ```

3. The skill will now appear when you run Claude Code

### For Claude Desktop / API

Add the skill files to your Claude configuration or include them in your system prompt.

---

## 💬 Usage

### Mode 1: Setting Up a New Project

```
"Help me set up a PRP project"
"I want to use context engineering for my new API"
"Create a PRP project structure for me"
"Set up PRP for my existing Python project"
```

### Mode 2: Adding Features to Existing Projects

```
"I want to add a new feature"
"Help me create an INITIAL.md for notifications"
"I need to build a payment system"
"Create a feature request for user authentication"
```

Claude will detect which mode you need, or ask if unclear.

### Example: Setting Up (Mode 1)

```
User: Help me set up a PRP project

Claude: I'll help you set up a complete PRP project structure.
        What is the name of your project?

User: invoice-processor

Claude: Great! In one sentence, what does invoice-processor do?
...
```

### Example: Adding a Feature (Mode 2)

```
User: I want to add a new feature to my project

Claude: I'll help you create an INITIAL.md for your new feature.
        What feature do you want to build?

User: A notification system that emails users when invoices are overdue

Claude: Let's break that into components. What are the main pieces?

User: A NotificationService that sends emails, and a scheduler that
      checks for overdue invoices daily

Claude: Does this need any external APIs or libraries?

User: SendGrid for emails

Claude: I'll find the SendGrid documentation for you...
        [researches and continues with remaining questions]

Claude: ✅ Feature request saved to INITIAL.md

        Next steps:
        1. Run: /generate-prp INITIAL.md
        2. Review the generated PRP
        3. Run: /execute-prp PRPs/notification-system.md
```

---

## 📋 Questionnaire Phases

The skill guides users through **10 phases**:

| Phase                   | What It Covers                               | Generated Output            |
| ----------------------- | -------------------------------------------- | --------------------------- |
| 1. Project Foundation   | Name, description, new vs existing           | Folder structure            |
| 2. Tech Stack           | Language, frameworks, database, AI libraries | CLAUDE.md tech section      |
| 3. Code Standards       | File limits, organization, linting           | CLAUDE.md code rules        |
| 4. Testing              | Framework, location, requirements            | CLAUDE.md testing section   |
| 5. Development Workflow | Commands, environment, venv                  | CLAUDE.md commands          |
| 6. Feature Definition   | What to build, components, APIs              | INITIAL.md feature section  |
| 7. Examples & Patterns  | Existing code to follow                      | INITIAL.md examples         |
| 8. Documentation        | URLs and references                          | INITIAL.md documentation    |
| 9. Gotchas              | Common mistakes, library quirks              | CLAUDE.md + INITIAL.md      |
| 10. Success Criteria    | Definition of done                           | INITIAL.md success criteria |

---

## 📁 Generated Files

After completing the questionnaire, the skill generates:

```
your-project/
├── .claude/
│   └── commands/
│       ├── generate-prp.md      # Command to generate PRPs
│       └── execute-prp.md       # Command to execute PRPs
├── PRPs/
│   ├── templates/
│   │   └── prp_base.md          # Base PRP template
│   └── ai_docs/                 # Custom documentation (optional)
├── examples/
│   └── README.md                # Examples folder setup
├── CLAUDE.md                    # Customized global rules
├── INITIAL.md                   # Your feature request
├── PLANNING.md                  # Project architecture template
└── TASK.md                      # Task tracking template
```

All files are **customized** based on your questionnaire answers — commands use your specific linting tools, templates reference your framework, etc.

---

## 🎓 What is PRP?

**PRP (Product Requirement Prompt)** is a framework for context engineering — providing AI coding assistants with everything they need to implement features correctly on the first pass.

### The Formula

```
PRP = PRD + Curated Codebase Intelligence + Agent Runbook
```

- **PRD**: What you want to build (goals, requirements, success criteria)
- **Codebase Intelligence**: Existing patterns, documentation, examples to follow
- **Agent Runbook**: Step-by-step implementation tasks with validation loops

### Why It Works

| Approach                | Result                                                    |
| ----------------------- | --------------------------------------------------------- |
| Vibe Coding             | Prototypes that break when you scale                      |
| Prompt Engineering      | Better single outputs, but no system                      |
| **Context Engineering** | Comprehensive context = consistent, production-ready code |

> _"Most agent failures aren't model failures—they're context failures."_

---

## 🙏 Inspiration & Credits

This skill was built on the shoulders of giants:

### Raasmus — PRP Framework Creator

- Original PRP (Product Requirement Prompt) methodology
- Repository: [Wirasm/PRPs-agentic-eng](https://github.com/Wirasm/PRPs-agentic-eng)
- Developed over 1+ year of production use
- Inspired by product management and PRD writing

### Cole Medin — Context Engineering 

- Context Engineering template and use cases
- Repository: [coleam00/Context-Engineering-Intro](https://github.com/coleam00/Context-Engineering-Intro)
- MCP Server and Pydantic AI specialized templates
- YouTube tutorials on context engineering

### Video Resources

These videos explain the PRP framework and context engineering in depth:

- **[Context Engineering 101 - The Simple Strategy to 100x AI Coding](https://www.youtube.com/watch?v=Mk87sFlUG28)** — Deep dive into PRP with Raasmus
- **Context Engineering is the New Vibe Coding (Learn this Now)** — Introduction to context engineering

### The Core Insight

From the Context Engineering 101 video:

> _"A PRP is a PRD plus curated codebase intelligence plus agent runbook—the minimum viable packet an AI needs to plausibly ship production-ready code on the first pass."_
> — Raasmus

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Add new tech stack presets** — Common configurations for frameworks
2. **Improve questionnaire flow** — Better questions, smarter skip logic
3. **Expand web research patterns** — More gotchas, better documentation sources
4. **Add new file templates** — Support for more project types

### To Contribute

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📄 License

MIT License — See [LICENSE](LICENSE) for details.

---

## 🔮 Future Plans

- [ ] **Interactive web version** — HTML form that generates files
- [ ] **VS Code extension** — Run the questionnaire in your editor
- [ ] **More specialized templates** — Supabase, CrewAI, LangChain, etc.
- [ ] **Team configuration** — Shared CLAUDE.md standards across organizations

---

<div align="center">

**Built with ❤️ for the AI-assisted development community**

[Report Bug](../../issues) · [Request Feature](../../issues) · [Discussions](../../discussions)

</div>
