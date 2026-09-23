@echo off
REM ===========================================================================
REM  Verifie que le poste dispose de tout ce qu'il faut pour faire
REM  fonctionner l'application, et teste reellement la generation d'un PDF.
REM ===========================================================================
title Ordres de mission - diagnostic
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0serveur\diagnostic.ps1"
