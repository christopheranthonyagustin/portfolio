# Order Management System (OMS) – Shipment Tracking & Logistics Integration Module

## Project Overview

This project is a logistics and shipment tracking module developed as part of an Order Management System (OMS) ecosystem.

The module integrates Shopify, logistics providers, and operational dashboards to provide centralized visibility of order fulfillment, shipment tracking, exception management, and delivery status monitoring.

The solution automates the synchronization of order and fulfillment information from e-commerce channels into a centralized operations platform, eliminating manual tracking activities and improving operational efficiency.

---

## Business Context

As part of the OMS platform, operations teams required a mechanism to:

* Monitor order fulfillment status
* Track shipment creation and AWB assignment
* Identify orders without tracking numbers
* Centralize logistics visibility
* Support customer service inquiries
* Reduce manual reconciliation between systems

The solution was designed to provide near real-time shipment visibility while supporting future integration with logistics partners such as SPX Express.

---

## OMS Architecture

```text
Sales Channels
(Shopify, Marketplaces, POS)
            ↓
Order Management System (OMS)
            ↓
Shipment Tracking Module
            ↓
Logistics Providers
(SPX, J&T, Others)
            ↓
Operations Dashboard (Lark Base)
```

---

## Current Integration Flow

```text
Shopify
    ↓
Fulfillment Data
    ↓
.NET Integration Service
    ↓
Business Rules Engine
    ↓
Lark Base Dashboard
```

### Data Synchronized

* Shopify Order ID
* Order Number
* Customer Name
* Sales Channel
* Tracking Number (AWB)
* Fulfillment Date
* Shipment Status
* Courier Information
* Exception Indicators

---

## Key OMS Capabilities

### Order Synchronization

Retrieves order information from Shopify and synchronizes:

* Order metadata
* Customer details
* Fulfillment status
* Shipment information

### Shipment Visibility

Captures:

* Tracking numbers
* Courier assignment
* Fulfillment dates
* Shipment lifecycle information

### Logistics Integration

Supports logistics identification based on tracking number patterns:

| Prefix | Courier     |
| ------ | ----------- |
| SPX    | SPX Express |
| SP     | SPX Express |
| JT     | J&T Express |
| Others | Unknown     |

### Exception Management

Business rules automatically identify:

* Missing AWBs
* Unfulfilled orders
* Unknown couriers
* Shipment anomalies

Exception records are highlighted for operational follow-up.

### Multi-Channel Order Support

Supports orders originating from:

* Shopify Online Store
* Point of Sale (POS)
* Marketplaces
* Future e-commerce channels

---

## Technical Architecture

### Core Components

#### Shopify Integration Layer

Responsible for:

* Order retrieval
* Fulfillment synchronization
* Incremental updates

#### Shipment Processing Engine

Responsible for:

* Data transformation
* Business rule execution
* Exception handling
* Courier determination

#### Lark Integration Layer

Responsible for:

* Dashboard updates
* Record creation
* Record synchronization

---

## Performance Optimization

Several optimization initiatives were implemented:

### Incremental Synchronization

Uses:

```text
updated_at_min
```

to retrieve only changed orders.

### Record Indexing

Introduced dictionary-based lookups to eliminate linear searches.

### Parallel Processing

Implemented concurrent processing using:

```text
SemaphoreSlim
```

to significantly reduce synchronization time.

### API Call Optimization

Removed duplicate Lark API retrievals and consolidated synchronization workflows.

### Results

| Metric           | Before          | After             |
| ---------------- | --------------- | ----------------- |
| Full Sync        | Several Minutes | Seconds           |
| Incremental Sync | N/A             | ~2 Seconds        |
| Record Matching  | Linear Search   | Dictionary Lookup |
| Processing       | Sequential      | Parallel          |

---

## Future Roadmap

### Google Cloud Migration

Current:

```text
Shopify
    ↓
.NET Console Application
    ↓
Lark Base
```

Future:

```text
Shopify
    ↓
Google Cloud Function
    ↓
Lark Base
```

Benefits:

* Serverless deployment
* Lower infrastructure costs
* Improved scalability
* Automated scheduling

### SPX Express Integration

Planned integration with SPX APIs to support:

* Real-time shipment tracking
* Delivery status monitoring
* Proof of Delivery (POD)
* Delivery timestamps
* Failed delivery reasons
* Shipment exception updates

### Event-Driven Architecture

Future state:

```text
Shopify Webhook
       ↓
Cloud Function
       ↓
OMS
       ↓
Lark Dashboard
```

---

## Technologies

### Backend

* C#
* .NET
* REST APIs
* JSON Processing

### Integrations

* Shopify Admin API
* Lark Open Platform API

### Cloud

* Google Cloud Functions (Planned)
* Google Cloud Scheduler (Planned)
* Secret Manager (Planned)

### Tools

* Visual Studio
* Git
* GitHub

---

## Project Management Contributions

As Technical Project Manager and Product Owner, responsibilities included:

* Requirements gathering
* OMS workflow design
* Integration architecture planning
* API evaluation and vendor coordination
* Logistics process mapping
* Data model design
* Performance optimization planning
* Risk and dependency management
* Cloud migration roadmap development

---

## Business Outcome

The Shipment Tracking Module enhanced the OMS platform by providing centralized logistics visibility, automated shipment synchronization, and exception monitoring, creating a scalable foundation for future logistics integrations and real-time delivery tracking.
