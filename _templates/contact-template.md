<%*  
let title = tp.file.title
let name = "?"
let qNumber = "?"
if (title.startsWith("Untitled")) { 
qNumber = await tp.system.prompt("qNumber"); 
name = await tp.system.prompt("name");  
title = `${qNumber} - ${name}`
} await tp.file.rename(title)   
tR = `---
tags: [contact]
aliases: [${name}]
---
# 📇 Contact: ${name}

- **Name**:: ${name}
- **QNumber**:: ${qNumber}
- **CTWNumber**:: 
- **Role**:: ?
- **Team**:: ?
- **Email**:: ?
- **Email2**:: ?
- **Department**:: ?
- **PreferredChannel**:: Teams | Email | Verbal
- **ProfileLink**:: [Link](https://atc.bmwgroup.net/confluence/display/~${qNumber})

## Topics of Interest
- 

---

## Linked Projects
\`\`\`dataview
list
from "02 - Projects"
where contains(Stakeholders, this.file.link)
\`\`\`

---

## Linked tasks
\`\`\`dataview
list
from "01 - Tasks"
where contains(Context, this.file.link)
\`\`\`
`;
%>
<%* await tp.file.move(`05 - Contacts/${title}`); %>