@echo off
REM ===========================================================================
REM  Cree un raccourci "Ordres de mission" avec icone dans ce dossier
REM  et sur le Bureau. A executer une seule fois.
REM ===========================================================================
title Ordres de mission - creation du raccourci
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0serveur\raccourci.ps1"
echo.
pause
