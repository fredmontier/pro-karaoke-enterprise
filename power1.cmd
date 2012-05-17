powercfg -change "Home/Office Desk" -monitor-timeout-ac 5
powercfg -change "Home/Office Desk" -disk-timeout-ac 0
powercfg -change "Home/Office Desk" -standby-timeout-ac 0
powercfg -change "Home/Office Desk" -hibernate-timeout-ac 0
powercfg -hibernate off
powercfg -setactive "Home/Office Desk"