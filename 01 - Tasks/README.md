# Tasks

Individual task management and tracking. Each task gets its own note with structured information, status tracking, and relationships to projects and other work items.

## Structure

Each task note should include:
- **Clear description** of what needs to be done
- **Acceptance criteria** for completion
- **Status tracking** (Not Started, In Progress, Done, etc.)
- **Priority level** and due dates
- **Links** to related projects, meetings, or documentation
- **Progress updates** and blockers

## Template Usage

Use the task template (`_templates/task-template.md`) to create consistent task notes. The template includes all standard fields and metadata needed for effective task management.

## Organization

Tasks can be organized by:
- **Project association** - Link tasks to their parent projects
- **Priority levels** - Use constants from `_constants/priority.md`
- **Status tracking** - Follow status definitions in `_constants/status.md`
- **Tags** - Use tags for quick filtering and searching

## Examples

Example task files (not included in this template):
- `JIRA-12345 - Fix payment gateway bug.md`
- `Update user documentation.md`
- `Review security compliance checklist.md`