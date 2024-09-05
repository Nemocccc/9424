#!/bin/bash
#author: nemo
#version: v1
#datea: 2024-09-01

#######################################################

### day11
### use parameters delevering to write a script, realize the function of addition, subtraction multiplication and division
### for example: sh a.sh 1 2, and this command will calculate the result of a,s,m,d respectively
### requierment:
### 1> the script should ensure that the two number provided are integrate
### 2> while doing subtraction or division, you need to jugde which number is larger
### 3> subtraction need to subtract the smaller one with the bigger one
### 4> division need to divide the smaller one with the bigger one, keep two decimal places, and it is necessary to determine whether the dividend is zreo or not

#######################################################

# first we need to determine whether users passed 2 parameters
if [[ $# -ne 2 ]]; then
	echo "you should pass two parameters like: ./$0 1 2"
	exit 1
fi

is_int() {
	if echo "$1" | grep -q '[^0-9]'; then
		echo "$1 is not an int"
		exit 1
	fi
}

max() {
	if [[ $1 -ge $2 ]]; then
		echo $1
	else
		echo $2
	fi
}

min() {
	if [[ $1 -lt $2 ]]; then
		echo $1
	else
		echo $2
	fi
}
echo "当前Shell是: $SHELL"
add() {
	echo "$1 + $2 = $[$1+$2]"
}

minus() {
	big=$(max $1 $2)
	small=$(min $1 $2)
	echo "$big - $small = $[$big-$small]"
}

mul() {
	echo "$1 * $2 = $[$1*$2]"
}

division() {
	big=$(max $1 $2)
	small=$(min $1 $2)
	if [[ $small -eq 0 ]]; then
		echo "divide by 0 error"
		exit 1
	fi
	result=$(echo "scale =2; $big / $small" | bc)
	echo "$big / $small = $result"
}

<<'COMMENT'
-ge: >=
-lt: <
$#: the amount of paremeters
bc
COMMENT
