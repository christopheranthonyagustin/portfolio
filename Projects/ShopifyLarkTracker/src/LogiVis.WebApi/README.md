# LogiVis.WebApi

## Overview

**LogiVis.WebApi** is the primary application API for the LogiVis platform. It is responsible for authentication, authorization, API orchestration, and secure communication between the frontend and backend services.

Unlike traditional ASP.NET applications, **LogiVis.WebApi does not directly access the database**. All database operations are delegated to the **logivis-data-worker**, which communicates with Cloudflare D1.

This architecture keeps the Web API lightweight, secure, and focused on authentication, authorization, business orchestration, and application workflows.

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
- Role-Based Authorization
- Permission-Based Authorization
- Business Workflow Orchestration
- API Gateway
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

```text
LogiVis.WebApi
│
├── Controllers
├── Services
├── Models
├── DTOs
├── Configuration
├── Authentication
├── Authorization
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
Return User + Role
    ▼
LogiVis.WebApi
    │
Generate JWT
    │
Redirect to Angular
```

---

# Authentication

LogiVis supports OAuth authentication providers.

Current providers:

- Google
- Lark

After successful authentication, the authenticated user is validated through **logivis-data-worker** before a JWT access token is generated.

The Web API remains the single authority responsible for issuing JWT tokens.

---

# JWT Claims

Current JWT claims include:

- Subject (UserId)
- Email
- JWT ID (JTI)
- Role
- Super User Flag

Additional claims may be added in future releases as business requirements evolve.

---

# Authorization

## Overview

LogiVis implements a **Role-Based Access Control (RBAC)** model.

The authorization model is intentionally designed to remain **simple and fixed** during the early stages of the platform.

Instead of allowing administrators to build custom roles or customize permissions, LogiVis provides predefined roles with predefined permissions maintained by the development team.

This approach minimizes implementation complexity while providing sufficient security for current business operations.

---

# Authorization Architecture

```text
                 User
                   │
                   ▼
            Authentication
                   │
                   ▼
                 User
                   │
             Assigned Role
                   │
                   ▼
         Predefined Permissions
                   │
                   ▼
      PermissionService
                   │
                   ▼
      Protected API Endpoints
```

---

# Design Principles

The authorization model follows these principles.

- Authentication identifies the user.
- Roles determine access level.
- Permissions are predefined.
- Customer administrators cannot customize permissions.
- Authorization logic remains within the application.
- Permission assignments are version-controlled through database seed scripts.

---

# Roles

The system ships with predefined roles.

| Code | Name | Description |
|------|------|-------------|
| SUPER_USER | Super User | Internal LogiVis administrator |
| ADMIN | Administrator | Customer administrator |
| MANAGER | Operations Manager |
| OPERATOR | Operator |
| VIEWER | Viewer |
| 3PL | Third-Party Logistics |

Although multiple roles exist, only **Super User** and **Administrator** currently provide distinct authorization behavior.

The remaining roles are reserved for future expansion.

---

# Super User

The Super User account is reserved for the LogiVis platform owner.

Responsibilities include:

- System Administration
- Initial Company Setup
- User Provisioning
- System Maintenance
- Platform Configuration
- Future Infrastructure Management

This role is not intended for customer organizations.

---

# Administrator

Administrator is the primary operational role for customer organizations.

Responsibilities include:

- Daily Operations
- Dashboard
- Delivery Orders
- Shipment Management
- Reports
- Courier Operations

Administrative system configuration remains restricted to the Super User.

---

# Permission Strategy

Permissions are predefined and maintained by the development team.

Examples include:

```text
DASHBOARD.READ

SHIPMENTS.READ
SHIPMENTS.CREATE
SHIPMENTS.UPDATE

USERS.READ
USERS.CREATE
USERS.UPDATE

REPORTS.READ

SETTINGS.READ
```

Permissions are assigned to roles through database seed scripts.

No runtime permission editing is supported.

---

# Administration Module

Although permissions remain fixed, LogiVis provides administration pages for operational convenience.

## Users

Purpose

- Create User
- Update User
- Activate User
- Deactivate User
- Assign Role

Supported Operations

- GET
- POST
- PUT
- PATCH

