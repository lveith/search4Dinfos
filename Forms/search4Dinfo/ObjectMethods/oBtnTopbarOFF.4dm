C_TEXT:C284($js)
C_POINTER:C301($ptr)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$js:=""
		
		$js:=$js+"document.querySelectorAll('#tsf > div:nth-child(2) > div[class][jsaction]')[0].style.marginLeft='14px';"
		$js:=$js+"document.getElementById('center_col').style.marginLeft='14px';"
		$js:=$js+"document.getElementById('hdtb-msb-vis').style.marginLeft='14px';"
		$js:=$js+"document.querySelectorAll('#tsf > div:nth-child(2) > div[class][jsaction]')[0].style.marginLeft='0';"
		$js:=$js+"document.querySelectorAll('#tsf > div:nth-child(2) > div[class][jsaction]')[0].style.paddingLeft='14px';"
		$js:=$js+"document.querySelectorAll('div.logo.doodle')[0].style.display='none';"
		$js:=$js+"document.getElementById('searchform').style.display='none';"
		$js:=$js+"document.getElementById('sfcnt').style.display='none';"
		$js:=$js+"document.getElementById('top_nav').style.display='none';"
		$js:=$js+"document.getElementById('taw').style.display='none';"
		$js:=$js+"document.getElementById('cnt').style.paddingTop='0';"
		$js:=$js+"document.querySelectorAll('#footcnt #fbar > div.fbar > div')[0].style.marginLeft='8px';"
		$js:=$js+"document.querySelectorAll('#footcnt #fbar > div.fbar > span')[0].style.marginLeft='8px';"
		$js:=$js+"document.querySelectorAll('.CvDJxb')[0].style.minWidth='800px';"
		$js:=$js+"document.getElementById('appbar').style.minWidth='800px';"
		$js:=$js+"document.getElementById('rhs').style.display='none'"
		
		Form:C1466.toggleTopBar:=True:C214
		
		$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWaGoogle"; $js; Is text:K8:3)
		
End case 
