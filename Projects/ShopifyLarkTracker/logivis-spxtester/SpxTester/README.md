# SPX Tester

A lightweight .NET console application used to explore, validate, and test the SPX Singapore Integration API before integrating it into the LogiVis platform.

The purpose of this project is to understand the SPX API behaviour, authentication flow, request/response payloads, and performance without affecting the main LogiVis application.

---

# Objectives

- Authenticate with the SPX API
- Validate API credentials
- Test Track Order API
- Capture raw JSON responses
- Understand API error handling
- Measure API response times
- Build reusable knowledge for LogiVis integration

---

# Scope

This project is intended for API exploration only.

It is **NOT** responsible for:

- Business logic
- Shipment dashboard
- Database persistence
- Angular UI
- Repository implementation
- LogiVis domain models

---

# Technology Stack

- .NET 9 Console Application
- C#
- HttpClient
- System.Text.Json

---

# Project Structure

```
SpxTester
│
├── Docs
│   └── SPX-Notes.md
│
├── Models
│
├── Samples
│   ├── auth-success.json
│   ├── track-success.json
│   ├── track-error.json
│   └── track-delivered.json
│
├── Services
│   └── SpxClient.cs
│
├── Program.cs
│
└── README.md
```

---

# Development Roadmap

## Phase 1 - Authentication

Goal

- Authenticate successfully
- Retrieve access token
- Understand authentication mechanism
- Verify token expiration

Deliverables

- Authentication request
- Authentication response
- Sample JSON

---

## Phase 2 - Track Order

Goal

- Retrieve shipment information
- Test multiple tracking numbers
- Capture successful and failed responses

Deliverables

- Raw JSON response
- Response time
- Status code
- Error messages

---

## Phase 3 - API Analysis

Goal

Understand:

- Response schema
- Status mapping
- Timestamp formats
- Batch support
- Rate limits
- Error handling

---

## Phase 4 - LogiVis Integration

Once the API behaviour is fully understood:

```
Angular

↓

Cloudflare Worker

↓

Shipment Service

↓

IShipmentProvider

↓

SPX Provider

↓

SPX API
```

The Angular application should never communicate directly with the SPX API.

---

# Testing Strategy

During development:

- Log every HTTP request
- Log every HTTP response
- Save sample payloads
- Keep raw JSON before deserialization
- Measure API performance

---

# Logging Example

```
=========================================
AUTHENTICATION REQUEST
=========================================

POST /...

Headers

Body

=========================================
AUTHENTICATION RESPONSE
=========================================

Status Code

Headers

Body

Elapsed Time
```

```
=========================================
TRACK ORDER REQUEST
=========================================

Tracking Number

=========================================
TRACK ORDER RESPONSE
=========================================

Status Code

Headers

Body

Elapsed Time
```

---

# Sample Files

The following sample responses should be preserved for future reference and unit testing.

```
Samples/

auth-success.json

track-success.json

track-delivered.json

track-error.json
```

---

# Notes

This project intentionally keeps the implementation simple.

The objective is to understand the SPX API before introducing abstraction, business logic, or repository patterns.

Once the integration is validated, the knowledge gained from this project will be incorporated into the LogiVis platform through a dedicated SPX provider implementation.

---

# Author

Christopher Anthony Agustin

```
Project: SPX Tester
Purpose: SPX Singapore API Validation
Target Platform: LogiVis
```