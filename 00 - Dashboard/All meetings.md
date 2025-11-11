
```meta-bind-button
style: primary
label: ➕ Add Item
action:  
  type: templaterCreateNote
  templateFile: "_templates/meeting-template.md"
  fileName: "Untitled"
```

## 📇 List
```dataview
table Date, Time
from "04 - Meetings"
sort Date desc, Time desc
```
