#!/bin/sh

#tools
#platform-tools
#platform-tools-preview
#android-23
#addon-google_apis-google-23

(while sleep 3; do echo "y"; done) | android update sdk -u -t tools,platform-tools-preview,android-23,addon-google_apis-google-23