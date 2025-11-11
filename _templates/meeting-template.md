<%*  
let title = tp.file.title   
if (title.startsWith("Untitled")) {  
title = await tp.system.prompt("Title");   
} await tp.file.rename(title)   
-%>
<%*
const today = tp.date.now("YYYY-MM-DD");

tR = `---
tags: [meeting]
---

# 📋 Meeting: ${title}

- **Date**:: ${today}
- **Time**:: {{time}}
- **Mode**:: Remote | In Person
- **Participants**: [[person1]], [[person2]]
- **Project**:: [[Project Name]]

## 🗒️ Agenda
- 

---

## 🧠 Notes
- 

---

## 📌 Decisions
- 

---

## ✅ Action Items
- 
`;
%>
<%* await tp.file.move(`04 - Meetings/${today} - ${title}`); %>
