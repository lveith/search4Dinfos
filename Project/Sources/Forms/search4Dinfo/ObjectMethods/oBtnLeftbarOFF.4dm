C_TEXT:C284($js; $resultTxt)
C_POINTER:C301($ptr)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$js:=""
		
		$js:=$js+"document.querySelectorAll('#js-pjax-container > div.container-lg.px-md-2.mt-lg-4.clearfix > div.col-12.col-md-3.float-left.px-md-2')[0].style.display='none';"
		$js:=$js+"document.querySelectorAll('#js-pjax-container > div.container-lg.px-md-2.mt-lg-4.clearfix > div.col-12.col-md-9.float-left.px-2.pt-3.pt-md-0[class*=\"results\"]')[0].style.width='100%';"
		
		Form:C1466.toggleLeftBar:=True:C214
		
		$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWaGithub"; $js; Is text:K8:3)
		
End case 
