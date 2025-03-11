@echo off
cd /d %~dp0

git add .
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value ^| find "LocalDateTime="') do set datetime=%%I
set commit_date=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

git commit -m "%commit_date%"
git push