
```meta-bind-button
style: primary
label: ➕ Add Candidate
action:  
  type: templaterCreateNote
  templateFile: "_templates/interviews/new-candidate.md"
  fileName: "Untitled"
```
## 🧑‍💼 Candidate Tracker

```dataview
table Name, Position, Status, Date, Time
from "10 - Interviews/1_Candidates"
sort Date desc, Time Desc
```


---

## 📋 Interview Tasks

```tasks
path includes 10 - Interviews/1_Candidates
group by path
```
---

