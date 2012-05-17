powercfg -change "Always On" -monitor-timeout-ac 0
powercfg -change "Always On" -disk-timeout-ac 0
powercfg -change "Always On" -standby-timeout-ac 0
powercfg -change "Always On" -hibernate-timeout-ac 0
powercfg -hibernate off
powercfg -setactive "Always On"