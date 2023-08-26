@ECHO OFF
SETLOCAL

:: Function to handle build
:build_target
    ECHO Starting build for target: %1
    %SPHINXBUILD% -b %1 %ALLSPHINXOPTS% %BUILDDIR%/%1
    IF ERRORLEVEL 1 (
        ECHO Error during build for target: %1. Exiting.
        EXIT /B 1
    )
    ECHO Build finished. The %1 files are in %BUILDDIR%/%1.
    GOTO :EOF

:: Initialize variables
IF "%SPHINXBUILD%" == "" (
    SET SPHINXBUILD=sphinx-build
)
SET BUILDDIR=_build
SET ALLSPHINXOPTS=-d %BUILDDIR%/doctrees %SPHINXOPTS% .
SET I18NSPHINXOPTS=%SPHINXOPTS% .

:: Handle paper size
IF NOT "%PAPER%" == "" (
    SET ALLSPHINXOPTS=-D latex_paper_size=%PAPER% %ALLSPHINXOPTS%
    SET I18NSPHINXOPTS=-D latex_paper_size=%PAPER% %I18NSPHINXOPTS%
)

:: Validate arguments
IF "%1" == "" GOTO help

:: Build targets
IF "%1" == "help" GOTO help
IF "%1" == "clean" GOTO clean
CALL :build_target %1
GOTO end

:help
    ECHO Please use "make ^<target^>" where ^<target^> is one of:
    ECHO   html, dirhtml, singlehtml, pickle, json, htmlhelp, qthelp, devhelp,
    ECHO   epub, latex, text, man, texinfo, gettext, changes, linkcheck, doctest
    GOTO end

:clean
    FOR /D %%i IN (%BUILDDIR%\*) DO RMDIR /Q /S %%i
    DEL /Q /S %BUILDDIR%\*
    ECHO Cleaned up build directory: %BUILDDIR%
    GOTO end

:end
    ECHO Script execution completed.
ENDLOCAL
