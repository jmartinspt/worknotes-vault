# Templates

This folder contains note templates that ensure consistency and completeness across your vault. Templates provide structured formats for different types of content.

## Available Templates

### Core Templates
- **`task-template.md`** - Structured task management with status tracking
- **`project-template.md`** - Comprehensive project planning and monitoring  
- **`meeting-template.md`** - Standardized meeting notes and action items
- **`daily-note.md`** - Consistent daily logging and reflection
- **`contact-template.md`** - Organized contact information management

### Specialized Templates
- **`interviews/`** - Interview-related templates for different scenarios
- **`training/`** - Training and learning activity templates

## Template Features

**Templater Integration**: These templates use the Templater plugin for dynamic content:
- Automatic file naming and placement
- Date insertion and formatting
- Interactive prompts for user input
- Metadata and frontmatter generation

**Structured Content**: Each template includes:
- Consistent frontmatter and tags
- Organized sections and headers
- Integration points for linking related content
- Placeholder text and examples

## Usage

1. **Install Templater Plugin** in Obsidian
2. **Configure template folder** to point to `_templates/`
3. **Use hotkeys or command palette** to insert templates
4. **Customize prompts** and default values as needed

## Customization

**Modify Templates**: Adjust sections, fields, and formatting to match your workflow:
- Add or remove metadata fields
- Change section organization
- Customize placeholder text
- Update integration queries

**Create New Templates**: Follow the existing pattern:
- Use consistent frontmatter structure
- Include relevant tags and metadata
- Add integration points for related content
- Test with Templater plugin

## Template Structure

```markdown
<%* Templater script for dynamic content %>
---
tags: [tag1, tag2]
created: <% tp.date.now("YYYY-MM-DD") %>
---
# Template Title

- **Field 1**:: Value
- **Field 2**:: Value

## Section 1
Content and placeholders

## Section 2  
Integration queries and links
```

## Best Practices

- **Keep templates focused** - One template per content type
- **Include helpful placeholders** - Guide users with examples
- **Use consistent structure** - Similar organization across templates
- **Test regularly** - Ensure templates work with your plugins
- **Document changes** - Track template modifications over time