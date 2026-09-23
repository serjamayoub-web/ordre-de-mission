@echo off
REM ---------------------------------------------------------------------------
REM  Lanceur avec fenetre de console : utile pour diagnostiquer un probleme.
REM ---------------------------------------------------------------------------
title Ordres de mission - service local
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0serveur\server.ps1"
echo.
echo Le service est arrete. Appuyez sur une touche pour fermer cette fenetre.
pause > nul
