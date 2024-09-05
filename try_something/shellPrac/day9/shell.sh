### day9
### first, the script should output a string "please enter a number" when execute.
### require users input numbers and then print this number, and ask for another number again
### until users input 'end'

#############################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-30
#############################################################

while :
do
	read -p "please enter a number (input end to quit):" number
	count=$(echo $number | sed -r 's/[0-9]//g' | wc -c)
	if [[ $number == "end" ]]
	then
		# ecit
		# or
		break
	fi
	if [[ count -eq 1 ]]
	then
		echo $number
	else
		echo "anything except number is rejected:"
	fi
done

<< 'COMMENT'
wc -c seems can counts the mount of symbol in input including '\n'
and sed can do replacement
-r: extend regular expression(Regex is counted)
`s/part1/part2/flag` is the replace command:
part1 is to match content that will be replaced
part2 is the target replacement text, if left empty, like command in script, is equal to delete part1s in content
COMMENT
