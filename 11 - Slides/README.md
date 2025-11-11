# Slides

Presentation materials created using the **obsidian-advanced-slides** plugin. Create beautiful presentations directly in Obsidian using Markdown syntax and present them in your browser.

## Purpose

This folder contains Markdown files that become interactive presentations:
- **Meeting presentations** and slide decks in Markdown format
- **Training materials** and educational content as slides
- **Project presentations** and status updates with live links
- **Conference talks** and speaking materials with embedded media
- **Demo scripts** and product showcases with interactive elements
- **Template presentations** for reuse and consistency

## Advanced Slides Features

**Markdown-Based Presentations**:
- Create slides using simple Markdown syntax
- Automatic slide breaks using `---` separator
- Support for fragments, animations, and transitions
- Live editing and preview in Obsidian

**Interactive Elements**:
- **Embedded links** to other vault notes and projects
- **Live code blocks** with syntax highlighting
- **Interactive charts** and diagrams (Mermaid, etc.)
- **Image galleries** and media embedding
- **Speaker notes** and presenter mode

**Advanced Formatting**:
- **Themes and styling** with CSS customization
- **Layouts and grids** for complex slide arrangements
- **Animations and transitions** between slides and elements
- **Export options** to HTML, PDF, or sharing links

## Slide Structure

Each presentation file should follow this Markdown structure:

```markdown
---
theme: white
transition: slide
---

# Presentation Title
## Subtitle or Date

---

## Slide 2 Title

- Bullet point 1
- Bullet point 2
- Link to [[Project Name]]

---

## Slide 3 with Code

```python
def hello_world():
    print("Hello from Obsidian!")
```

---

## Speaker Notes

Content visible to audience

Note:
These are speaker notes only visible in presenter mode
```

**Key Elements**:
- **Frontmatter** - Theme, transition, and presentation settings
- **Slide separators** - Use `---` to create new slides
- **Fragment reveals** - Use `<!-- .element: class="fragment" -->` for animations
- **Speaker notes** - Use `Note:` prefix for presenter-only content
- **Vault integration** - Link to other notes, tasks, and projects

## Organization

Slides can be organized by:
- **Presentation type** - Project updates, training, demos, talks
- **Audience** - Technical teams, stakeholders, executives
- **Event or meeting** - Specific presentations linked to meetings
- **Topic or project** - Group by subject matter or project association
- **Series** - Multi-part presentations or recurring updates

## Workflow Integration

**Creating Presentations**:
1. Create new Markdown file in `11 - Slides/`
2. Add frontmatter with theme and settings
3. Write content using Markdown and slide separators
4. Use Advanced Slides plugin to preview and present
5. Link to related vault notes for dynamic content

**Vault Integration**:
- **Link to projects** - `[[Project Name]]` for live connections
- **Embed task lists** - Show current project status
- **Reference contacts** - Link to team members and stakeholders
- **Connect to meetings** - Link from meeting notes to presentations

## Plugin Setup

**Required Plugin**: obsidian-advanced-slides

**Installation**:
1. Install from Community Plugins in Obsidian
2. Enable the plugin in Settings
3. Configure default theme and export options
4. Set up keyboard shortcuts for presentation mode

**Key Commands**:
- **Start presentation**: Command palette → "Advanced Slides: Start"
- **Export to HTML**: Right-click slide file → Export
- **Speaker mode**: During presentation → Press 'S'
- **Overview mode**: During presentation → Press 'O'

## Integration

Presentations integrate seamlessly with:
- **Meetings** where they were presented - Link from meeting notes
- **Projects** they relate to - Embed live project status
- **Contacts** in the audience - Reference team members and stakeholders  
- **Tasks and progress** - Show real-time updates from vault data

## Examples

Example slide files using Advanced Slides:
- `2025-01-15 - Sprint Review.md` - Project status with embedded task lists
- `Q1-2025 - Architecture Overview.md` - Technical presentation with diagrams
- `New Team Onboarding.md` - Training materials with interactive elements