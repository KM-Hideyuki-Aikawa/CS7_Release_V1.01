@rem  ===== �������� =====
@echo off
color f2
set LOG=C:\Users\konicaminolta\Desktop\%ComputerName%.csv 
set file=C:\Users\konicaminolta\Desktop\testfile
@echo --------------------------------------------------
@echo �R���s���[�^����MAC�A�h���X��CSV�t�@�C����
@echo ���o���A�����ݎ����p�_�~�[�t�@�C�����쐬���܂��B
@echo --------------------------------------------------
for /f "delims=: " %%b in ('hostname') do set HOST=%%b
for /f "delims=: " %%b in ('getmac /nh') do set MAC=%%b
@echo Host Name, %HOST%>%LOG%
@echo MAC Address, %MAC%>>%LOG%
fsutil file createnew %file% 1073741824
@echo �����L�[�������ƏI�����܂�...
pause > NUL
@rem  ===== �����܂� =====
