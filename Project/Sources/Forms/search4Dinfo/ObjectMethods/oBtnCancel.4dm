// OM: "testCollectionTo".oBtnCancel
// Only Cancel (if window type has no closeBox)
// shortcut=ESC

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CANCEL:C270
		
	: (Form event code:C388=On Long Click:K2:37)
		// ...maybe a "Pop up menu" or other stuffs
		
End case 

// - EOF -