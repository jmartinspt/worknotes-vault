
```meta-bind-button
style: primary
label: ➕ Add Task Item
action:  
  type: templaterCreateNote
  templateFile: "_templates/task-template.md"
  fileName: "Untitled"
```
# 🧭 Tasks Dashboard

## 🔥 High Priority
```tasks
not done
priority is high
```

---
# 📅 Due This Week
```tasks
not done
due after yesterday
sort by due
```

---
# 😢 Lost
```tasks
not done
due before today
sort by due
```
---

# 💤 No Due Date
```tasks
not done
no due date
group by path
```


## 📇 List
```dataview
table
from "01 - Tasks"
sort File asc
```