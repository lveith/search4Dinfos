//%attributes = {}
// PM: "isGithubLangActive"

C_BOOLEAN:C305($isGithubLangActive; $0)

// --- Languages ---
Case of 
	: (Form:C1466.rbGithubLang4d=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangJs=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangVb=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubShell=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangHtml=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangVue=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangCss=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangPhp=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangPerl=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangXslt=1)
		$isGithubLangActive:=True:C214
		
	: (Form:C1466.rbGithubLangOff=1)
		$isGithubLangActive:=False:C215
		
	Else 
		$isGithubLangActive:=False:C215
		Form:C1466.rbGithubLangOff:=1
		
End case 

$0:=$isGithubLangActive

// - EOF -