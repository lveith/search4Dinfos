//%attributes = {}
// PM: "getColGoogleGuide"

// http://www.googleguide.com/print/adv_op_ref.pdf
// https://ahrefs.com/blog/de/google-erweiterte-suchoperatoren/

C_COLLECTION:C1488($cololGoogleGuide; $0)
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
$obj.key:="allinurl:"
$obj.cmt:="All query words must appear in the URL"
$obj.exa:=$obj.key+"4D Classes ORDA"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="intitle:"
$obj.cmt:="The terms must appear in the title of the page"
$obj.exa:=$obj.key+"ARRAY BLOB"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="allintitle:"
$obj.cmt:="All query words must appear in the title of the page"
$obj.exa:=$obj.key+"4D Classes ORDA"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="intext:"
$obj.cmt:="The terms must appear in the text of the page"
$obj.exa:=$obj.key+"ARRAY BLOB"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="allintext:"
$obj.cmt:="All query words must appear in the text of the page"
$obj.exa:=$obj.key+"4D Classes ORDA"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="inanchor:"
$obj.cmt:="Terms must appear in anchor text of links to the page"
$obj.exa:=$obj.key+"ARRAY BLOB"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="allinanchor:"
$obj.cmt:="All query words must appear in anchor text of links to the page"
$obj.exa:=$obj.key+"4D Classes ORDA"
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

$obj:=New object:C1471
$obj.key:="-"
$obj.cmt:="Exclude a term or phrase. E.g. jobs -apple (all returned pages relate to jobs but not to Apple the company)"
$obj.exa:="jobs "+$obj.key+"apple"
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="\"I have a dream\""
$obj.cmt:="Search only exact phrase e.g. \"I have a dream\". Force an exact search. Use this option to refine results for ambiguous searches or to exclude synonyms when searching for individual words"
$obj.exa:=$obj.key
$cololGoogleGuide.push($obj)

$obj:=New object:C1471
$obj.key:="define:"
$obj.cmt:="Provide definitions for words, phrases, and acronyms from the Web."
$obj.exa:=$obj.key+"define:kerning"
$cololGoogleGuide.push($obj)

$0:=$cololGoogleGuide

// - EOF -