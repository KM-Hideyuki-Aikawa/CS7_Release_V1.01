@echo off
@rem
@echo [Register certification]
@rem

certmgr -add -c UniteaCertKey.cer -s -r localMachine root
certmgr -add -c UniteaCertKey.cer -s -r localMachine TrustedPublisher

certmgr -add -c cacert.pem -s -r  localMachine root
@rem certmgr -add -c cacert.pem -s -r  localMachine TrustedPublisher


