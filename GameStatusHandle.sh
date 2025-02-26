#!/bin/bash
#Made by: Wiktor Korzystka
#Date:29.10.2024

SetUpGrid(){
local GameFields=("$@")
clear
Grid="  0 1 2
A ${GameFields[0]:= }│${GameFields[1]:= }│${GameFields[2]:= }
  ─┼─┼─
B ${GameFields[3]:= }│${GameFields[4]:= }│${GameFields[5]:= }
  ─┼─┼─
C ${GameFields[6]:= }│${GameFields[7]:= }│${GameFields[8]:= }"
echo "$Grid"

}

WriteGameStatus(){
Status=$1
PlayerOnTheMove=$2
case $Status in
Draw)   echo "Game ended with a draw";;
PVEW)	if [[ $PlayerOnTheMove = 'c' ]];then
			echo "Computer has come on top"
		else
			echo "You managed to defeat computer!"
		fi;;
PVPW)   echo "Player $PlayerOnTheMove has won!";;
NF)		echo "Player input couldn't be matched to any function";;
FF)		echo "Chosen Field is already filled choose difrent"
		echo "Player $PlayerOnTheMove on the move";;
*) 		echo "Wrtite position to place your symbol"
		echo "Player $PlayerOnTheMove on the move";;
esac
}

DecideWhosOnMove(){
GameType=$1
WhosMove=$2
if [[ $GameType = 'PVP' ]]; then
	return 0
else
	if [[ $WhosMove = 'p' ]]; then
		return 0
	else
		return 1
	fi
fi
}

ChangePlayer(){
GameType=$1
PlayerSign=$2
PVEstat=$3
if [[ $GameType = 'PVP' ]]; then
	if [[ $PlayerSign = 'o' ]]; then
		return 0
	else
		return 1
	fi
else
	if [[ $PVEstat = 'p' ]]; then
		return 2
	else
		return 3
	fi
fi
}

CheckEndingConditions(){
local GameFields=("$@")

if [[ ${GameFields[0]} = ${GameFields[1]} ]] && [[ ${GameFields[0]} = ${GameFields[2]} ]] && [[ ${GameFields[0]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[3]} = ${GameFields[4]} ]] && [[ ${GameFields[3]} = ${GameFields[5]} ]] && [[ ${GameFields[3]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[6]} = ${GameFields[7]} ]] && [[ ${GameFields[6]} = ${GameFields[8]} ]] && [[ ${GameFields[6]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[0]} = ${GameFields[3]} ]] && [[ ${GameFields[0]} = ${GameFields[6]} ]] && [[ ${GameFields[0]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[1]} = ${GameFields[4]} ]] && [[ ${GameFields[1]} = ${GameFields[7]} ]] && [[ ${GameFields[1]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[2]} = ${GameFields[5]} ]] && [[ ${GameFields[2]} = ${GameFields[8]} ]] && [[ ${GameFields[2]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[0]} = ${GameFields[4]} ]] && [[ ${GameFields[0]} = ${GameFields[8]} ]] && [[ ${GameFields[0]} != ' ' ]]; then
	return 1
fi
if [[ ${GameFields[2]} = ${GameFields[4]} ]] && [[ ${GameFields[2]} = ${GameFields[6]} ]] && [[ ${GameFields[2]} != ' ' ]]; then
	return 1
fi

for i in "${GameFields[@]}";
do
	if [[ $i = ' ' ]]; then
		return 0
	fi
done

return 2
}

HandleWin(){
GameType=$1
PlayerSign=$2
WhosMove=$3
if [[ $GameType = 'PVP' ]]; then
	WriteGameStatus "PVPW" $PlayerSign
else
	WriteGameStatus "PVEW" $WhosMove
fi
}

HandleDraw(){
WriteGameStatus "Draw"
}