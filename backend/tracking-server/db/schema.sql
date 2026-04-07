-- Resume Optimizer AI — Database Schema

CREATE TABLE IF NOT EXISTS applications (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(255) NOT NULL,
    job_description TEXT,
    resume_version TEXT,
    ats_score INTEGER,
    status VARCHAR(50) DEFAULT 'applied',
    applied_date TIMESTAMP DEFAULT NOW(),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    application_id INTEGER REFERENCES applications(id),
    document_name VARCHAR(255) NOT NULL,
    drive_file_id VARCHAR(255),
    drive_url TEXT,
    document_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS outreach (
    id SERIAL PRIMARY KEY,
    application_id INTEGER REFERENCES applications(id),
    recruiter_name VARCHAR(255),
    recruiter_email VARCHAR(255),
    linkedin_url TEXT,
    email_subject TEXT,
    email_body TEXT,
    sent_at TIMESTAMP,
    status VARCHAR(50) DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Full-text search index
CREATE INDEX IF NOT EXISTS idx_applications_search
ON applications USING gin(
    to_tsvector('english', company_name || ' ' || job_title || ' ' || COALESCE(notes, ''))
);

-- Status index for filtering
CREATE INDEX IF NOT EXISTS idx_applications_status ON applications(status);
CREATE INDEX IF NOT EXISTS idx_applications_date ON applications(applied_date DESC);
