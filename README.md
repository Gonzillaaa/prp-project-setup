📁 Skill Structure
prp-project-setup-skill/
├── SKILL.md                              # Main skill definition
├── README.md                             # Usage instructions
└── references/
    ├── questionnaire-reference.md        # Quick lookup for questions
    ├── file-templates.md                 # Templates for generated files
    └── web-research-patterns.md          # When/how to web search

How It Works
The Questionnaire Flow
The skill walks users through 10 phases:

Project Foundation — Name, description, new vs existing
Tech Stack — Language, frameworks, database, AI libraries
Code Standards — File limits, organization, style
Testing — Framework, location, requirements
Development Workflow — Commands, environment setup
Feature Definition — What they want to build (this becomes INITIAL.md)
Examples & Patterns — Existing code to follow
Documentation — URLs and references needed
Gotchas — Common mistakes and quirks
Success Criteria — Definition of done

Web Research Integration
When a user says "I don't know" or "help me choose", Claude will:

Search for framework comparisons
Find official documentation URLs
Discover common gotchas
Make recommendations based on their use case

What Gets Generated
After completing the questionnaire, the skill generates:

CLAUDE.md — Customized with their tech stack and rules
INITIAL.md — Their feature request, fully documented
Slash commands — generate-prp.md and execute-prp.md
PRP template — prp_base.md customized for their stack
Supporting files — PLANNING.md, TASK.md, examples/README.md


How to Use It
Option 1: Claude.ai Project

Create a Claude Project
Add the skill files to Project Knowledge
Start a conversation: "Help me set up a PRP project"

Option 2: Add to Your Existing Project
Upload these files as Project Knowledge in your existing context engineering project.

Example Conversation
User: Help me set up a PRP project

Claude: I'll help you set up a complete PRP project. What's the name?

User: invoice-processor

Claude: What does invoice-processor do?

User: Processes PDF invoices and extracts data using AI

Claude: Is this new or existing code?

User: New project

Claude: What language?

User: Python

Claude: For AI document processing, I'd recommend:
- FastAPI for the API layer
- Pydantic AI for the extraction logic

What database will you use?

User: I don't know

Claude: [searches web] For invoice data, I'd recommend PostgreSQL...
