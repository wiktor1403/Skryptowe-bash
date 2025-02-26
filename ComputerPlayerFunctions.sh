#!/bin/bash
#Made by: Wiktor Korzystka
#Date:29.10.2024

ComputerMove(){
local GameFields=("$@")
local PLayerSign="${GameFields[9]}"

if [[ ${GameFields[9]} = 'x' ]]; then
ComputerSign='o'
else
ComputerSign='x'
fi
GameFields[10]=$ComputerSign

FieldA0=${GameFields[0]}
FieldA1=${GameFields[1]}
FieldA2=${GameFields[2]}
FieldB0=${GameFields[3]}
FieldB1=${GameFields[4]}
FieldB2=${GameFields[5]}
FieldC0=${GameFields[6]}
FieldC1=${GameFields[7]}
FieldC2=${GameFields[8]}

GrabWin "${GameFields[@]}"
local outcome=$?
if [[ $outcome != 255 ]]; then
	return $outcome
fi
BlockWin "${GameFields[@]}"
local outcome=$?
if [[ $outcome != 255 ]]; then
	return $outcome
fi
AnyFree "${GameFields[@]}"
local outcome=$?
return $outcome
}

GrabWin(){
ComputerSign=${10}
if ( [[ $FieldA1 = $ComputerSign ]] && [[ $FieldA2 = $ComputerSign ]]) || ([[ $FieldB0 = $ComputerSign ]] && [[ $FieldC0 = $ComputerSign ]]) || ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]] ); then
	if [ $FieldA0 = " " ];then
	return 0
	fi
fi
if ([[ $FieldA0 = $ComputerSign ]] && [[ $FieldA2 = $ComputerSign ]]) || ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldC1 = $ComputerSign ]]);then
	if [[ $FieldA1 = ' ' ]];then
	return 1
	fi
fi 
if ([[ $FieldA1 = $ComputerSign ]] && [[ $FieldA0 = $ComputerSign ]]) || ([[ $FieldB2 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]]) || ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldC0 = $ComputerSign ]]);then
	if [[ $FieldA2 = ' ' ]];then
	return 2
	fi
fi
if ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldB2 = $ComputerSign ]]) || ([[ $FieldA0 = $ComputerSign ]] && [[ $FieldC0 = $ComputerSign ]]);then
	if [[ $FieldB0 = ' ' ]];then
	return 3
	fi
fi  
if ([[ $FieldB0 = $ComputerSign ]] && [[ $FieldB2 = $ComputerSign ]]) || ([[ $FieldA1 = $ComputerSign ]] && [[ $FieldC1 = $ComputerSign ]]) || ([[ $FieldA0 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]]) || ([[ $FieldA2 = $ComputerSign ]] && [[ $FieldC0 = $ComputerSign ]]);then
	if [[ $FieldB1 = ' ' ]];then
	return 4
	fi
fi 
if ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldB0 = $ComputerSign ]]) || ([[ $FieldA2 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]]);then
	if [[ $FieldB2 = ' ' ]];then
	return 5
	fi
fi
if ([[ $FieldC1 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]]) || ([[ $FieldA0 = $ComputerSign ]] && [[ $FieldB0 = $ComputerSign ]]) || ([[ $FieldB1 = $ComputerSign ]] && [[ $FieldA2 = $ComputerSign ]]);then
	if [[ $FieldC0 = ' ' ]];then
	return 6
	fi
fi    
if ([[ $FieldC0 = $ComputerSign ]] && [[ $FieldC2 = $ComputerSign ]]) || ([[ $FieldA1 = $ComputerSign ]] && [[ $FieldB1 = $ComputerSign ]]);then
	if [[ $FieldC1 = ' ' ]];then
	return 7
	fi
fi    
if ([[ $FieldC0 = $ComputerSign ]] && $FieldC1 = $ComputerSign ]]) || ([[ $FieldA2 = $ComputerSign && $FieldB2 = $ComputerSign ]]) || ([[ $FieldB1 = $ComputerSign && $FieldA0 = $ComputerSign ]]);then
	if [[ $FieldC2 = ' ' ]];then
	return 8
	fi
