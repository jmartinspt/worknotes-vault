# Setup Guide

This guide will help you get started with the OneShop Obsidian Vault Template and configure it for your specific needs.

## Quick Setup

### 1. Installation
1. **Clone or download** this repository
2. **Open in Obsidian** as a new vault
3. **Install recommended plugins** (see below)
4. **Customize templates and constants** for your workflow

### 2. Required Plugins

**Essential Plugins**:
- **Templater** - For dynamic template functionality
- **Dataview** - For automated content aggregation (used in dashboards)
- **Meta Bind** - For interactive dashboard add buttons and form elements
- **Calendar** - For daily note navigation
- **Tag Wrangler** - For tag management

**Optional but Recommended**:
- **Advanced Tables** - For better table editing
- **Kanban** - For visual task management
- **Periodic Notes** - For automated daily note creation
- **QuickAdd** - For rapid content creation
- **Advanced Slides** - For creating presentations from Markdown (used in Slides folder)

### 3. Plugin Configuration

**Templater Setup**:
1. Enable Templater plugin
2. Set template folder to `_templates`
3. Configure hotkeys for common templates
4. Enable automatic triggering on new file creation

**Dataview Setup**:
1. Enable Dataview plugin
2. Set to JavaScript mode for advanced queries
3. Configure refresh settings for real-time updates

**Meta Bind Setup**:
1. Enable Meta Bind plugin
2. Configure button styles and themes
3. Test add buttons in dashboard files
4. Customize button actions if needed

**Calendar Setup**:
1. Link to daily notes folder (`03 - Daily Notes`)
2. Set date format to `YYYY-MM-DD - Daily Log`
3. Configure daily note template

## Customization Guide

### 1. Update Constants
Edit files in `_constants/` to match your organization:

**Status (`_constants/status.md`)**:
```
Not Started
In Progress  
Review
Testing
Done
Cancelled
```

**Team (`_constants/team.md`)**:
```
John Doe - Product Manager
Jane Smith - Tech Lead
Mike Johnson - Developer
Sarah Wilson - Designer
```

### 2. Customize Templates
Modify templates in `_templates/` for your workflow:

**Add Custom Fields**:
- Include organization-specific metadata
- Add required approval workflows
- Customize linking structures

**Update Queries**:
- Modify Dataview queries in project template
- Adjust dashboard aggregations
- Customize filtering criteria

### 3. Folder Structure
Adjust the folder structure if needed:
- Add domain-specific folders
- Reorganize by team or function  
- Create sub-folders for large categories

## Workflow Integration

### 1. Daily Workflow
1. **Start day** with daily note creation
2. **Plan tasks** using task template
3. **Track meetings** with meeting template
4. **Update projects** with progress
5. **Review dashboards** for overview

### 2. Project Management
1. **Create project** using project template
2. **Break down into tasks** in Tasks folder
3. **Link related meetings** and contacts
4. **Track progress** through status updates
5. **Use dashboards** for portfolio view

### 3. Knowledge Management
1. **Document processes** in Documentation folder
2. **Track learnings** in Trainings folder
3. **Maintain contacts** with contact template
4. **Link everything** for discoverability

## Advanced Configuration

### 1. Automation
Set up automation for:
- **Daily note creation** at specific times
- **Weekly/monthly reviews** with templates
- **Automated tagging** based on content
- **Status updates** via external tools

### 2. Integration
Connect with external tools:
- **Jira/GitHub** for task synchronization
- **Calendar apps** for meeting integration
- **Slack/Teams** for notification workflows
- **Time tracking** tools for productivity metrics

### 3. Backup and Sync
Configure backup strategy:
- **Git repository** for version control
- **Cloud sync** for multi-device access
- **Regular exports** for data safety
- **Archive strategy** for old content

## Troubleshooting

### Common Issues

**Templates Not Working**:
- Check Templater plugin is enabled
- Verify template folder path is correct
- Ensure template syntax is valid

**Dataview Queries Failing**:
- Confirm Dataview plugin is enabled
- Check query syntax in templates
- Verify file metadata is correct

**Links Not Resolving**:
- Use double bracket notation: `[[File Name]]`
- Ensure file names match exactly
- Check for typos in link targets

### Performance Optimization

**Large Vault Management**:
- Use folders to organize content
- Archive old content regularly
- Limit complex Dataview queries
- Optimize image and attachment sizes

## Support and Community

- **Documentation**: Refer to README files in each folder
- **Examples**: Check example files for reference
- **Community**: Share improvements and customizations
- **Issues**: Report problems or suggest enhancements

## Migration Guide

### From Other Systems

**From Notion**:
1. Export Notion data as Markdown
2. Reorganize into folder structure
3. Update linking syntax
4. Add frontmatter metadata

**From Jira/Linear**:
1. Export task and project data
2. Create using task/project templates
3. Update status mapping
4. Link related items

**From Google Docs/Confluence**:
1. Convert documents to Markdown
2. Organize in Documentation folder
3. Add consistent metadata
4. Create cross-references

This setup guide should get you started with the vault template. Customize it to fit your specific workflow and organizational needs!