#!/bin/sh

#tools
#platform-tools
#platform-tools-preview
#android-23
#addon-google_apis-google-23

#These are indicated by installation of android studio
#extra-android-m2repository,

#(while sleep 3; do echo "Y"; done) | /opt/android-sdk-linux/tools/bin/sdkmanager --package_file=/vagrant_common/android_packages
./android-accept-license.sh "/opt/android-sdk-linux/tools/bin/sdkmanager --package_file=/vagrant_common/android_packages"