fi  
return -1
}

BlockWin(){
if ([[ $FieldA1 = $Playersign ]] && [[ $FieldA2 = $Playersign ]]) || ([[ $FieldB0 = $Playersign ]] && [[ $FieldC0 = $Playersign ]]) || ([[ $FieldB1 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]);then
	if [[ $FieldA0 = ' ' ]];then
	return 0
	fi
fi
if ([[ $FieldA0 = $Playersign ]] && [[ $FieldA2 = $Playersign ]]) || ([[ $FieldB1 = $Playersign ]] && [[ $FieldC1 = $Playersign ]]);then
	if [[ $FieldA1 = ' ' ]];then
	return 1
	fi
fi 
if ([[ $FieldA1 = $Playersign ]] && [[ $FieldA0 = $Playersign ]]) || ([[ $FieldB2 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]) || ([[ $FieldB1 = $Playersign ]] && [[ $FieldC0 = $Playersign ]]);then
	if [[ $FieldA2 = ' ' ]];then
	return 2
	fi
fi
if ([[ $FieldB1 = $Playersign ]] && [[ $FieldB2 = $Playersign ]]) || ([[ $FieldA0 = $Playersign ]] && [[ $FieldC0 = $Playersign ]]);then
	if [[ $FieldB0 = ' ' ]];then
	return 3
	fi
fi  
if ([[ $FieldB0 = $Playersign ]] && [[ $FieldB2 = $Playersign ]]) || ([[ $FieldA1 = $Playersign ]] && [[ $FieldC1 = $Playersign ]]) || ([[ $FieldA0 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]) || ([[ $FieldA2 = $Playersign ]] && [[ $FieldC0 = $Playersign ]]);then
	if [[ $FieldB1 = ' ' ]];then
	return 4
	fi
fi 
if ([[ $FieldB1 = $Playersign ]] && [[ $FieldB0 = $Playersign ]]) || ([[ $FieldA2 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]);then
	if [[ $FieldB2 = ' ' ]];then
	return 5
	fi
fi
if ([[ $FieldC1 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]) || ([[ $FieldA0 = $Playersign ]] && [[ $FieldB0 = $Playersign ]]) || ([[ $FieldB1 = $Playersign ]] && [[ $FieldA2 = $Playersign ]]);then
	if [[ $FieldC0 = ' ' ]];then
	return 6
	fi
fi    
if ([[ $FieldC0 = $Playersign ]] && [[ $FieldC2 = $Playersign ]]) || ([[ $FieldA1 = $Playersign ]] && [[ $FieldB1 = $Playersign ]]);then
	if [[ $FieldC1 = ' ' ]];then
	return 7
	fi
fi    
if ([[ $FieldC0 = $Playersign ]] && [[ $FieldC1 = $Playersign ]]) || ([[ $FieldA2 = $Playersign ]] && [[ $FieldB2 = $Playersign ]]) || ([[ $FieldB1 = $Playersign ]] && [[ $FieldA0 = $Playersign ]]);then
	if [[ $FieldC2 = ' ' ]];then
	return 8
	fi
fi   
return -1
}

AnyFree(){
	if [[ $FieldA0 = ' ' ]];then
		return 0
	fi
	
	if [[ $FieldA1 = ' ' ]];then
		return 1
	fi
	
	if [[ $FieldA2 = ' ' ]];then
		return 2
	fi
	
	if [[ $FieldB0 = ' ' ]];then
		return 3
	fi

	if [[ $FieldB1 = ' ' ]];then
		return 4
	fi
	
	if [[ $FieldB2 = ' ' ]];then
		return 5
	fi
	
	if [[ $FieldC0 = ' ' ]];then
		return 6
	fi
	
	if [[ $FieldC1 = ' ' ]];then
		return 7
	fi
	
	if [[ $FieldC2 = ' ' ]];then
		return 8
	fi
}