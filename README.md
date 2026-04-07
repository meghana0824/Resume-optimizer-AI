# Resume Optimizer AI — Chrome Extension

> AI-powered Chrome Extension achieving **85–92% ATS match rates** with 8–20 strategic improvements per job application. Built with Google Gemini 2.0, ChatGPT GPT-4, and Vertex AI.

## 🌐 Live Demo
**[View Live Demo →](https://meghana0824.github.io/Resume-optimizer-AI/)**

---

## 🎯 Key Results

| Metric | Result |
|--------|--------|
| **ATS Match Rate** | 85–92% |
| **Improvements per Application** | 8–20 suggestions |
| **Applications Tracked** | 360+ |
| **AI Models Integrated** | Gemini 2.0, GPT-4, Vertex AI |
| **Outreach Emails** | Personalized per recruiter |

---

## ✨ Features

- **AI Resume Optimization** — Analyzes resume against any job description using Gemini 2.0 and GPT-4, suggesting 8–20 targeted improvements
- **ATS Score Matching** — Achieves 85–92% ATS keyword match rates by aligning resume content with job-specific requirements
- **Application Tracker** — Full-text search across 360+ job applications with real-time status updates
- **Google Drive Integration** — Automated document management syncing resumes and cover letters
- **Recruiter Automation Pipeline** — AI-powered LinkedIn search + Gmail API for personalized outreach
- **4-Score Candidate Analysis** — Evaluates fit across skills, experience, education, and culture
- **Dual-Server Architecture** — Separate Express.js servers for optimization and tracking

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────┐
│           Chrome Extension (React)           │
│  Resume upload  |  JD input  |  ATS score    │
└────────────────────┬────────────────────────┘
                     │ REST API
        ┌────────────▼────────────┐
        │  Optimization Server    │ ────▶ Gemini 2.0 API
        │  (Express.js — Port A)  │ ────▶ GPT-4 API
        └────────────┬────────────┘ ────▶ Vertex AI
                     │
        ┌────────────▼────────────┐
        │  Tracking Server        │ ────▶ PostgreSQL DB
        │  (Express.js — Port B)  │ ────▶ Google Drive API
        └─────────────────────────┘ ────▶ Gmail API
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React, TypeScript, JavaScript (ES6+), HTML5, CSS3 |
| **Backend** | Node.js, Express.js, REST APIs |
| **AI / ML** | Google Gemini 2.0, ChatGPT GPT-4, Vertex AI |
| **Database** | PostgreSQL (full-text search) |
| **Integrations** | Google Drive API, Google Docs API, Gmail API, LinkedIn |
| **Auth** | OAuth2 |

---

## 🗂️ Project Structure

```
Resume-optimizer-AI/
├── extension/
│   ├── public/
│   │   └── manifest.json
│   ├── src/
│   │   ├── components/
│   │   │   ├── ResumeUploader.jsx
│   │   │   ├── JobDescriptionInput.jsx
│   │   │   ├── ATSScoreCard.jsx
│   │   │   └── ImprovementsList.jsx
│   │   ├── App.jsx
│   │   └── index.js
│   └── package.json
├── backend/
│   ├── optimization-server/
│   │   ├── routes/
│   │   │   ├── optimize.js
│   │   │   └── analyze.js
│   │   ├── services/
│   │   │   ├── geminiService.js
│   │   │   ├── gptService.js
│   │   │   └── vertexService.js
│   │   └── server.js
│   ├── tracking-server/
│   │   ├── routes/
│   │   │   ├── applications.js
│   │   │   └── documents.js
│   │   ├── services/
│   │   │   ├── driveService.js
│   │   │   └── gmailService.js
│   │   ├── db/
│   │   │   └── schema.sql
│   │   └── server.js
│   └── package.json
├── docs/
│   └── index.html
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Node.js >= 18.x
- PostgreSQL >= 14
- Google Cloud account with APIs enabled:
  - Gemini API, Vertex AI API, Google Drive API, Gmail API
- OpenAI API key

### Installation

```bash
git clone https://github.com/meghana0824/Resume-optimizer-AI.git
cd Resume-optimizer-AI

# Install optimization server
cd backend/optimization-server && npm install

# Install tracking server
cd ../tracking-server && npm install

# Install extension
cd ../../extension && npm install
```

### Environment Variables

**optimization-server/.env**
```env
PORT=3001
GEMINI_API_KEY=your_gemini_api_key
OPENAI_API_KEY=your_openai_api_key
VERTEX_AI_PROJECT=your_gcp_project_id
VERTEX_AI_LOCATION=us-central1
```

**tracking-server/.env**
```env
PORT=3002
DATABASE_URL=postgresql://user:password@localhost:5432/resume_optimizer
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
GMAIL_REFRESH_TOKEN=your_refresh_token
```

### Run Locally

```bash
# Terminal 1
cd backend/optimization-server && npm start

# Terminal 2
cd backend/tracking-server && npm start
```

### Load Chrome Extension

1. Open Chrome → `chrome://extensions/`
2. Enable **Developer Mode**
3. Click **Load unpacked** → select `extension/build/`

---

## 📡 API Endpoints

### Optimization Server

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/optimize` | Optimize resume against JD |
| POST | `/api/analyze` | Get ATS score and keywords |
| POST | `/api/outreach` | Generate recruiter email |

### Tracking Server

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/applications` | List all applications |
| POST | `/api/applications` | Add new application |
| PUT | `/api/applications/:id` | Update status |
| GET | `/api/documents` | List Drive documents |

---

## 🎓 Skills Demonstrated

- **Full-Stack Engineering** — End-to-end Chrome extension with dual backend servers
- **AI/ML Integration** — Multi-model AI pipeline (Gemini, GPT-4, Vertex AI)
- **Cloud & APIs** — Google Cloud Platform, Drive API, Gmail API, OAuth2
- **Database Design** — PostgreSQL with full-text search across 360+ records
- **Automation** — Recruiter pipeline with personalized outreach at scale

---

## 👩‍💻 Author

**Lakshmimeghana Uppalapati**
- 📧 Email: [ulakshmi081234@gmail.com](mailto:ulakshmi081234@gmail.com)
- 💻 GitHub: [github.com/meghana0824](https://github.com/meghana0824)
- 🌐 Live Demo: [meghana0824.github.io/Resume-optimizer-AI](https://meghana0824.github.io/Resume-optimizer-AI/)

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.
