---
tags:
  - interview
---
<%*
const name = await tp.system.prompt("Candidate Name")
const position = await tp.system.prompt("Position")
const today = tp.date.now("YYYY-MM-DD")
const fileSlug = name.toLowerCase().replaceAll(" ", "-")
const baseFolder = "10 - Interviews"
-%>

---
# 📇 Candidate: <% name %>

**Name**:: <% name %>
**Date**:: <% today %>
**Time**:: {{hh:mm}}
**Position**:: <% position %> 
**Level**:
**Status**:: Open
**Decision:** Approved / Rejected / Pool
**Script Used**: [[<% baseFolder %>/2_Scripts/node-template]]
**CV File**: [[file]]
**Team Tailor**: [[link]]

---
## 📜 Preparation

### Theory
- x

### Practical
- x
---


## 📃 Overral
## 🔍 Technical Review

- **Strengths**:
- **Weaknesses**:
- **Skills**:

---
## 🛠️ Technical Skills

| Skill      | Rating (1–5) | Notes |
| ---------- | ------------ | ----- |
| JavaScript |              |       |
| Node.js    |              |       |
| Git        |              |       |
## 🧪 Exercise Feedback

- **Problem-solving**:
- **Code clarity**:
- **Performance**:

---
## 🧠 Soft Skills

| Category        | Rating (1–5) | Notes |
| --------------- | ------------ | ----- |
| Communication   |              |       |
| Problem-solving |              |       |
| Attitude        |              |       |

## ✅ Tasks

- [ ] Write an evaluation in a linked note  ⏫
- [ ] Send feedback  ⏫
- [ ] Update candidate status  ⏫

<%* await tp.file.move(`${baseFolder}/1_Candidates/${fileSlug}`); %>