---

## Roles

Purpose

Provide visibility into available system roles.

Editable Fields

- Name
- Description

Not Supported

- Create Role
- Delete Role
- Modify Permissions

The predefined roles remain managed through seed scripts.

---

## Permissions

Purpose

Display all available system permissions.

Supported Operations

- GET

Permissions cannot be modified through the application.

---

## Role Permissions

Purpose

Display the permissions assigned to each predefined role.

This page is intended for administration, troubleshooting, auditing, and documentation.

Supported Operations

- GET

The page is read-only.

No editing of role-permission assignments is supported.

---

# Communication

## Frontend

Angular 20

Protocol

- HTTPS

Authentication

- JWT Bearer Token

---

## Backend

logivis-data-worker

Protocol

- Internal REST API

Authentication

- Service-to-Service

---

# Security

- OAuth Authentication
- JWT Bearer Authentication
- Role-Based Authorization
- Permission-Based Authorization
- HTTPS Only
- Input Validation
- Exception Handling
- Service Layer Isolation

---

# Future Enhancements

- Refresh Tokens
- API Versioning
- OpenAPI / Swagger
- Rate Limiting
- Audit Logging
- Distributed Tracing
- Health Monitoring

Future RBAC enhancements may include:

- Custom Roles
- Customer-defined Permissions
- Permission Groups
- Company-specific Roles
- Permission Templates
- Permission Inheritance

These enhancements will only be introduced when justified by product maturity and customer requirements.

---

# Solution Architecture

```text
Angular 20
     │
     ▼
LogiVis.WebApi
     │
Authentication
Authorization
JWT
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

Its responsibilities include:

- Authentication
- Authorization
- JWT Token Management
- Business Workflow Orchestration
- API Exposure
- Security Enforcement

All persistence responsibilities are delegated to **logivis-data-worker**, providing a clear separation between application logic and data access.

The authorization model intentionally favors **simplicity over flexibility**. Roles and permissions are predefined and version-controlled rather than customer-configurable. This allows development to remain focused on the core logistics capabilities—such as Delivery Orders, courier integrations, shipment tracking, and operational workflows—while still providing a secure and maintainable access-control model.


/docs
│
├── 01. Vision
│   ├── Vision.md
│   ├── Roadmap.md
│   └── Milestones.md
│
├── 02. Architecture
│   ├── System-Architecture.md
│   ├── Multi-Application.md
│   ├── Authentication.md
│   ├── Authorization-RBAC.md
│   ├── Company-Integration.md
│   ├── Security.md
│   ├── Audit-Logging.md
│   └── Notifications.md
│
├── 03. Database
│   ├── Database-Overview.md
│   ├── Tables.md
│   ├── Relationships.md
│   └── Migration-History.md
│
├── 04. API
│   ├── LogiVis.WebApi.md
│   ├── logivis-data-worker.md
│   ├── Authentication-API.md
│   ├── User-API.md
│   ├── Shipment-API.md
│   └── Integration-API.md
│
├── 05. UI
│   ├── Dashboard.md
│   ├── User-Management.md
│   ├── Shipments.md
│   ├── Companies.md
│   ├── Responsive-Standards.md
│   └── UI-Standards.md
│
├── 06. Security
│   ├── Encryption.md
│   ├── Secrets-Management.md
│   ├── Data-Privacy.md
│   ├── Production-Hardening.md
│   └── Compliance.md
│
├── 07. Development
│   ├── Coding-Standards.md
│   ├── Naming-Conventions.md
│   ├── Git-Workflow.md
│   ├── Release-Process.md
│   └── Deployment.md
│
├── 08. ADR
│   ├── ADR-001-WebApi-Architecture.md
│   ├── ADR-002-RBAC.md
│   ├── ADR-003-Company-Integration.md
│   ├── ADR-004-Encryption.md
│   └── ADR-005-Multi-Application.md
│
├── 09. Sprint
│   ├── Sprint-001.md
│   ├── Sprint-002.md
│   ├── Sprint-003.md
│   └── Backlog.md
│
└── 10. Release
    ├── v1.0.md
    ├── v1.1.md
    └── Changelog.md