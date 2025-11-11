
```meta-bind-button
style: primary
label: ➕ Participant training
action:  
  type: templaterCreateNote
  templateFile: "_templates/training/participant.md"
  fileName: "Untitled"
```
## 📇Participant List
```dataview
table Start, Mode
from "09 - Trainings/participant"
sort Desc asc
```


---
```meta-bind-button
style: primary
label: ➕ Trainer training
action:  
  type: templaterCreateNote
  templateFile: "_templates/training/trainer.md"
  fileName: "Untitled"
```

## 📇Trainer List
```dataview
table QNumber, Name, Email, team
from "09 - Trainings/trainer"
sort Name asc
```