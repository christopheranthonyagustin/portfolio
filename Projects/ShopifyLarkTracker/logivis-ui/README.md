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

# Core Capabilities

- Operations Dashboard
- Shipment Monitoring
- Delivery Order Verification
- Shopify Order Comparison
- Courier Integration
- Delivery Cost Estimation
- Shipment History
- Operational Analytics
- Export & Reporting
- Role-Based Access Control

# Responsibilities

The frontend is responsible for:

- User Authentication
- Session Management
- Operational Dashboard
- Shipment Monitoring
- Shipment Verification
- Delivery Order Verification
- Delivery Cost Estimation
- Shipment Comparison (Shopify vs Courier)
- Operational KPIs
- Route Visualization
- Search and Filtering
- Reports and Export
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
- Shipment KPIs
- Courier Distribution
- Shipment Status Distribution
- Delivery Performance
- Operational Alerts
- Export Dashboard

---

## Shipment Management

- Shipment List
- Shipment Search
- Shipment Details
- Shipment Verification
- Shipment History
- Shipment Tracking
- Courier Information
- Delivery Status Monitoring

---

## Delivery Order Management

- Delivery Order Verification
- Customer Verification
- Receiver Verification
- Product Verification
- Shopify vs Courier Comparison
- Delivery Cost Estimation
- Delivery Order Creation
- Delivery Order Validation

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

- Shipment Export
- Operational Reports
- Courier Performance
- Delivery Analytics
- Shipment Audit

---

## User Experience

- Responsive Layout
- Permission-Based Navigation
- Permission-Based Dashboard
- Notification-Based Error Handling

---

## Design Principles

- Operations-First User Experience
- Data Verification Before Action
- Single Source of Truth Through API Gateway
- Progressive Feature Integration

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

- Shopify Order Comparison
- Delivery Cost Estimation
- Delivery Order Creation
- Multi-Courier Integration
- Real-Time Shipment Tracking
- AI-Powered Operational Insights
- Predictive Delivery Analytics
- Dark Mode
- Push Notifications
- Progressive Web App (PWA)

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

LogiVis.UI is designed as an operations platform rather than a traditional shipment tracking application.

The system enables Operations teams to monitor shipments, verify delivery information, compare order data across multiple systems, and make informed decisions before delivery orders are created.

By centralizing operational information into a single interface, LogiVis reduces manual verification effort, improves shipment visibility, and minimizes costly delivery errors.

The frontend communicates exclusively with **LogiVis.WebApi**, ensuring that all business logic, authorization, and external integrations remain centralized within backend services.

This architecture promotes maintainability, scalability, security, and a clear separation of responsibilities while allowing the platform to evolve into a unified logistics operations center.
