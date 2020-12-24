//%attributes = {}
// PM: "getGithubSearchUrl"

C_TEXT:C284($githubSearchUrl; $0)
C_TEXT:C284($opOR)
C_BOOLEAN:C305($useTag; $useExt; $usedSearchVal)

Case of 
	: (Form:C1466.cbGithubTag4dproject=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4ddatabase=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dplugin=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dcomponent=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dv18=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dhdi=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dbinary=1)
		$useTag:=True:C214
	: (Form:C1466.cbGithubTag4dexapp=1)
		$useTag:=True:C214
	Else 
		$useTag:=False:C215
End case 


// WA OPEN URL(*;"oWaGithub";"https://github.com/search?q=C_TEXT+extension%3A4dm&type=Code")
// WA OPEN URL(*;"oWaGithub";"https://github.com/search?q=%22%234d-component%22+OR+%224dv18%22")

$githubSearchUrl:="https://github.com/search?q="

$opOR:=""

// --- SearchWords ---
If ($useTag)
	// ??
Else 
	If (Form:C1466.searchValueGithub#"")
		$githubSearchUrl:=$githubSearchUrl+"%22"+Replace string:C233(Replace string:C233(Form:C1466.searchValueGithub; " "; "%20"); "\""; "\\\"")+"%22"
		$usedSearchVal:=True:C214
		$opOR:="+"
	End if 
End if 

// --- Extensions ---
Case of 
	: ($useTag)
		Form:C1466.rbGithubExt4dm:=0
		Form:C1466.rbGithubExt4DProject:=0
		Form:C1466.rbGithubExt4DForm:=0
		Form:C1466.rbGithubExt4DCatalog:=0
		Form:C1466.rbGithubExt4DB:=0
		Form:C1466.rbGithubExt4dbase:=0
		Form:C1466.rbGithubExt4DSettings:=0
		Form:C1466.rbGithubExtOff:=1
		$useExt:=False:C215
		
	: (Form:C1466.rbGithubExtOff=1)
		$useExt:=False:C215
		
	: (Form:C1466.rbGithubExt4dm=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4dm
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4DProject=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DProject
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4DForm=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DForm
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4DCatalog=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DCatalog
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4DB=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DB
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4dbase=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4dbase
		$useExt:=True:C214
		
	: (Form:C1466.rbGithubExt4DSettings=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DSettings
		$useExt:=True:C214
		
End case 

// --- Tags ---
If (Form:C1466.cbGithubTag4dproject=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+"%22"+Form:C1466.cbtGithubTag4dproject+"%22"
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4ddatabase=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4ddatabase
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dplugin=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4dplugin
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dcomponent=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4dcomponent
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dv18=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4dv18
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dhdi=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4dhdi
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dbinary=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+"%22"+Form:C1466.cbtGithubTag4dbinary+"%22"
	$opOR:=" OR "
End if 
If (Form:C1466.cbGithubTag4dexapp=1)
	$githubSearchUrl:=$githubSearchUrl+$opOR+Form:C1466.cbtGithubTag4dexapp
	$opOR:=" OR "
End if 
If (Split string:C1554($githubSearchUrl; " OR ").length<5)
	$githubSearchUrl:=$githubSearchUrl+" NOT cinema NOT matrix4"
	If (Split string:C1554($githubSearchUrl; " OR ").length<3)
		If (Form:C1466.cbGithubTag4dproject=1)
			$githubSearchUrl:=$githubSearchUrl+" NOT arduino NOT Tracking4D"
		End if 
		If (Split string:C1554($githubSearchUrl; " NOT ").length<5)
			If (Form:C1466.cbGithubTag4dcomponent=1)
				$githubSearchUrl:=$githubSearchUrl+" NOT aframe"
			End if 
			If (Form:C1466.cbGithubTag4dbinary=1)
				$githubSearchUrl:=$githubSearchUrl+" NOT 4DTreeBoxesInAPlane"
			End if 
		End if 
	End if 
End if 

// $opOR reset?

// --- Type ---
$githubSearchUrl:=$githubSearchUrl+"&type="
Case of 
	: (Form:C1466.rbGithubTypCode=1)
		Case of 
			: ($useTag)
				Form:C1466.rbGithubTypCode:=0
				Form:C1466.rbGithubTypRepositories:=1
				Form:C1466.rbGithubTypUsers:=0
				Form:C1466.rbGithubTypIssues:=0
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
				
			: (isGithubLangActive)
				Form:C1466.rbGithubTypCode:=0
				Form:C1466.rbGithubTypRepositories:=0
				Form:C1466.rbGithubTypUsers:=1
				Form:C1466.rbGithubTypIssues:=0
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypUsers
				
			Else 
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypCode
		End case 
		
	: ($useExt)
		Form:C1466.rbGithubTypCode:=0
		Form:C1466.rbGithubTypRepositories:=1
		Form:C1466.rbGithubTypUsers:=0
		Form:C1466.rbGithubTypIssues:=0
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
		
	: (Form:C1466.rbGithubTypUsers=1)
		Case of 
			: ($useTag)
				Form:C1466.rbGithubTypCode:=0
				Form:C1466.rbGithubTypRepositories:=1
				Form:C1466.rbGithubTypUsers:=0
				Form:C1466.rbGithubTypIssues:=0
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
			Else 
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypUsers
		End case 
		
	: (Form:C1466.rbGithubTypIssues=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypIssues
		
	: (Form:C1466.rbGithubTypRepositories=1)
		If (($usedSearchVal) | ($useTag))
			$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
		Else 
			Form:C1466.rbGithubTypRepositories:=0
			Form:C1466.rbGithubTypUsers:=1
			$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypUsers
		End if 
		
	Else 
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
		
End case 

// --- Languages ---
Case of 
	: (Form:C1466.rbGithubLang4d=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLang4d
		
	: (Form:C1466.rbGithubLangJs=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangJs
		
	: (Form:C1466.rbGithubLangVb=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangVb
		
	: (Form:C1466.rbGithubShell=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubShell
		
	: (Form:C1466.rbGithubLangHtml=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangHtml
		
	: (Form:C1466.rbGithubLangVue=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangVue
		
	: (Form:C1466.rbGithubLangCss=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangCss
		
	: (Form:C1466.rbGithubLangPhp=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangPhp
		
	: (Form:C1466.rbGithubLangPerl=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangPerl
		
	: (Form:C1466.rbGithubLangXslt=1)
		$githubSearchUrl:=$githubSearchUrl+"&ref=advsearch&l="+Form:C1466.rbtGithubLangXslt
		
End case 

$0:=$githubSearchUrl

// - EOF -