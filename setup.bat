@echo off
powershell -Command "Start-Process powershell -Verb RunAs -Args '-noe -nop -c \"cd ''%~dp0''; .\setup.ps1\"'"
