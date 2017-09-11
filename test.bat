@ECHO OFF


if NOT exist "encfs\Release\" (
	.\build.bat
)

REM install dokany and vc2014
SET PATH=%PATH%;%cd%\deps\openssl\install-dir\bin\;%cd%\deps\dokan\Win32\Release\

perl -MTest::Harness -e "$$Test::Harness::verbose=1; runtests @ARGV;" tests/normal.t.pl
