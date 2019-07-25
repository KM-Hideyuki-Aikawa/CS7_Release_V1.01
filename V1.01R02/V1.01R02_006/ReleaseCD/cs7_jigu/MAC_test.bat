@rem  ===== ここから =====
@echo off
color f2
set LOG=C:\Users\konicaminolta\Desktop\%ComputerName%.csv 
set file=C:\Users\konicaminolta\Desktop\testfile
@echo --------------------------------------------------
@echo コンピュータ名とMACアドレスをCSVファイルに
@echo 取り出し、書込み試験用ダミーファイルを作成します。
@echo --------------------------------------------------
for /f "delims=: " %%b in ('hostname') do set HOST=%%b
for /f "delims=: " %%b in ('getmac /nh') do set MAC=%%b
@echo Host Name, %HOST%>%LOG%
@echo MAC Address, %MAC%>>%LOG%
fsutil file createnew %file% 1073741824
@echo 何かキーを押すと終了します...
pause > NUL
@rem  ===== ここまで =====
