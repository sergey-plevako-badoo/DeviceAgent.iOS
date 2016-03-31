#!/usr/bin/env bash

bin/deps.sh

SIM_ID=$(instruments -w devices 2>&1 | grep "iPhone 6 (9.0)" | \
           cut -d[ -f2 | cut -d] -f1)                                                                                                       
                                                                                                                                            
echo "Testing on $SIM_ID"                                                                                                                   
xcodebuild test -project xcuitest-server/xcuitest-server.xcodeproj \
           -scheme xcuitest-serverUITests -destination id=$SIM_ID &
curl -X POST http://127.0.0.1:27753/shutdown                                                                   
sleep 5                                                                                                                                     
                                                                                                                                            
for ((i=1;i<=5;i++)); do                                                                                                                    
  ALIVE=$(curl http://127.0.0.1:27753/health)                                                                                               
                                                                                                                                            
  echo $ALIVE                                                                                                                               
                                                                                                                                            
  if [ "$ALIVE" != "" ]; then                                                                                                               
    break                                                                                                                                   
  fi                                                                                                                                        
  sleep 5                                                                                                                                   
done                                                                                                                                        
                                                                                                                                            
python ./pycalabash/test_script.py 