# LogiVis.UI

## Overview

**LogiVis.UI** is the frontend web application of the LogiVis platform built with **Angular 20**. It provides a modern, responsive, and interactive user interface for managing logistics operations, monitoring shipment activities, and visualizing operational data.

The application communicates exclusively with **LogiVis.WebApi**, which serves as the platform's API Gateway. The frontend never communicates directly with Cloudflare D1, Lark Base, or backend worker services.

---

# Architecture

```text
                 User
                  │
                  ▼
          LogiVis.UI (Angular)
                  │
          HTTPS / JWT Bearer
                  │
                  ▼
           LogiVis.WebApi
                  │
        ┌─────────┴─────────┐
        ▼                   ▼
logivis-data-worker   logivis-worker
        │                   │
        ▼                   ▼
 Cloudflare D1          Lark Base
```

---

# Responsibilities

The frontend is responsible for:

- User Authentication
- Session Management
- Dashboard Visualization
- Shipment Monitoring
- Route Visualization
- Reports
- Search and Filtering
- Data Presentation
- User Management
- Company Management
- Role Management
- Permission-Based User Interface
- Responsive User Interface
- User Experience

---

# Not Responsible For

The following responsibilities belong to backend services.

## LogiVis.WebApi

- OAuth Authentication
- JWT Generation
- API Gateway
- Business Workflow
- Backend Authorization Enforcement
- External Service Orchestration

## logivis-data-worker

- Cloudflare D1 Access
- Database CRUD Operations
- SQL Execution
- User Management
- Role Management
- Permission Retrieval

## logivis-worker

- Lark Base Integration
- External Service Integration
- Data Synchronization

---

# Technology Stack

| Technology | Description |
|------------|-------------|
| Angular | 20 |
| TypeScript | Latest |
| Angular Router | Client-side Routing |
| Angular Signals | Application State Management |
| RxJS | Reactive Programming |
| HTTP Interceptor | JWT Authentication |
| Route Guards | Route Authorization |
| SCSS | Styling |
| REST API | Backend Communication |

---

# Project Structure

```text
src
│
├── app
│   ├── core
│   ├── shared
│   ├── layouts
│   ├── pages
│   ├── features
│   ├── services
│   ├── guards
│   ├── interceptors
│   ├── models
│   └── components
│
├── assets
├── environments
└── styles
```

---

# Authentication & Session Flow

```text
User
 │
 ▼
Google / Lark OAuth
 │
 ▼
LogiVis.WebApi
 │
Generate JWT
 │
 ▼
Angular
 │
Store JWT
 │
 ▼
Application Startup
 │
 ▼
Validate JWT
 │
 ▼
Load Current User
 │
 ▼
Validate Account Status
 │
 ▼
Validate Permissions
 │
 ▼
Authenticated Session
```

---

# Authorization Flow

```text
JWT
 │
 ▼
Identity Verified
 │
 ▼
Load Current User
 │
 ▼
Status == Active ?
 │
 ├── No
 │      ▼
 │   Logout
 │
 ▼
Permissions Available ?
 │
 ├── No
 │      ▼
 │   Logout
 │
 ▼
Access Granted
```

---

# Request Flow

```text
Angular
    │
HTTP Request
    │
    ▼
HTTP Interceptor
    │
Attach JWT Bearer Token
    │
    ▼
LogiVis.WebApi
    │
    ├────────────► logivis-data-worker
    │
    └────────────► logivis-worker
```

All authenticated requests automatically include the JWT Bearer token.

The frontend communicates exclusively with **LogiVis.WebApi**, ensuring backend communication remains centralized and secure.

---

# Session Management

The application maintains authenticated sessions using JWT Bearer tokens.

During application startup:

1. Detect an existing JWT.
2. Validate the JWT structure.
3. Validate token expiration.
4. Load the latest user profile.
5. Verify account status.
6. Verify assigned permissions.
7. Restore the authenticated session.

If any validation fails, the user is automatically signed out.

---

# Features

## Authentication

- Google OAuth Login
- Lark OAuth Login
- JWT Session Management
- Automatic Session Restoration
- Logout
- Authentication Error Handling

---

## Dashboard

- Operational Overview
- KPI Cards
- Shipment Statistics
- Summary Reports

---

## Shipment Management

- Shipment List
- Shipment Details
- Shipment Tracking
- Delivery Status

---

## Fleet Monitoring

- Vehicle Monitoring
- Driver Information
- Route Status

---

## Administration

- Company Management
- User Management
- Role Management
- Permission Management

---

## Reporting

- Operational Reports
- Export Functions
- Analytics Dashboard

---

## User Experience

- Responsive Layout
- Permission-Based Navigation
- Permission-Based Dashboard
- Notification-Based Error Handling

---

# Security

The application implements JWT Bearer Authentication together with permission-based authorization.

## Authentication

- Google OAuth
- Lark OAuth
- JWT Bearer Tokens
- Automatic Session Restoration

## Authorization

Authorization is validated using the latest user information retrieved from backend services.

The frontend validates:

- Account Status
- Assigned Permissions

Users without valid permissions cannot access secured application features.

---

# Security Flow

```text
                 User
                  │
                  ▼
         Google / Lark OAuth
                  │
                  ▼
          LogiVis.WebApi
                  │
          Generate JWT
                  │
                  ▼
             LogiVis.UI
                  │
          Store JWT Securely
                  │
                  ▼
      Application Initialization
                  │
         Validate Local JWT
                  │
                  ▼
       Retrieve Current User
                  │
                  ▼
   Validate Status & Permissions
                  │
                  ▼
         Authenticated Session
```

---

# Design Principles

- Component-Based Architecture
- Standalone Components
- Angular Signals for Local State Management
- Lazy Loading
- Strong Typing
- Modular Development
- Separation of Concerns
- Permission-Based UI Rendering
- Backend-Driven Authorization
- Responsive Design
- Reusable UI Components

---

# Future Enhancements

Planned improvements include:

- Dark Mode
- Multi-language Support
- Real-time Dashboard Updates
- Push Notifications
- Advanced Analytics
- Offline Support
- Progressive Web App (PWA)
- Theme Customization
- Dashboard Personalization

---

# Solution Architecture

```text
                 Angular 20
                      │
                      ▼
              LogiVis.WebApi
                      │
        ┌─────────────┴─────────────┐
        ▼                           ▼
 logivis-data-worker          logivis-worker
        │                           │
        ▼                           ▼
 Cloudflare D1                 Lark Base
```

---

# Philosophy

**LogiVis.UI** is designed as a lightweight presentation layer that remains independent of backend implementation details.

The application communicates exclusively with **LogiVis.WebApi**, which serves as the single entry point for all backend services. Authentication is performed using JWT Bearer tokens, while authorization is validated using the latest user profile retrieved from backend services.

This approach allows administrators to immediately enforce permission changes without waiting for JWT expiration while keeping the frontend decoupled from data storage and external integrations.

The architecture promotes maintainability, scalability, security, and a clear separation of responsibilities across the LogiVis platform.
