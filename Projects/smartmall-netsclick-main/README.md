# NETS Click Sample App baseline
Stand-alone NETS Click Function

## Latest NOFSDK versions (As at 15 Oct 2023):
Android: 1.9.0

IOS: 1.12.0

Current flutter version: 3.13.7

## To Get Started
1. Refactor rename.bundle.name to the desired bundle id (use ctrl+shirt+r for your convenience)
2. Replace Android vKeys in .../android/app/src/release & .../debug folders
3. Replace IOS vKeys in .../ios/Runner/Asset folder
4. Place keystore in .../android/app folder and reconfigure the name & password in .../android/app/build.gradle and local.properties
5. Adjust .../android/app/src/main/kotlin/[rename/bundle/name]/CommonFunction.kt to the correct NOFSDK credentials
6. Adjust .../ios/Runner/AppDelegate.swift to the correct NOFSDK credentials
7. Adjust constants.dart according to the project credentials.
8. Adjust secret.dart according to the project project id and api-key


## Files/Details needed from merchant
- Bundle Id
- .keystore/.jks file, with keystore alias name & password

## Files/Details needed from NETS
- Android vKeys
- IOS vKeys
- HPP_ISSUER_ID, HPP_ISSUER_ID_UOB, HPP_ISSUER_ID_OCBC
- APPLICATION_ID
- APP_SECRET
- MAP_PUBLIC_KEY_ID, MAP_PUBLIC_KEY_EXPONENT, MAP_PUBLIC_KEY_MODULUS
- HPP_PUBLIC_KEY_ID, HPP_PUBLIC_KEY_EXPONENT, HPP_PUBLIC_KEY_MODULUS
- ca.crt (in .../android/app/src/main/res/raw/)

## Files/Details needed from BevEat backend
- Api key (in beveat entity_project table, project_key_value)
- Project id (in beveat entity_project table, project_id)
- Org Id (in beveat entity_organisation table, org_id)
- Merchant id (in beveat entity_merchant table, merchant_id)
- MID & TID (in beveat entity_merchant table, merchant_mid_nets_click & merchant_tid_nets_click)
- MUID (or Consumer Id, in merchant dB)
