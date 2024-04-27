@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  MC-Remapper startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and MC_REMAPPER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\MC-Remapper-2.0.7-SNAPSHOT.jar;%APP_HOME%\lib\mcversions-1.0.3-SNAPSHOT.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.4.2.jar;%APP_HOME%\lib\ktor-client-serialization-jvm-1.5.1.jar;%APP_HOME%\lib\clikt-jvm-3.0.1.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.8.0.jar;%APP_HOME%\lib\ktor-client-cio-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-client-json-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-client-core-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-http-cio-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-network-tls-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-http-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-network-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-utils-jvm-1.5.1.jar;%APP_HOME%\lib\ktor-io-jvm-1.5.1.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.4.2.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.0.1.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.0.1.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.8.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.9.22.jar;%APP_HOME%\lib\asm-commons-9.6.jar;%APP_HOME%\lib\asm-tree-9.6.jar;%APP_HOME%\lib\asm-9.6.jar;%APP_HOME%\lib\progressbar-0.9.3.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\jline-3.21.0.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar


@rem Execute MC-Remapper
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %MC_REMAPPER_OPTS%  -classpath "%CLASSPATH%" io.heartpattern.mcremapper.commandline.MCRemapperAppKt %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable MC_REMAPPER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%MC_REMAPPER_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
