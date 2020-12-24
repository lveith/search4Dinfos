// OM: "testCollectionTo".oBtnTrace
// Only Trace and later here may be some code-examples to debug


Case of 
	: (Form event code:C388=On Clicked:K2:4)
		TRACE:C157
		Case of 
			: (False:C215)  // step in here if you like
				// ...insert your own debug examples
				
		End case 
		
	: (Form event code:C388=On Long Click:K2:37)
		// ...maybe a "Pop up menu" or other stuffs
		
End case 

// - EOF -
