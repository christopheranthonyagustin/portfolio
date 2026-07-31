# logivis-worker

## Overview

**logivis-worker** is a Cloudflare Worker that serves as the data integration layer between **Lark Base** and the LogiVis platform.

Its primary responsibility is to retrieve operational and logistics data stored in Lark Base and expose it through a lightweight REST API for consumption by **LogiVis.WebApi**.

The worker abstracts the Lark Open API, allowing the frontend to consume a simplified and consistent API without directly communicating with Lark Base.

---

# Architecture

```text
                 Angular
                     │
                     ▼
             LogiVis.WebApi
                     │
              Internal REST API
                     │
                     ▼
             logivis-worker
                     │
              Lark Open API
                     │
                     ▼
                Lark Base
```

---

# Responsibilities

The worker is responsible for:

- Retrieving records from Lark Base
- Querying multiple Lark Base tables
- Transforming Lark Base responses
- Returning normalized JSON responses
- Encapsulating Lark Open API communication
- Managing authentication with Lark Open Platform
- Reducing API complexity for the Web API

---

# Not Responsible For

The following responsibilities belong to other services.

### LogiVis.WebApi

- Authentication
- Authorization
- JWT
- OAuth
- API Gateway
- Business Orchestration

### logivis-data-worker

- Cloudflare D1
- User Management
- Companies
- Roles
- Permissions
- Database Access

---

# Technology Stack

| Technology | Description |
|------------|-------------|
| Cloudflare Workers | Serverless runtime |
| TypeScript | Application language |
| REST API | Service interface |
| Lark Open API | Data source |

---

# Project Structure

```text
src
│
├── routes
├── services
├── models
├── middleware
├── utils
└── index.ts
```

---

# Request Flow

```text
Angular
    │
    ▼
LogiVis.WebApi
    │
Request Dashboard Data
    │
    ▼
logivis-worker
    │
Authenticate with Lark
    │
Retrieve Records
    │
Transform Response
    │
Return JSON
    ▼
LogiVis.WebApi
    │
Return Response
    ▼
Angular
```

---

# Design Principles

- Stateless
- Lightweight
- Serverless
- RESTful
- Separation of Concerns
- API Abstraction
- Modular Services

---

# Security

- HTTPS
- Secure Lark Authentication
- Environment Variables for Secrets
- Request Validation

---

# Future Enhancements

- Response Caching
- Pagination
- Filtering
- Search
- Batch Retrieval
- Retry Policies
- Performance Monitoring

---

# Solution Architecture

```text
             Lark Base
                 │
          Lark Open API
                 │
                 ▼
         logivis-worker
                 │
                 ▼
        LogiVis.WebApi
                 │
                 ▼
            Angular 20
```

---

# Philosophy

The **logivis-worker** acts as a dedicated data access service for Lark Base.

Instead of allowing the frontend or the Web API to communicate directly with Lark Open APIs, the worker encapsulates authentication, data retrieval, and response transformation. This approach simplifies client applications, centralizes integration logic, and provides a clean abstraction layer between the LogiVis platform and Lark Base.
