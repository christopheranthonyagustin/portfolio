# LogiVis.WebApi

## Overview

**LogiVis.WebApi** is the primary application API for the LogiVis platform. It is responsible for authentication, authorization, API orchestration, and secure communication between the frontend and backend services.

Unlike traditional ASP.NET applications, **LogiVis.WebApi does not directly access the database**. All database operations are delegated to the **logivis-data-worker**, which communicates with Cloudflare D1.

This architecture keeps the Web API lightweight, secure, and focused on application logic.

---

# Architecture

```text
                   +--------------------+
                   |   Angular 20 SPA   |
                   +---------+----------+
                             |
                       HTTPS / JWT
                             |
                             ▼
                  +----------------------+
                  |   LogiVis.WebApi     |
                  |----------------------|
                  | Authentication       |
                  | Authorization        |
                  | OAuth               |
                  | JWT                |
                  | Business Logic      |
                  | API Orchestration   |
                  +----------+----------+
                             |
                     Internal HTTP API
                             |
                             ▼
                +--------------------------+
                | logivis-data-worker      |
                |--------------------------|
                | Routes                   |
                | Services                 |
                | Repositories             |
                | Cloudflare D1            |
                +------------+-------------+
                             |
                             ▼
                    Cloudflare D1 Database
```

---

# Responsibilities

The Web API is responsible for:

- User Authentication
- OAuth Integration
    - Google
    - Lark
- JWT Generation
- JWT Validation
- Authorization
- API Gateway
- Business Workflow Orchestration
- Calling backend services
- Request Validation
- Exception Handling

---

# Not Responsible For

The following responsibilities belong to **logivis-data-worker**.

- SQL Queries
- CRUD Operations
- Repository Pattern
- Database Connections
- Cloudflare D1
- Data Persistence

---

# Technology Stack

| Technology | Version |
|------------|---------|
| ASP.NET Core | .NET 10 |
| C# | Latest |
| JWT Bearer Authentication | ✔ |
| Google OAuth | ✔ |
| Lark OAuth | ✔ |
| REST API | ✔ |

---

# Project Structure

```
LogiVis.WebApi
│
├── Controllers
├── Services
├── Models
├── DTOs
├── Configuration
├── Authentication
├── Middleware
├── Extensions
├── Utilities
└── Program.cs
```

---

# Authentication Flow

```text
Angular
    │
    ▼
Google / Lark Login
    │
    ▼
LogiVis.WebApi
    │
Exchange OAuth Code
    │
    ▼
Google / Lark
    │
User Information
    │
    ▼
logivis-data-worker
    │
Validate External Login
    │
Cloudflare D1
    │
Return User
    ▼
LogiVis.WebApi
    │
Generate JWT
    │
Redirect to Angular
```

---

# Authorization

JWT Bearer Authentication is used to secure all protected endpoints.

Current JWT Claims:

- Subject (UserId)
- Email
- JWT ID (JTI)

Future claims may include:

- Company
- Roles
- Permissions

---

# Communication

The Web API communicates with:

## Frontend

- Angular 20

Protocol

- HTTPS

Authentication

- JWT Bearer Token

---

## Backend

- logivis-data-worker

Protocol

- Internal REST API

Authentication

- Service-to-Service

---

# Design Principles

- Single Responsibility Principle
- Clean Architecture
- Separation of Concerns
- Stateless API
- RESTful Design
- Dependency Injection
- OAuth 2.0
- JWT Authentication

---

# Security

- OAuth Authentication
- JWT Bearer Authentication
- HTTPS Only
- Input Validation
- Exception Handling
- Service Layer Isolation

---

# Future Enhancements

- Refresh Tokens
- Role-Based Authorization
- Permission-Based Authorization
- API Versioning
- OpenAPI / Swagger
- Rate Limiting
- Audit Logging
- Distributed Tracing
- Health Monitoring

---

# Solution Architecture

```text
Angular 20
     │
     ▼
LogiVis.WebApi
     │
Authentication
JWT
Authorization
Business Orchestration
     │
     ▼
logivis-data-worker
     │
Repositories
Cloudflare D1
```

---

# Philosophy

LogiVis.WebApi is intentionally designed as a lightweight application layer.

Its responsibility is to authenticate users, enforce security, orchestrate business workflows, and expose REST APIs to client applications. All data persistence and database interactions are delegated to the `logivis-data-worker`, providing a clear separation between application logic and data access.

This architecture improves maintainability, scalability, and enables independent evolution of the application and data services.