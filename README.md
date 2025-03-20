# Patrol integration test demo
The project is made to try the patrol package capabilities.

## Info

What is in the project?

|                |Feature|Status|
|----------------|-------------------------------|-----------------------------|
|1|Flutter basic UI (asking for permissions buttons and a flag that Wifi is not connected)|✅|
|2|Patrol Android setup|✅|
|3|Patrol IOS setup*|❌ |
|4|Connect to Firebase|✅|
|5|Setup publishing to Firebase test lab|✅|
|6|Patrol simple example (copied from docs)|✅|
|7|Patrol toggle Wifi|✅|
|8|Patrol asking for permissions|⏳|

*can be added later

## Installation

1. Use the [patrol documentation](https://patrol.leancode.co/documentation) to install the patrol cli.
2. (optional) If you want to connect to Firebase Test Lab, read [docs here](https://patrol.leancode.co/documentation/ci/firebase-test-lab).


## Usage

Run the command to run the test:
```bash
patrol test -t integration_test/example_test.dart 
```

Run the command to publish test to Firebase Test Labs
```bash
patrol build android --target integration_test/example_test.dart

gcloud firebase test android run \
    --type instrumentation \
    --use-orchestrator \
    --app build/app/outputs/apk/debug/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --timeout 1m \
    --device model=MediumPhone.arm,version=34,locale=en,orientation=portrait \
    --record-video \
    --environment-variables clearPackageData=true
```


## Contribution / Access

Feel free to use the code anyhow you wish, contact me if you want an access to Firebase console (another option is to create your own project and connect it there)

