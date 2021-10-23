@echo off
set timestamp=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
set "timestamp=%timestamp: =0%"
if not exist .\log\ (
	mkdir .\log\
) else (
	for %%i in (.\log\*.log) do (
		7z a %%i.gz %%i
		del /f /q %%i
	)
)
%2 %3 >> .\log\%1_%timestamp%.log 2> ^&1