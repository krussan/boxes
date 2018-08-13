#!/bin/bash

#tools
#platform-tools
#platform-tools-preview
#android-23
#addon-google_apis-google-23

#These are indicated by installation of android studio
#extra-android-m2repository,

while read p; do /vagrant_common/android-accept-license.sh "/opt/android-sdk-linux/tools/bin/sdkmanager ${p}";done < /vagrant_common/android_packages
