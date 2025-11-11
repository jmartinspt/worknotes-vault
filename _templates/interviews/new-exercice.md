<%*
// Templater script to create a new exercise with questions and answers in markdown format

// Prompt for exercise metadata
const fileName = await tp.system.prompt("File name (e.g., file-name");
const title = await tp.system.prompt("Exercise Title (e.g., Arrays Challenges – JavaScript)");
const topic = await tp.system.prompt("Topic (e.g., Arrays, Data transformation)");
const difficulty = await tp.system.prompt("Difficulty (e.g., Intermediate)");
const tags = await tp.system.prompt("Tags (comma separated, e.g., javascript,arrays,interview)");

// Prompt for number of questions
const numQuestions = parseInt(await tp.system.prompt("How many questions?"), 10);

let questions = [];
let answers = [];

for(let i=1; i<=numQuestions; i++) {
  const q = await tp.system.prompt(`Question ${i} (Markdown allowed)`);
  const a = await tp.system.prompt(`Answer ${i} (Markdown allowed)`);
  questions.push(q);
  answers.push(a);
}

// Build the markdown content
let md = `# ${title}\n\n**Topic:** ${topic}\n**Difficulty:** ${difficulty}\n**Tags:** ${tags.split(",").map(t=>"#"+t.trim()).join(" ")}\n\n---\n\n## 🧪 Exercise Description\n\n_Describe the exercise purpose here._\n\n---\n\n## ❓ Questions\n\n`;

for(let i=0; i<numQuestions; i++) {
  md += `### ${i+1}. Question\n\n${questions[i]}\n\n---\n\n`;
}

tR += md;

await tp.file.move("10 - Interviews/5_Exercises/" + fileName + ".md")
%>
