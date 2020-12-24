//%attributes = {}
// PM: "isGithubTagActive"

C_BOOLEAN:C305($isGithubTagActive; $0)

// --- Tags ---
Case of 
	: (Form:C1466.cbGithubTag4dproject=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4ddatabase=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dplugin=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dcomponent=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dv18=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dhdi=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dbinary=1)
		$isGithubTagActive:=True:C214
		
	: (Form:C1466.cbGithubTag4dexapp=1)
		$isGithubTagActive:=True:C214
		
	Else 
		$isGithubTagActive:=False:C215
		
End case 

$0:=$isGithubTagActive

// - EOF -