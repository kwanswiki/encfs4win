; encfs4win installer 
 
 
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "encfs4win"
!define PRODUCT_VERSION "1.10.1-RC14"
!define PRODUCT_PUBLISHER "CEMi4"
!define HELPURL "https://github.com/jetwhiz/encfs4win"
!define ABOUTURL "https://encfs.win"
 
SetCompressor lzma
 
 
 
!include "MUI2.nsh"
!include "FileFunc.nsh"
 
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\..\encfs-bin\encfs4win.ico"
 
; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH
 
; Language files
!insertmacro MUI_LANGUAGE "English"



; Product details 

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\..\encfs-bin\encfs-installer.exe"
InstallDir "$PROGRAMFILES\encfs"
ShowInstDetails show



; Initialize installer 

Function .onInit
  ReadRegStr $R0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString"
  StrCmp $R0 "" initDone
 
  MessageBox MB_OK|MB_ICONEXCLAMATION "${PRODUCT_NAME} is already installed. Please remove the previous version and Dokany to proceed"
  Abort
initDone:
FunctionEnd



; Installer sections 

Section -SETTINGS
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
SectionEnd

Section "VC++ Redist v120" SEC01
  File "..\..\encfs-bin\vc_redist-120_x86.exe"
  ExecWait "$INSTDIR\vc_redist-120_x86.exe /install /passive /promptrestart"
SectionEnd

Section "VC++ Redist v140" SEC02
  File "..\..\encfs-bin\vc_redist-140_x86.exe"
  ExecWait "$INSTDIR\vc_redist-140_x86.exe /install /passive /promptrestart"
SectionEnd

Section "Dokany v1.2" SEC03
  File "..\..\encfs-bin\DokanSetup_redist-1.2.1.2000.exe"
  ExecWait "$INSTDIR\DokanSetup_redist-1.2.1.2000.exe /install /passive /norestart"
SectionEnd

Section "encfs" SEC04
  SectionIn RO
  
  # Install files
  File "win\dialog-password.ico"
  File "Release\encfs.exe"
  File "Release\encfsctl.exe"
  File "Release\encfsw.exe"
  File "$%OPENSSL_ROOT%\bin\libeay32.dll"
  File "$%OPENSSL_ROOT%\bin\ssleay32.dll"
  
  # Write uninstaller registry keys
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayName" "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayIcon" "$INSTDIR\dialog-password.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayVersion" "${PRODUCT_VERSION}"
  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
  IntFmt $0 "0x%08X" $0
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "EstimatedSize" "$0"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "HelpLink" "${HELPURL}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "URLInfoAbout" "${ABOUTURL}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "NoModify" "1"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "NoRepair" "1"
  
  # Create uninstaller
  WriteUninstaller "$INSTDIR\uninstall.exe"
  
  # Start Menu
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Encfsw.lnk" "$INSTDIR\encfsw.exe" "" "$INSTDIR\dialog-password.ico"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\dialog-password.ico"
  
  # Save install location to registry
  WriteRegStr HKLM "Software\${PRODUCT_NAME}" "Install_Dir" "$INSTDIR"
  
  # Cleanup
  Delete $INSTDIR\vc_redist-120_x86.exe
  Delete $INSTDIR\vc_redist-140_x86.exe
  Delete $INSTDIR\DokanSetup_redist-1.2.1.2000.exe
SectionEnd

LangString DESC_SEC01 ${LANG_ENGLISH} "Microsoft Visual C++ Redistributable 2013"
LangString DESC_SEC02 ${LANG_ENGLISH} "Microsoft Visual C++ Redistributable 2015"
LangString DESC_SEC03 ${LANG_ENGLISH} "Dokany FUSE tools (v1.2). NOTE: This is required if Dokany v1 is not already installed!"
LangString DESC_SEC04 ${LANG_ENGLISH} "Required encfs binaries"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} $(DESC_SEC01)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} $(DESC_SEC02)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} $(DESC_SEC03)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} $(DESC_SEC04)
!insertmacro MUI_FUNCTION_DESCRIPTION_END





; Initialize installer 

Function un.onInit

  #Verify the uninstaller - last chance to back out
  MessageBox MB_OKCANCEL "Are you sure you want to uninstall ${PRODUCT_NAME}?" IDOK initNext
    Abort
initNext:
FunctionEnd



; Uninstaller

Section "Uninstall"  
  SetShellVarContext all
  RMDir /r "$INSTDIR"
  Delete $INSTDIR\uninstall.exe
  
  # Remove uninstaller information 
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
  DeleteRegKey HKLM "Software\${PRODUCT_NAME}"
  
  # Remove Start Menu launcher
  Delete "$SMPROGRAMS\${PRODUCT_NAME}\encfsw.lnk"
  RMDir "$SMPROGRAMS\${PRODUCT_NAME}"
SectionEnd
