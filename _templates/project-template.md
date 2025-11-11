<%*  
let title = tp.file.title   
if (title.startsWith("Untitled")) {  
title = await tp.system.prompt("Title");   
} await tp.file.rename(title)   
-%>
<%*
const today = tp.date.now("YYYY-MM-DD");

tR = `---
tags: [project]
---
# 📁 Project: ${title}

- **Start**:: ${today}
- **Due**:: ${today}
- **Status**:: Open | In Progress | On Hold | Done | Rejected
- **Stakeholders**:: [[Contact 1]], [[Contact 2]]

## 🗒️ Details
- 

---

## 🎯 Goals
- 

---

## ✅ Tasks
\`\`\`dataview
table status, due
from "01 - Tasks"
where contains(Context, this.file.link)
\`\`\`

---

## 📅 Meetings
\`\`\`dataview
list
from "04 - Meetings"
where contains(Project, this.file.link)
\`\`\`

---

## 🧠 Notes
- 
`;
%>
<%* await tp.file.move(`02 - Projects/${title}`); %>