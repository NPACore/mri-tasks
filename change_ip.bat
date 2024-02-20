
@echo ====
@echo CHANGE IP: upmc or eyelink
@echo ====

; name of network in "Network Connections"
; at MRRC "Local Area Network". for Jones laptop="Ethernet"
@set INTERFACE="Ethernet"

:getchoice
 @set /p choice="[avotec,eyelink] "
 @if NOT "%choice%"  == "avotec" if NOT "%choice%" == "eyelink" goto getchoice
 @goto %choice%


:avotec
 set IP=10.48.88.121
 set GW=10.48.88.1
 goto setconnect

:eyelink
 set IP=100.1.1.2
 set GW=100.1.1.1
 goto setconnect


:setconnect
 set MASK=255.255.255.0
 netsh interface ip set address "%INTERFACE%" static %IP% %MASK% %GW% 1

 netsh int ip show config "%INTERFACE%"
 pause
