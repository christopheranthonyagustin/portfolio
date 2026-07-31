# LogiVis.API

## Overview

**LogiVis.API** is the integration service of the LogiVis platform. It is responsible for synchronizing data between external business systems and **Lark Base**, serving as the platform's integration engine.

Currently implemented as a **.NET Console Application**, it performs scheduled and on-demand synchronization tasks by retrieving data from external platforms, transforming it into a common format, and updating records in Lark Base.

The project is designed to evolve into a background service or worker process as the platform grows.

---

# Architecture

```text
                    Shopify
                       │
                       │
                    REST API
                       │
                       ▼
                  LogiVis.API
               Integration Engine
                       │
      ┌────────────────┼────────────────┐
      ▼                ▼                ▼
 Data Mapping    Business Rules     Validation
                       │
                       ▼
                 Lark Open API
                       │
                       ▼
                  Lark Base
```

---

# Responsibilities

The application is responsible for:

- Shopify Integration
- Marketplace Integration
- Order Synchronization
- Customer Synchronization
- Product Synchronization
- Shipment Synchronization
- Inventory Synchronization
- Data Transformation
- Lark Base Updates
- API Authentication
- Synchronization Logging
- Error Handling

---

# Not Responsible For

The following responsibilities belong to other services.

### LogiVis.WebApi

- Authentication
- Authorization
- OAuth
- JWT
- API Gateway

### logivis-data-worker

- Cloudflare D1
- User Management
- Database CRUD Operations
- Repository Layer

### logivis-worker

- Retrieving operational data from Lark Base for frontend dashboards

---

# Technology Stack

| Technology | Description |
|------------|-------------|
| .NET | Console Application |
| C# | Latest |
| REST API | External Integrations |
| Shopify Admin API | E-commerce Integration |
| Lark Open API | Data Synchronization |

---

# Project Structure

```text
LogiVis.API
│
├── Services
├── Models
├── DTOs
├── Integrations
│   ├── Shopify
│   ├── Lark
│   └── Logistics
├── Utilities
├── Configuration
├── Extensions
└── Program.cs
```

---

# Synchronization Flow

```text
Shopify
     │
Retrieve Orders
     │
     ▼
LogiVis.API
     │
Validate
     │
Transform
     │
Business Rules
     │
     ▼
Lark Open API
     │
     ▼
Lark Base
```

---

# Data Processing Pipeline

```text
External API
      │
      ▼
Authentication
      │
      ▼
Retrieve Data
      │
      ▼
Transform Data
      │
      ▼
Validate
      │
      ▼
Update Lark Base
      │
      ▼
Log Result
```

---

# Current Integrations

## Shopify

Current integration includes:

- Orders
- Customers
- Products
- Fulfillments
- Inventory

---

## Lark Base

Current integration includes:

- Record Retrieval
- Record Creation
- Record Updates
- Batch Operations

---

# Design Principles

- Separation of Concerns
- Modular Integrations
- Reusable Services
- Strong Typing
- Stateless Processing
- API-First Design
- Extensible Architecture

---

# Error Handling

The application implements:

- API Error Handling
- Validation
- Retry Logic
- Synchronization Logging
- Exception Management

---

# Future Enhancements

Planned improvements include:

- Windows Service / Worker Service
- Scheduled Synchronization
- Queue Processing
- Parallel Synchronization
- Marketplace Connectors
- Logistics Connectors
- Monitoring Dashboard
- Health Checks
- Distributed Logging

---

# Solution Architecture

```text
                 Shopify
                 Shopee
                 Lazada
              Logistics APIs
                     │
                     ▼
                LogiVis.API
             Integration Engine
                     │
                     ▼
                Lark Open API
                     │
                     ▼
                 Lark Base
```

---

# Philosophy

**LogiVis.API** is the integration engine of the LogiVis platform.

Its primary responsibility is to connect external business systems with Lark Base by retrieving, transforming, validating, and synchronizing operational data. By isolating integration logic into a dedicated application, the platform maintains a clear separation between external system integrations, business services, and data persistence.

Although currently implemented as a **.NET Console Application**, the architecture is designed to support future migration to a long-running background service or worker process with minimal changes.