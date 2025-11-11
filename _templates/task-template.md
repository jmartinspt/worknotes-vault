<%*  
let title = tp.file.title   
if (title.startsWith("Untitled")) {  
title = await tp.system.prompt("Title");   
} await tp.file.rename(title)   
-%>
<%*
const today = tp.date.now("YYYY-MM-DD");
tR = `---
tags: [task]
---
# ✅ Task: ${title}

- [ ] ${title} 🔽 ➕ ${today}
- **Context**:: [[Project Name]], [[Contact Name]]
- **Status**::
- **Due**::

## 🔍 Details
- **Description**:
- **Links**:
`;
%>
<%* await tp.file.move(`01 - Tasks/${title}`); %>