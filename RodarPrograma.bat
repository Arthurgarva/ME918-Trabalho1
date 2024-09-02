@echo off
set "R_PATH=C:\Program Files\R\R-4.3.1\bin\R.exe"
if not exist "%R_PATH%" (
    echo O R.exe nao foi encontrado no caminho especificado.
    pause
    exit /b 1
)

"%R_PATH%" CMD BATCH "%~dp0main.R"

exit