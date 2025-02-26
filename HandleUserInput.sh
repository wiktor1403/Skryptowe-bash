#!/bin/bash
#Made by: Wiktor Korzystka
#Date:29.10.2024

AwaitPlayerInput(){
read input
case $input in
	a0|A0) InsertSignInField $1
	if [[ $? = 1 ]];then
		return 0
	else
		return -1
	fi;;
	a1|A1) InsertSignInField $2
	if [[ $? = 1 ]];then
		return 1
	else
		return -1
	fi;;
	a2|A2) InsertSignInField $3
	if [[ $? = 1 ]];then
		return 2
	else
		return -1
	fi;;
	b0|B0) InsertSignInField $4
	if [[ $? = 1 ]];then
		return 3
	else
		return -1
	fi;;
	b1|B1) InsertSignInField $5
	if [[ $? = 1 ]];then
		return 4
	else
		return -1
	fi;;
	b2|B2) InsertSignInField $6
	if [[ $? = 1 ]];then
		return 5
	else
		return -1
	fi;;
	c0|C0) InsertSignInField $7
	if [[ $? = 1 ]];then
		return 6
	else
		return -1
	fi;;
	c1|C1) InsertSignInField $8
	if [[ $? = 1 ]];then
		return 7
	else
		return -1
	fi;;
	c2|C2) InsertSignInField $9
	if [[ $? = 1 ]];then
		return 8
	else
		return -1
	fi;;
	qs|QS) return 210;;
	lf|LF) return 211;;
	*) return 254
esac
}

InsertSignInField(){
ChosenField=$1
if [[ $ChosenField != '' ]]; then
	return 0
else
	return 1
fi
}

QuickSave(){
PlayerSign=$1
WhosMove=$2
GameType=$3
rm -f save.txt
Zapis="
PlayerSign:$1
WhosMove:$2
GameType:$3
FieldA0:$4
FieldA1:$5
FieldA2:$6
FieldB0:$7
FieldB1:$8
FieldB2:$9
FieldC0:${10}
FieldC1:${11}
FieldC2:${12}"

echo -e "$Zapis" > save.txt
}