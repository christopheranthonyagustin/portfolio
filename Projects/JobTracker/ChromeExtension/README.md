# Job Tracker Chrome Extension

## Overview

Job Tracker is a Chrome Extension that automates job application tracking, AI-powered job analysis, and Google Sheets reporting.

Instead of manually maintaining spreadsheets, users can capture job details directly from job portals, analyze role suitability using CareerOps AI, and automatically store application records in Google Sheets.

The solution was developed to streamline high-volume job applications while providing data-driven insights into career opportunities.

---

## Extension Popup

Displays:

* Job Analysis
* CareerOps AI Results
* Match Percentage
* Market Fit Assessment
* Missing Skills Analysis

---

## Google Sheets Dashboard

Tracks:

* Applications
* Resume Versions
* Application Status
* AI Recommendations
* Match Scores

---

## AI Analysis Example

Shows:

* Industry Classification
* Job Level
* Market Fit
* Missing Skills
* Match Percentage

---


# Features

## Job Posting Capture

Automatically extracts:

* Company Name
* Position
* Location
* Salary
* Employment Type
* Work Arrangement
* Job URL
* Application Volume

Supported Platforms:

* JobStreet
* Generic Career Websites
* Greenhouse
* Lever
* Workday
* Company Career Pages

---

## Resume Tracking

Captures:

* Resume File
* Resume Version
* Cover Letter Usage

Examples:

* PM_v1
* TPM_v1
* OMS_v1

Allows performance tracking across multiple resume versions.

---

## CareerOps AI Analysis

The extension integrates with CareerOps AI to evaluate job suitability.

Generated Insights:

* Company Industry
* Job Level
* Required Skills
* Missing Skills
* Market Fit
* Match Percentage
* Career Alignment Recommendations

Example Output:

```json
{
  "companyIndustry": "Software/SaaS",
  "jobLevel": "Mid-Level Sales",
  "marketFit": "Low",
  "matchPercentage": 35
}
```

---

## Google Sheets Integration

Application records are automatically inserted into Google Sheets.

Tracked Fields:

* Company
* Position
* Source
* Resume Version
* Cover Letter
* Market Fit
* Missing Skills
* Match Percentage
* AI Analysis Date

Duplicate prevention is implemented using Job URL validation.

---

# Technology Stack

## Frontend

* HTML5
* CSS3
* Vanilla JavaScript (ES6)

## Chrome Extension

* Chrome Extension Manifest V3
* Content Scripts
* Background Service Worker
* Chrome Storage API
* Chrome Messaging API

## AI & Backend

* CareerOps AI
* REST API Integration
* Google Cloud Run

## Database & Reporting

* Google Sheets
* Google Apps Script

## Development Tools

* Visual Studio Code
* Git
* GitHub
* Chrome Developer Tools
* Postman

---

# Architecture Diagram

```text
+-------------------------+
|  Job Portal Website     |
| (JobStreet, Atlassian)  |
+------------+------------+
             |
             v
+-------------------------+
| Chrome Content Script   |
+------------+------------+
             |
             v
+-------------------------+
| Build Final Application |
+------------+------------+
             |
    +--------+--------+
    |                 |
    v                 v

+-----------+   +----------------+
| CareerOps |   | Google Sheets  |
| AI API    |   | Apps Script    |
+-----+-----+   +--------+-------+
      |                   |
      v                   v

+----------------+   +----------------+
| AI Analysis    |   | Application DB |
+----------------+   +----------------+
```

---

# Chrome Extension Structure

```text
job-tracker-extension/
│
├── manifest.json
│
├── popup/
│   ├── popup.html
│   ├── popup.js
│   └── styles.css
│
├── content/
│   └── content.js
│
├── background/
│   └── background.js
│
├── assets/
│   ├── icon16.png
│   ├── icon48.png
│   └── icon128.png
│
├── docs/
│   ├── screenshots/
│   └── demo/
│
└── README.md
```

---

# Productivity Impact

Before using Job Tracker:

* Manual spreadsheet entry
* Manual URL tracking
* Manual resume tracking
* Manual fit evaluation

Average time per application:

~3–5 minutes

After using Job Tracker:

* One-click capture
* Automatic AI analysis
* Automatic spreadsheet update
* Resume version tracking

Average time per application:

~20–30 seconds

Reduction:

Approximately 85–90% less administrative effort.

---

# Installation

1. Clone repository

```bash
git clone https://github.com/yourusername/job-tracker-extension.git
```

2. Open Chrome

```text
chrome://extensions
```

3. Enable Developer Mode

4. Click Load Unpacked

5. Select project folder

---

# Future Enhancements

## Version 2.1

* LinkedIn Support
* Indeed Support
* Kalibrr Support
* Foundit Support

## Version 2.2

* Interview Tracking
* Recruiter Tracking
* Follow-up Reminders

## Version 3.0

* Dashboard Analytics
* Resume Performance Metrics
* AI Resume Recommendations
* Job Market Trend Analysis

---

# Author

Christopher Anthony Agustin

Technical Project Manager | Software Engineer

Specializations:

* Project Management
* Enterprise Software
* E-Commerce
* OMS/WMS Platforms
* Process Automation
* AI-Powered Productivity Solutions

---

# License

MIT License
