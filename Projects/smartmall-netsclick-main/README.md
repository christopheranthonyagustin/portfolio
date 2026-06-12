# NETS Click Employee Benefits & Digital Commerce Platform (SmartMall)

## Overview

This project is a Flutter-based integration of the NETS Click payment platform, developed as part of the SmartMall digital commerce ecosystem. The application enables secure payment processing through NETS Click while integrating with backend merchant and organization management services.

The solution leverages the NETS Online Framework SDK (NOFSDK) and supports both Android and iOS platforms.

---

## Technology Stack

### Mobile Application

* Flutter 3.13.7
* Android
* iOS

### NETS SDK Versions

| Platform | Version |
| -------- | ------- |
| Android  | 1.9.0   |
| iOS      | 1.12.0  |

SDK versions current as of 15 October 2023.

---

## Key Features

* NETS Click payment integration
* Secure payment tokenization
* Merchant onboarding support
* Mobile payment processing
* Backend API integration
* Android and iOS support
* Secure certificate and key management

---

## Project Configuration

Before deployment, the following project-specific configurations must be updated:

### Application Configuration

1. Update the application bundle identifier.
2. Configure Android signing credentials.
3. Configure iOS signing credentials.
4. Update NETS SDK configuration parameters.
5. Configure backend API credentials.
6. Configure merchant and organization identifiers.

### Android Configuration

Required updates:

```text
android/app/build.gradle
android/app/local.properties
android/app/src/release/
android/app/src/debug/
android/app/src/main/kotlin/.../CommonFunction.kt
```

Required assets:

* Android vKeys
* Application keystore (.keystore/.jks)
* CA certificate

### iOS Configuration

Required updates:

```text
ios/Runner/AppDelegate.swift
ios/Runner/Assets/
```

Required assets:

* iOS vKeys

### Application Secrets

Update:

```text
lib/constants.dart
lib/secret.dart
```

Required values:

* Project ID
* API Key
* Organization ID
* Merchant ID
* NETS Credentials

---

## Required Merchant Information

The following information is required from the merchant:

* Bundle Identifier
* Android Keystore (.keystore or .jks)
* Keystore Alias
* Keystore Password

---

## Required NETS Configuration

The following credentials and assets must be provided by NETS:

### SDK Keys

* Android vKeys
* iOS vKeys

### NETS Identifiers

* HPP_ISSUER_ID
* HPP_ISSUER_ID_UOB
* HPP_ISSUER_ID_OCBC
* APPLICATION_ID
* APP_SECRET

### Public Keys

* MAP_PUBLIC_KEY_ID

* MAP_PUBLIC_KEY_EXPONENT

* MAP_PUBLIC_KEY_MODULUS

* HPP_PUBLIC_KEY_ID

* HPP_PUBLIC_KEY_EXPONENT

* HPP_PUBLIC_KEY_MODULUS

### Certificates

* ca.crt

Location:

```text
android/app/src/main/res/raw/
```

---

## Required Backend Configuration

The following values are required from the backend system:

### Project Information

* Project ID
* API Key

### Organization Information

* Organization ID

### Merchant Information

* Merchant ID
* MID
* TID
* MUID (Consumer ID)

---

## Business Context

This application was developed as part of the SmartMall employee benefits and digital commerce ecosystem supporting NETS Click. The platform integrates digital commerce, payment processing, merchant management, and backend services to provide a seamless purchasing experience across multiple sales channels.

---

## Disclaimer

Sensitive credentials, certificates, API keys, merchant identifiers, and NETS-issued security assets are not included in this repository and must be provisioned separately through authorized channels.
