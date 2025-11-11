# Meetings

Meeting notes, agendas, and follow-up actions. Each meeting gets structured documentation for effective communication and action tracking.

## Structure

Each meeting note should include:
- **Meeting metadata** in frontmatter with tags
- **Meeting details** (date, time, mode, participants)
- **Project association** for context and linking
- **Agenda items** and planned discussion points
- **Notes section** for detailed discussion capture
- **Decisions section** for key outcomes and choices made
- **Action items** with clear ownership and next steps

## Template Usage

Use the meeting template (`_templates/meeting-template.md`) to create consistent meeting documentation. The template includes:

**Standard Structure:**
- Frontmatter with meeting tags
- Meeting header with title
- Metadata fields (Date, Time, Mode, Participants, Project)
- Four main sections: Agenda, Notes, Decisions, Action Items

**Key Features:**
- **Templater integration** for automatic file naming and placement
- **Participant linking** to connect with contact notes
- **Project linking** for context and relationship tracking
- **Consistent formatting** across all meeting types

## Organization

Meetings can be organized by:
- **Meeting type** - Sprint Planning, Standup, Review, Retrospective, etc.
- **Project association** - Link to related projects using the Project field
- **Team or participants** - Different teams or working groups
- **Frequency** - Daily standups, weekly reviews, monthly planning
- **Mode** - Remote, In Person, or Hybrid meetings

## Naming Convention

The template automatically handles naming with format: `YYYY-MM-DD - Meeting Title.md`
Examples:
- `2025-01-15 - Sprint Planning.md`
- `2025-01-10 - Architecture Review.md` 
- `2025-01-08 - Team Retrospective.md`

## Integration

Meeting notes automatically integrate with:
- **Projects** through the Project field in metadata
- **Contacts** through participant linking using [[Contact Name]] format
- **Tasks** that are created or discussed in action items
- **Related meetings** through project and participant connections

## Template Sections

**🗒️ Agenda**: Planned discussion points and time allocation
**🧠 Notes**: Detailed capture of discussions, decisions, and insights
**📌 Decisions**: Key outcomes, choices made, and direction set
**✅ Action Items**: Clear next steps with ownership and timing

## Examples

The example meeting file demonstrates:
- **Sprint planning structure** with agenda and backlog discussion
- **Participant linking** to contact files
- **Project association** for context
- **Clear decision capture** with rationale
- **Actionable items** with ownership and timing
- **Risk and dependency tracking** for project management