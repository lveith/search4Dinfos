//%attributes = {}
// PM: "getGithubSearchUrl"

C_TEXT:C284($githubSearchUrl;$0)
C_TEXT:C284($opOR)

// WA OPEN URL(*;"oWaGithub";"https://github.com/search?q=C_TEXT+extension%3A4dm&type=Code")

$githubSearchUrl:="https://github.com/search?q="

$opOR:=""

If (Form:C1466.searchValueGithub#"")
	$githubSearchUrl:=$githubSearchUrl+Replace string:C233(Form:C1466.searchValueGithub;" ";"%20")
	$opOR:="+"
End if 

Case of 
	: (Form:C1466.rbGithubExt4dm=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4dm
		
	: (Form:C1466.rbGithubExt4DProject=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DProject
		
	: (Form:C1466.rbGithubExt4DForm=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DForm
		
	: (Form:C1466.rbGithubExt4DCatalog=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DCatalog
		
	: (Form:C1466.rbGithubExt4DB=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DB
		
	: (Form:C1466.rbGithubExt4dbase=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4dbase
		
	: (Form:C1466.rbGithubExt4DSettings=1)
		$githubSearchUrl:=$githubSearchUrl+$opOR+"extension%3A"
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubExt4DSettings
		
End case 

$githubSearchUrl:=$githubSearchUrl+"&type="
Case of 
	: (Form:C1466.rbGithubTypCode=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypCode
		
	: (Form:C1466.rbGithubTypUsers=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypUsers
		
	: (Form:C1466.rbGithubTypIssues=1)
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbtGithubTypIssues
		
	Else 
		$githubSearchUrl:=$githubSearchUrl+Form:C1466.rbGithubTypRepositories
		
End case 

$0:=$githubSearchUrl