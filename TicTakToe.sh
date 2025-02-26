#!/bin/bash
#Made by: Wiktor Korzystka
#Date:29.10.2024

#Import funcionalities-------------------------------------------
. ./MenuSetup.sh
. ./GameStatusHandle.sh
. ./HandleUserInput.sh
. ./ComputerPlayerFunctions.sh
#Declare Global variables----------------------------------------

FieldA0=' '
FieldA1=' '
FieldA2=' '

FieldB0=' '
FieldB1=' '
FieldB2=' '

FieldC0=' '
FieldC1=' '
FieldC2=' '

GameFields[0]=$FieldA0 
GameFields[1]=$FieldA1 
GameFields[2]=$FieldA2 
GameFields[3]=$FieldB0 
GameFields[4]=$FieldB1 
GameFields[5]=$FieldB2 
GameFields[6]=$FieldC0 
GameFields[7]=$FieldC1 
GameFields[8]=$FieldC2 

PlayerSign='o'

StillRunning=1

WhosMove='p'

GameStatus='def'

GameType='PVP'
#Loading--------------------------------------------------------
LoadSave(){

while IFS=: read -r f1 f2
do
	case $f1 in
		FieldA0) GameFields[0]=$f2;;
		FieldA1) GameFields[1]=$f2;; 
		FieldA2) GameFields[2]=$f2;; 
		FieldB0) GameFields[3]=$f2;; 
		FieldB1) GameFields[4]=$f2;; 
		FieldB2) GameFields[5]=$f2;; 
		FieldC0) GameFields[6]=$f2;; 
		FieldC1) GameFields[7]=$f2;; 
		FieldC2) GameFields[8]=$f2;; 
		PlayerSign) PlayerSign=$f2;; 
		WhosMove) WhosMove=$f2;; 
		GameType) GameType=$f2;; 
		*)
	esac
		
done <"save.txt"
}


#Setup Menu------------------------------------------------------
GetPlayMode
if [[ $? = 1 ]];then
	GameType='PVP'
else
	GameType='PVE'
fi

if [[ $GameType = 'PVP' ]]; then
	GetFirstSymbol
	if [[ $? = 1 ]];then
		PlayerSign='x'
	else
		PlayerSign='o'
	fi
else
	GetPlayerSymbol
	if [[ $? = 1 ]];then
		PlayerSign='x'
	else
		PlayerSign='o'
	fi
	
	GetPVEFirstMove
	if [[ $? = 1 ]];then
		WhosMove='p'
	else
		WhosMove='c'
	fi
fi

#Setup Game------------------------------------------------------

SetUpGrid "${GameFields[@]}"
WriteGameStatus $GameStatus $PlayerSign

#Main Loop-------------------------------------------------------
while [[ $StillRunning = 1 ]]; do
	DecideWhosOnMove $GameType $WhosMove
	CompMove=$?
	if [[ $CompMove = 1 ]];then
		ComputerMove "${GameFields[@]}" $PlayerSign
		Field=$?
		if [[ $PlayerSign = 'x' ]]; then
			ComputerSign='o'
		else
			ComputerSign='x'
		fi
		GameFields[$Field]=$ComputerSign
		GameStatus='def'
	else
		AwaitPlayerInput "${GameFields[@]}"
		Field=$?
		if [[ $Field -lt 200 ]]; then
			GameFields[$Field]=$PlayerSign
		else
			case $Field in
			255) 	#Cohesen field already filled
					GameStatus='FF';;
			254)    GameStatus='NF';;
			210)    QuickSave $PlayerSign $WhosMove $GameType "${GameFields[@]}";;
			211)    LoadSave;;
			esac
			SetUpGrid "${GameFields[@]}"
			DecideWhosOnMove $GameType $WhosMove
			WriteGameStatus $GameStatus $PlayerSign
			continue
		fi
	fi
	SetUpGrid "${GameFields[@]}"
	CheckEndingConditions "${GameFields[@]}"
	case $? in
	1) 	HandleWin $GameType $PlayerSign $WhosMove
		StillRunning=0;;
	2) 	HandleDraw
		StillRunning=0;;
	*) 
		ChangePlayer $GameType $PlayerSign $WhosMove
		case $? in
		0)	PlayerSign='x';;
		1)  PlayerSign='o';;
		2)  WhosMove='c';;
		3)  WhosMove='p';;
		esac
		GameStatus='def'
		WriteGameStatus $GameStatus $PlayerSign
	esac
	
	
done

