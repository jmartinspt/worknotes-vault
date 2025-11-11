<%*
const today = tp.date.now("YYYY-MM-DD");
const title = `${today} - Daily Log`;
tR = `---
tags:
  - daily
Date: ${today} 
---
# 📅 ${title}

## ✅ Today's Tasks
\`\`\`tasks
due '${today}'
\`\`\`

---

## 🧠 Quick Notes
- 

---

## 🗣️ Conversations
- **{{time}}** – person: {{topic}}

---

## 📅 Meetings
\`\`\`dataview
table Date, Time
from ""
where regexmatch("^04 - Meetings|^10 - Interviews/1_Candidates", file.path)
and date(Date) = date("${today}")
sort Date desc, Time desc
\`\`\`

---

## 📅 Trainings
\`\`\`dataview
table Start, End
from "09 - Trainings"
where date(Start) <= date("${today}") and date(End) >= date("${today}")
sort Desc asc
\`\`\`

---

## 📝 Retrospective
- **Good**:
- **Bad**:
- **Improvements**:
- **Mood**::
`;
%>
<%* await tp.file.move(`03 - Daily Notes/${title}`); %>