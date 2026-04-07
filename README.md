# Resume Optimizer AI — Chrome Extension

> AI-powered resume optimization Chrome Extension achieving **85–92% ATS match rates** with 8–20 strategic improvements per job application. Built with Google Gemini 2.0, ChatGPT GPT-4, and Vertex AI.

---

## Demo

![Resume Optimizer Demo](assets/demo.gif)

> _Upload your resume → paste a job description → get instant AI-powered optimization with ATS score_

---

## Features

- **AI Resume Optimization** — Analyzes your resume against any job description using Gemini 2.0 and GPT-4, suggesting 8–20 targeted improvements per application
- **ATS Score Matching** — Achieves 85–92% ATS keyword match rates by aligning resume content with job-specific requirements
- **Application Tracker** — Full-text search across 360+ job applications with real-time status updates and PostgreSQL backend
- **Google Drive Integration** — Automated document management syncing resumes and cover letters to Google Drive
- **Recruiter Automation Pipeline** — AI-powered LinkedIn search + Gmail API integration for personalized outreach email generation
- **4-Score Candidate Analysis** — Evaluates fit across skills, experience, education, and culture dimensions
- **Dual-Server Architecture** — Separate Express.js servers for optimization and application tracking for independent scaling

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React, TypeScript, JavaScript (ES6+), HTML5, CSS3 |
| Backend | Node.js, Express.js, REST APIs |
| AI / ML | Google Gemini 2.0, ChatGPT GPT-4, Vertex AI |
| Database | PostgreSQL (full-text search) |
| Integrations | Google Drive API, Google Docs API, Gmail API, LinkedIn Search |
| Auth | OAuth2 |

---

## Architecture

```
┌─────────────────────────────────────────────┐
│           Chrome Extension (React)           │
│  - Resume upload   - JD input   - ATS score  │
└────────────────────┬────────────────────────┘
                     │ REST API
        ┌────────────▼────────────┐
        │  Optimization Server    │      ┌─────────────────┐
        │  (Express.js — Port A)  │─────▶│  Gemini 2.0 API │
        │                         │─────▶│  GPT-4 API      │
        └────────────┬────────────┘─────▶│  Vertex AI      │
                     │                   └─────────────────┘
        ┌────────────▼────────────┐
        │  Tracking Server        │      ┌─────────────────┐
        │  (Express.js — Port B)  │─────▶│  PostgreSQL DB  │
        │                         │─────▶│  Google Drive   │
        └─────────────────────────┘─────▶│  Gmail API      │
                                         └─────────────────┘
```

---

## Project Structure

```
resume-optimizer-ai/
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
├── assets/
│   └── demo.gif
├── .gitignore
├── LICENSE
└── README.md
```

---

## Getting Started

### Prerequisites

- Node.js >= 18.x
- PostgreSQL >= 14
- Google Cloud account with APIs enabled:
  - Gemini API
  - Vertex AI API
  - Google Drive API
  - Gmail API
- OpenAI API key

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/resume-optimizer-ai.git
cd resume-optimizer-ai

# Install backend dependencies
cd backend/optimization-server
npm install

cd ../tracking-server
npm install

# Install extension dependencies
cd ../../extension
npm install
```

### Environment Variables

Create a `.env` file in each server directory:

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

### Database Setup

```bash
cd backend/tracking-server
psql -U postgres -f db/schema.sql
```

### Running Locally

```bash
# Terminal 1 — Optimization server
cd backend/optimization-server
npm start

# Terminal 2 — Tracking server
cd backend/tracking-server
npm start
```

### Load the Chrome Extension

1. Open Chrome → go to `chrome://extensions/`
2. Enable **Developer Mode** (top right toggle)
3. Click **Load unpacked**
4. Select the `extension/build/` folder

---

## Key Results

| Metric | Result |
|---|---|
| ATS Match Rate | 85–92% |
| Improvements per application | 8–20 suggestions |
| Applications tracked | 360+ |
| Outreach emails automated | Personalized per recruiter |

---

## API Endpoints

### Optimization Server

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/optimize` | Optimize resume against job description |
| POST | `/api/analyze` | Get ATS score and keyword analysis |
| POST | `/api/outreach` | Generate personalized recruiter email |

### Tracking Server

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/applications` | List all tracked applications |
| POST | `/api/applications` | Add new application |
| PUT | `/api/applications/:id` | Update application status |
| GET | `/api/documents` | List Google Drive documents |

---

## License

MIT License — see [LICENSE](LICENSE) for details.

---

## Author

**Lakshmimeghana Uppalapati**
- Email: ulakshmi081234@gmail.com
- LinkedIn: [linkedin.com/in/lakshmimeghana](https://linkedin.com/in/lakshmimeghana)
