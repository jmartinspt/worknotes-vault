
```meta-bind-button
style: primary
label: ➕ Add Item
action:  
  type: templaterCreateNote
  templateFile: "_templates/contact-template.md"
  fileName: "Untitled"
```

## 📇 List
```dataview
table QNumber, Name, Email, team
from "05 - Contacts"
sort Name asc
```
