//%attributes = {"preemptive":"capable"}
// PM: "kb4dDocWorker"

C_LONGINT:C283($winRef;$1)
C_TEXT:C284($searchValue;$2)

If (Count parameters:C259>0)
	$winRef:=$1
	If (Count parameters:C259>1)
		$searchValue:=$2
	End if 
End if 

If ($winRef#0)
	getKb4dDoc($winRef;$searchValue)
End if 

// - EOF -