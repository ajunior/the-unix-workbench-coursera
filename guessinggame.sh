#!/usr/bin/env bash
# File: guessinggame.sh
# Checked with ShellChecker (https://www.shellcheck.net/)

# The guessinggame.sh program should have the following behavior:
#
# [1] When the program starts the user should be asked how many files are in the 
#     current directory, and then the user should be prompted for a guess.
#
# [2] If the user's answer is incorrect the user should be advised that their 
#     guess was either too low or too high and then they should be prompted to 
#     try to guess again.
#
# [3] If the user's guess is correct then they should be congratulated and the 
#     program should end.
#
# [4] The program should not end until the user has entered the correct number 
#     of files in the current directory.
#
# [5] The program should be able to be run by entering bash guessinggame.sh 
#      into the console.
#
# [6] The program should contain at least one function, one loop, and one 
#     if statement.
#
# [7] The program should be more than 20 lines of code but less than 50 
#     lines of code.

count_files() { find . -maxdepth 1 -type f | wc -l; }

typeset -i number_of_files
typeset -i response

number_of_files=$(count_files)
# echo "$number_of_files" # just to debug

while true 
do
    echo "Guess how many files there are in the current directory:"
    read -r response

    if [ "$response" -eq "$number_of_files" ]; then
        echo "Your guess is right. Congratulations!"
        break
    else
        if [ "$response" -gt $((number_of_files + 10)) ]; then
            echo "Your guess is too high. Try again."
        elif [ "$response" -gt "$number_of_files" ]; then
            echo "Your guess is high. Try again."
        elif [ "$response" -lt $((number_of_files - 10)) ]; then
            echo "Your guess is too low. Try again."
        else
            echo "Your guess is low. Try again."
        fi
    fi
done

exit 0
