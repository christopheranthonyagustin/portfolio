# logivis-data-worker

## Overview

**logivis-data-worker** is the data service of the LogiVis platform built on **Cloudflare Workers**. It provides a secure REST API for accessing and managing application data stored in **Cloudflare D1 (SQLite)**.

The worker serves as the data access layer of the platform, encapsulating all database operations behind a clean API. It is responsible for executing SQL queries, enforcing data access patterns, and exposing CRUD endpoints to the application layer.

Unlike traditional ASP.NET applications, **LogiVis.WebApi does not communicate directly with the database**. Instead, all data persistence is delegated to this worker.

---

# Architecture

```text
                   Angular 20
                        │
                        ▼
                 LogiVis.WebApi
          Authentication / JWT / OAuth
                        │
                Internal REST API
                        │
                        ▼
             logivis-data-worker
                        │
              Routes / Services
                        │
                 Repository Layer
                        │
                Cloudflare D1 API
                        │
                        ▼
              Cloudflare D1 (SQLite)
```

---

# Responsibilities

The data worker is responsible for:

- Database Access
- CRUD Operations
- SQL Query Execution
- Repository Pattern
- Data Validation
- Business Data Persistence
- User Management
- Company Management
- Identity Provider Management
- External Login Management
- Role Management
- Permission Management

---

# Not Responsible For

The following responsibilities belong to **LogiVis.WebApi**.

- Authentication
- OAuth
- JWT Generation
- JWT Validation
- API Gateway
- Business Workflow Orchestration

The following responsibilities belong to **logivis-worker**.

- Lark Base Integration
- External Data Retrieval
- Dashboard Data Aggregation

---

# Technology Stack

| Technology | Description |
|------------|-------------|
| Cloudflare Workers | Serverless Runtime |
| TypeScript | Programming Language |
| Cloudflare D1 | Managed SQLite Database |
| REST API | Internal Service |

---

# Project Structure

```text
src
│
├── database
│   └── DatabaseContext.ts
│
├── repositories
│   ├── BaseRepository.ts
│   ├── RepositoryFactory.ts
│   └── UserRepository.ts
│
├── services
│
├── routes
│
├── models
│
├── middleware
│
├── utils
│
└── index.ts
```

---

# Layered Architecture

The project follows a layered architecture that separates HTTP handling, business logic, and database access.

```text
HTTP Request
      │
      ▼
Routes
      │
      ▼
Services
      │
      ▼
Repositories
      │
      ▼
DatabaseContext
      │
      ▼
Cloudflare D1
```

---

# Repository Pattern

All SQL statements are isolated inside repositories.

```text
Routes
    │
    ▼
Services
    │
    ▼
RepositoryFactory
    │
    ▼
Repositories
    │
    ▼
DatabaseContext
    │
    ▼
Cloudflare D1
```

This design provides:

- Separation of concerns
- Centralized SQL management
- Reusable data access logic
- Easier testing and maintenance

---

# Database

The worker communicates directly with **Cloudflare D1**, a managed SQLite database.

Current architecture:

```text
DatabaseContext
        │
        ▼
 env.DB (D1 Binding)
        │
        ▼
 Cloudflare D1
```

The worker never uses local SQLite database files. All queries are executed remotely through Cloudflare's D1 service.

---

# Request Flow

```text
Angular
    │
    ▼
LogiVis.WebApi
    │
Authenticated Request
    │
    ▼
logivis-data-worker
    │
Route
    │
    ▼
Service
    │
    ▼
Repository
    │
    ▼
Cloudflare D1
    │
    ▼
Response
```

---

# Current Modules

Current and planned data modules include:

- Users
- Companies
- Identity Providers
- Company Identity Providers
- External Logins
- Roles
- Permissions
- Role Permissions
- User Roles

Each module follows the same architecture:

```text
Route
    │
    ▼
Service
    │
    ▼
Repository
    │
    ▼
Cloudflare D1
```

---

# Design Principles

- Clean Architecture
- Separation of Concerns
- Repository Pattern
- Stateless Services
- RESTful APIs
- Dependency Injection
- Single Responsibility Principle

---

# Security

- Internal REST API
- HTTPS
- Parameterized SQL Queries
- Environment-based Configuration
- Cloudflare Secret Management

---

# Future Enhancements

Planned enhancements include:

- Database Migrations
- Soft Delete Support
- Audit Logging
- Optimistic Concurrency
- Pagination
- Filtering
- Search
- Bulk Operations
- Transaction Support
- Caching

---

# Solution Architecture

```text
                 Angular
                     │
                     ▼
             LogiVis.WebApi
     Authentication / Authorization
                     │
                     ▼
          logivis-data-worker
                     │
        Routes / Services / Repositories
                     │
                     ▼
           Cloudflare D1 (SQLite)
```

---

# Philosophy

The **logivis-data-worker** is the persistence layer of the LogiVis platform.

It is solely responsible for managing application data stored in Cloudflare D1. By isolating database access behind repositories and exposing a dedicated REST API, the platform achieves a clean separation between application logic and data persistence.

This architecture allows **LogiVis.WebApi** to focus on authentication, authorization, and business orchestration, while **logivis-data-worker** remains dedicated to efficient, maintainable, and scalable data access.
