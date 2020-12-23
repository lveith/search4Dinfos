//%attributes = {}
// PM: "getGithubSearchUrl"

C_TEXT:C284($githubSearchUrl; $0)
C_TEXT:C284($opOR)
C_BOOLEAN:C305($useTag; $useExt)

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

If ($useTag)
	// ??
Else 
	If (Form:C1466.searchValueGithub#"")
		$githubSearchUrl:=$githubSearchUrl+Replace string:C233(Form:C1466.searchValueGithub; " "; "%20")
		$opOR:="+"
	End if 
End if 

Case of 
	: ($useTag)
		Form:C1466.rbGithubExt4dm:=0
		Form:C1466.rbGithubExt4DProject:=0
		Form:C1466.rbGithubExt4DForm:=0
		Form:C1466.rbGithubExt4DCatalog:=0
		Form:C1466.rbGithubExt4DB:=0
		Form:C1466.rbGithubExt4dbase:=0
		Form:C1466.rbGithubExt4DSettings:=0
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

$githubSearchUrl:=$githubSearchUrl+"&type="
Case of 
	: (Form:C1466.rbGithubTypCode=1)
		Case of 
			: ($useTag)
				Form:C1466.rbGithubTypCode:=0
				Form:C1466.rbGithubTypRepositories:=1
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
			Else 
				$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypCode
		End case 
		
	: ($useExt)
		Form:C1466.rbGithubTypCode:=0
		Form:C1466.rbGithubTypRepositories:=1
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
		
	: (Form:C1466.rbGithubTypUsers=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypUsers
		
	: (Form:C1466.rbGithubTypIssues=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypIssues
		
	Else 
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypRepositories
		
End case 

$0:=$githubSearchUrl