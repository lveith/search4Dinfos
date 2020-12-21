//%attributes = {}
// PM: "getColGoogleGuide"

C_COLLECTION:C1488($cololGoogleGuide;$0)
C_OBJECT:C1216($obj)

$cololGoogleGuide:=New collection:C1472

$obj:=New object:C1471
$obj.key:="site:"
$obj.cmt:="Search only one website or domain"
$obj.exa:=$obj.key+"kb.4d.com"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="filetype:"
$obj.cmt:="Find documents of the specified type"
$obj.exa:=$obj.key+"pdf"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="inurl:"
$obj.cmt:="The terms must appear in the URL of the page"
$obj.exa:=$obj.key+"4d"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="intitle:"
$obj.cmt:="The terms must appear in the title of the page"
$obj.exa:=$obj.key+"ARRAY BLOB"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="OR"
$obj.cmt:="Information which has jobs or gates"
$obj.exa:="jobs "+$obj.key+" gates"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="AND"
$obj.cmt:="Information which has jobs and gates"
$obj.exa:="jobs "+$obj.key+" gates"
$cololGoogleGuide.push($obj)

$0:=$cololGoogleGuide

// - EOF -