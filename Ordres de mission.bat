@echo off
REM ===========================================================================
REM  Ordres de mission - lanceur principal
REM  Demarre le service local en arriere-plan puis ouvre l'application.
REM  Cette fenetre se referme immediatement.
REM ===========================================================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'powershell.exe' -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','\"%~dp0serveur\server.ps1\"' -WindowStyle Hidden"
exit
