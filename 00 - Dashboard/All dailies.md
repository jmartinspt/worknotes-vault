
```meta-bind-button
style: primary
label: ➕ Add Daily Item
action:  
  type: templaterCreateNote
  templateFile: "_templates/daily-note.md"
  fileName: "Untitled"
```

## 📇 List
```dataview
Table Date, Mood
from "03 - Daily Notes"
sort Date desc
```