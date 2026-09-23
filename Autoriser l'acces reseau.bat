@echo off
REM ===========================================================================
REM  Autorise les telephones et les autres postes du reseau local a se
REM  connecter a l'application. A executer UNE SEULE FOIS.
REM  Une demande d'elevation (administrateur) s'affichera.
REM ===========================================================================
title Ordres de mission - acces reseau
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0serveur\pare-feu.ps1"
