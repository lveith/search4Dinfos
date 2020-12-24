C_TEXT:C284($js; $resultTxt)
C_POINTER:C301($ptr)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$js:=""
		
		$js:=$js+"document.getElementById('searchform').style.display='';"
		$js:=$js+"document.getElementById('sfcnt').style.display='';"
		$js:=$js+"document.getElementById('top_nav').style.display='';"
		$js:=$js+"document.getElementById('taw').style.display='';"
		$js:=$js+"document.getElementById('cnt').style.paddingTop='';"
		$js:=$js+"document.querySelectorAll('.CvDJxb')[0].style.minWidth='';"
		$js:=$js+"document.getElementById('appbar').style.minWidth='';"
		$js:=$js+"document.getElementById('rhs').style.display=''"
		
		Form:C1466.toggleTopBar:=False:C215
		
		$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWaGoogle"; $js; Is text:K8:3)
		
End case 
