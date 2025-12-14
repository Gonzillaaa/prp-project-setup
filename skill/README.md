# PRP Project Setup Skill

An interactive Claude skill that guides users through setting up a complete PRP (Product Requirement Prompt) project structure with web research support.

## What This Skill Does

This skill walks users through a comprehensive questionnaire to gather all the information needed to set up a PRP project, then generates all necessary files:

- **CLAUDE.md** - Global rules for AI coding assistants
- **INITIAL.md** - Feature request template
- **.claude/commands/** - Slash commands for PRP workflow
- **PRPs/templates/** - PRP templates
- **examples/** - Code examples folder structure
- **PLANNING.md** - Project architecture template
- **TASK.md** - Task tracking template

## Key Features

### 🔍 Web Research Integration
When users don't know an answer, the skill uses web search to:
- Research framework comparisons and recommendations
- Find official documentation URLs
- Discover common gotchas and best practices
- Identify AI coding assistant mistakes for specific tech stacks

### 🎯 Adaptive Questioning
The questionnaire adapts based on previous answers:
- Skips frontend questions for backend-only projects
- Adds follow-up questions when needed
- Combines simple questions for efficiency

### 📁 Complete File Generation
Generates all files with content customized to the user's specific:
- Tech stack (Python/TypeScript, frameworks, databases)
- Code standards (linting, testing, organization)
- Development workflow (commands, environment setup)
- Feature requirements (components, APIs, documentation)

## Installation

### For Claude.ai Projects

1. Create a new Claude Project (or use existing)
2. Go to Project Knowledge → Add Content
3. Upload the `SKILL.md` file and the `references/` folder contents

### For Local Use

Place the skill in your Claude skills directory:
```
~/.claude/skills/prp-project-setup/
├── SKILL.md
└── references/
    ├── questionnaire-reference.md
    ├── file-templates.md
    └── web-research-patterns.md
```

## Usage

Simply ask Claude to help set up a PRP project:

```
"Help me set up a PRP project"
"I want to use the PRP framework for my new API"
"Create a context engineering project structure"
"Set up PRP for my existing Python project"
```

Claude will then guide you through the questionnaire conversationally.

## Questionnaire Sections

1. **Project Foundation** - Name, description, new vs existing
2. **Tech Stack** - Language, frameworks, database, AI libraries
3. **Code Standards** - File limits, organization, style
4. **Testing** - Framework, location, requirements
5. **Development Workflow** - Commands, environment, version control
6. **Feature Definition** - What you want to build
7. **Examples & Patterns** - Existing code to follow
8. **Documentation** - URLs and references needed
9. **Gotchas** - Common mistakes and quirks
10. **Success Criteria** - Definition of done

## Example Conversation

```
User: Help me set up a PRP project

Claude: I'll help you set up a complete PRP project structure. 
What is the name of your project?

User: task-manager-api

Claude: Great! In one sentence, what does task-manager-api do?

User: A REST API for managing tasks with user authentication

Claude: Is this a new project or adding PRP to existing code?

User: New project

Claude: What programming language will you use?

User: Python

Claude: For a REST API in Python, I'd recommend FastAPI. 
Would you like to use FastAPI, or do you prefer Flask or Django?

User: I'm not sure, what's best?

Claude: Let me research that for you...
[performs web search]

Based on my research, for a task management API, I'd recommend FastAPI:
- Fast performance and async support
- Automatic API documentation
- Built-in validation with Pydantic
- Great for modern REST APIs

Would you like to go with FastAPI?

User: Yes, sounds good

Claude: What database will you use?
...
```

## Generated Files Example

After completing the questionnaire, you get:

```
task-manager-api/
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
├── CLAUDE.md          # Customized with your tech stack
├── INITIAL.md         # Customized with your feature
├── PLANNING.md
└── TASK.md
```

## Reference Files

- **questionnaire-reference.md** - Quick lookup for all questions
- **file-templates.md** - Templates for generated files
- **web-research-patterns.md** - When and how to research

## Tips for Best Results

1. **Be specific** about your feature description
2. **Say "I don't know"** when uncertain - Claude will research for you
3. **Provide examples** if you have existing code patterns to follow
4. **List all APIs** you'll integrate with
5. **Mention gotchas** you've encountered with your tech stack

## Credits

Based on the PRP (Product Requirement Prompt) framework by Raasmus, as featured in the Context Engineering methodology.
