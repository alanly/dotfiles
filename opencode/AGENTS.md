# Agent Guidelines

## Memory Usage (CRITICAL)
**One line, detailed** - Keep each memory on a single line to avoid git conflicts. Be detailed but concise. Include file references where applicable (e.g., "See: path/to/file.py").
- `memory_recall()` at session START and before answering any questions
- **NEVER** use `memory_remember()` automatically - only when user explicitly asks to remember something
- If user asks to remember: store as patterns, decisions, learnings, preferences, blockers, or context
- If new info contradicts existing memory: ask user before using `memory_forget()` + `memory_remember()`
- **End of session**: If significant patterns, decisions, or learnings were discovered, ask user: "Would you like me to remember [specific thing]?"
**Use memory_recall freely. NEVER memory_remember automatically.**

### Memory Types
| Type | Use For | Example |
|------|---------|---------|
| decision | Architecture/design choices | "Using Drizzle ORM over Prisma for type safety. See: src/db/schema.ts" |
| learning | Codebase discoveries | "Auth tokens stored in httpOnly cookies, not localStorage. See: src/auth/session.ts" |
| preference | User/project preferences | "User prefers functional components over class components" |
| blocker | Known issues | "Websocket reconnection fails on Safari - tracking in issue #42" |
| context | Feature/system info | "Payment integration uses Stripe in test mode. API keys in .env.local" |
| pattern | Code patterns | "All API routes follow /api/v1/[resource]/[action] pattern. See: src/routes/" |

### Memory Scopes
Use scopes to organize memories logically:
| Scope | Use For |
|-------|---------|
| `project` | Project-wide decisions and patterns |
| `user` | User-specific preferences |
| `auth` | Authentication/authorization context |
| `api` | API design decisions |
| `database` | Database schema and query patterns |
| `testing` | Testing strategies and known issues |
| `deployment` | Deployment and infrastructure notes |
