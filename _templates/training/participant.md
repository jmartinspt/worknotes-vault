<%*  
let title = tp.file.title   
if (title.startsWith("Untitled")) {  
title = await tp.system.prompt("Title");
startDate = await tp.system.prompt("Start Date (YYYY-MM-DD)");
endDate = await tp.system.prompt("End Date (YYYY-MM-DD)");  
} await tp.file.rename(title)   
-%>
<%*
tR = `---
tags: [participant_training]
Certificate: false
---

# 📘 Training: ${title}

## 📄 Overview
- **Type**:: Tech | Soft Skills
- **Mode**:: Remote | In-person
- **Trainer**:: {{Trainer}}
- **Location**:: {{Location}}
- **Organization**:: {{Organization}}
- **Start**:: ${startDate}
- **End**:: ${endDate}
- **Mood**::

---

## 📜 Training Description

---

## 🗒️ Session Notes
-

---

### 📆 Day 1 - ${startDate}

#### 🧠 Topics Covered
- 

---

#### ❓ Questions
- 

---

#### ✍️ Notes
- 

---

## ✅ Action Items
- [ ] Give training feedback 🔼 ➕ ${startDate} 📅 ${endDate}
- [ ] Confirm participation at CTW Growth 🔼 ➕ ${startDate} 📅 ${endDate}
- [ ] Download certificate 🔼 ➕ ${startDate} 📅 ${endDate}

---

## 📎 Attachments
- 📄 Certificate
- 📑 Slides
- 🧾 Extra Materials

---
`;
%>
<%* await tp.file.move(`09 - Trainings/participant/${startDate} - ${title}`); %>
