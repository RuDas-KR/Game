; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines

# #이나 ;로 시작하면 주석문입니다. 설명시에 종종 사용.
# 다중주석문은 /*로 시작해서 */로 끝나면 된다

!define PRODUCT_NAME "응용 프로그램"
# 만들어질 파일의 이름을 나타낸다.

!define PRODUCT_VERSION "1.0"
# 버전명을 나타냄. 자신이 편할대로 바꾸어 쓰자.

!define PRODUCT_PUBLISHER "나의 회사, Inc."
# 제공자를 말함. 자신이 편할대로 바꾸어 쓰자.

!define PRODUCT_WEB_SITE "http://www.mycompany.com"
# 말 그대로 웹사이트를 나타냄.

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\AppMainExe.exe"
# 레지스트리를 등록할때 쓰는구문. 마인크래프트 간편설치기용으로 쓸 것이니 이 줄은 지워주는게 좋다.

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "c:\path\to\licence\YourSoftwareLicence.txt"
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\응용 프로그램"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "c:\path\to\file\AppMainExe.exe"
  File "c:\path\to\file\Example.file"
SectionEnd

Section -Post
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\AppMainExe.exe"
SectionEnd