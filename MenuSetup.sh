#!/bin/bash
#Made by: Wiktor Korzystka
#Date:29.10.2024

GetPlayMode(){
read -r -p "Choose Play Mode (PVP/PVE)" PlayMode
if [ $PlayMode = "PVP" ]; then
	return 1
fi
if [ $PlayMode = "PVE" ]; then
	return 0
fi

echo "Please type 'PVP' or 'PVE' in order to procced"
GetPlayMode

}

GetFirstSymbol(){
read -r -p "What symbol is going first(x/o)" FirstSymbol

if [ $FirstSymbol = "x" ] || [ $FirstSymbol="o" ]; then
	if [[ $FirstSymbol = "x" ]]; then
		return 1
	else
		return 0
	fi
else
	echo "Please pick one of two available options to procced"
	GetFirstSymbol
fi
}

GetPlayerSymbol(){
read -r -p "Pick your symbol(x/o)" PlayerSymbol

if [ $PlayerSymbol = "x" ] || [ $PlayerSymbol="o" ]; then
	if [[ $PlayerSymbol = "x" ]]; then
		return 1
	else
		return 0
	fi
else
	echo "Please pick one of two available options to procced"
	GetPlayerSymbol
fi	

}

GetPVEFirstMove(){
read -r -p "Who is going first p-player or c-computer?" FirstToPlay
if [ $FirstToPlay = "p" ] || [ $FirstToPlay = "c" ]; then
	if [[ $FirstToPlay = "p" ]]; then
		return 1
	else
		return 0
	fi
else
echo "Please pick one of two available options to procced"
GetPVEFirstMove
fi
}
