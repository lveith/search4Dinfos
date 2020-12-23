// FM: "search4Dinfo"

Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.cbt4dCom:="4d.com"
		Form:C1466.cbtDoc4dCom:="doc.4d.com"
		Form:C1466.cbtDoc4dComV18R5:="doc.4d.com%2F4Dv18R5"
		Form:C1466.cbtKb4dCom:="kb.4d.com"
		Form:C1466.cbtDev4dCom:="developer.4d.com"
		Form:C1466.cbtBlog4dCom:="blog.4d.com"
		
		Form:C1466.cb4dCom:=0
		Form:C1466.cbDoc4dCom:=0
		Form:C1466.cbDoc4dComV18R5:=1
		Form:C1466.cbKb4dCom:=1
		Form:C1466.cbDev4dCom:=1
		Form:C1466.cbBlog4dCom:=1
		
		Form:C1466.currUrlGoogle:=""
		Form:C1466.currPageTitleGoogle:=""
		Form:C1466.colPageContGoogle:=New collection:C1472
		Form:C1466.searchValueGoogle:=""
		Form:C1466.searchTitleGoogle:=""
		Form:C1466.progressWaGoogle:=0
		
		Form:C1466.currUrlGithub:=""
		Form:C1466.currPageTitleGithub:=""
		Form:C1466.colPageContGithub:=New collection:C1472
		Form:C1466.searchValueGithub:=""
		Form:C1466.progressWaGithub:=0
		
		Form:C1466.rbtGithubTypCode:="Code"
		Form:C1466.rbtGithubTypRepositories:="Repositories"
		Form:C1466.rbtGithubTypUsers:="Users"
		Form:C1466.rbtGithubTypIssues:="Issues"
		
		Form:C1466.rbGithubTypCode:=1
		Form:C1466.rbGithubTypRepositories:=0
		Form:C1466.rbGithubTypUsers:=0
		Form:C1466.rbGithubTypIssues:=0
		
		Form:C1466.rbGithubExt4dm:=1
		Form:C1466.rbGithubExt4DProject:=0
		Form:C1466.rbGithubExt4DForm:=0
		Form:C1466.rbGithubExt4DCatalog:=0
		Form:C1466.rbGithubExt4DB:=0
		Form:C1466.rbGithubExt4dbase:=0
		Form:C1466.rbGithubExt4DSettings:=0
		
		Form:C1466.rbtGithubExt4dm:="4dm"
		Form:C1466.rbtGithubExt4DProject:="4DProject"
		Form:C1466.rbtGithubExt4DForm:="4DForm"
		Form:C1466.rbtGithubExt4DCatalog:=".DCatalog"
		Form:C1466.rbtGithubExt4DB:="4DB"
		Form:C1466.rbtGithubExt4dbase:="4dbase"
		Form:C1466.rbtGithubExt4DSettings:="4DSettings"
		
		Form:C1466.cbGithubTag4dproject:=0
		Form:C1466.cbGithubTag4ddatabase:=0
		Form:C1466.cbGithubTag4dplugin:=0
		Form:C1466.cbGithubTag4dcomponent:=0
		Form:C1466.cbGithubTag4dv18:=0
		Form:C1466.cbGithubTag4dhdi:=0
		Form:C1466.cbGithubTag4dbinary:=0
		Form:C1466.cbGithubTag4dexapp:=0
		
		Form:C1466.cbtGithubTag4dproject:="4d-project"
		Form:C1466.cbtGithubTag4ddatabase:="4d-database"
		Form:C1466.cbtGithubTag4dplugin:="4d-plugin"
		Form:C1466.cbtGithubTag4dcomponent:="4d-component"
		Form:C1466.cbtGithubTag4dv18:="4dv18"
		Form:C1466.cbtGithubTag4dhdi:="4d-hdi"
		Form:C1466.cbtGithubTag4dbinary:="4d-binary"
		Form:C1466.cbtGithubTag4dexapp:="4d-example-application"
		
		Form:C1466.kbAssetid:=0
		Form:C1466.kb4dComCurrEl:=New object:C1471
		Form:C1466.kb4dComCurrPos:=0
		Form:C1466.kb4dComCurrSel:=New collection:C1472
		Form:C1466.colKb4dCom:=New collection:C1472
		Form:C1466.searchValueKb4dCom:=""
		
		// WA SET URL FILTERS
		// WA SET EXTERNAL LINKS FILTERS
		
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable contextual menu:K62:6; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable JavaScript:K62:4; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable plugins:K62:5; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable Web inspector:K62:7; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable URL drop:K62:8; False:C215)
		WA SET PREFERENCE:C1041(*; "oWaGoogle"; WA enable Java applets:K62:3; False:C215)
		
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable contextual menu:K62:6; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable JavaScript:K62:4; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable plugins:K62:5; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable Web inspector:K62:7; True:C214)
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable URL drop:K62:8; False:C215)
		WA SET PREFERENCE:C1041(*; "oWaGithub"; WA enable Java applets:K62:3; False:C215)
		
		// https://www.google.com/advanced_search
		// https://support.google.com/websearch?p=adv_operators
		WA OPEN URL:C1020(*; "oWaGoogle"; "about:blank")  // prevent from adopting previous wa-session as start-default
		// WA OPEN URL(*;"oWaGoogle";"https://www.google.com")
		// https://www.google.com/search?q=site%3Adoc.4d.com%2F4Dv18R5+OR+site%3Akb.4d.com+%22C_TEXT%22
		// WA OPEN URL(*;"oWaGoogle";"https://www.google.com/search?q=site%3Adoc.4d.com%2F4Dv18R5+OR+site%3Akb.4d.com+OR+site%3Adeveloper.4d.com+OR+site%3Ablog.4d.com+%22C_TEXT%22&num=100")
		//WA OPEN URL(*;"oWaGoogle";getGoogleSearchUrl)
		
		WA OPEN URL:C1020(*; "oWaGithub"; "about:blank")  // prevent from adopting previous wa-session as start-default
		// WA OPEN URL(*;"oWaGithub";"https://github.com/search/advanced")
		// https://github.com/search?q=C_TEXT+extension%3A4dm&type=Code
		// WA OPEN URL(*;"oWaGithub";"https://github.com/search?q=C_TEXT+extension%3A4dm&type=Code")
		//WA OPEN URL(*;"oWaGithub";getGithubSearchUrl)
		
		WA OPEN URL:C1020(*; "oWaKb4dCom"; "about:blank")
		
		// http://www.googleguide.com
		Form:C1466.colGoogleGuide:=getColGoogleGuide
		
		OBJECT SET TITLE:C194(*; "oBtnChooseFormPage"; "Google")  // form page 1
		
		Form:C1466.lastWaEvents:=""
		
	: (Form event code:C388=On Unload:K2:2)
		WA OPEN URL:C1020(*; "oWaGoogle"; "about:blank")  // prevent from adopting previous wa-session as start-default
		WA OPEN URL:C1020(*; "oWaGithub"; "about:blank")
		WA OPEN URL:C1020(*; "oWaKb4dCom"; "about:blank")
		
End case 

// - EOF -