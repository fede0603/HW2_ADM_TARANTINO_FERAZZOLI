#!/bin/bash 


des = $(cat instagram_post.csv | cut --fields=2,8 -s | grep -oE '^[[:digit:]]+[[:blank:]]+.{100,}$' | head -10 | cut -f1)

while IFS = read -r id; do
    if ["$id" != -1]; then
        cat instagram_profiles.csv | cut -f 1,3 | grep -w "$id" | cat #cat takes the 1st and 3rd columns (sid, username)
        #grep takes only the lines where the id is found
    else 
        echo The user cannot be found #if there's not user print the user cannot be found
    fi 
done <<< "$des"

#The special shell variable IFS determines how Bash recognizes word boundaries while splitting a sequence of character strings


#we take the first 10 description longer than 100 characters
#command cut take the sid profile and description of the dataset (respectively the second and eighth columns)
#command cat it is used to read the content of the dataset
#head 10 takes the first 10 lines
#command grep select the column of interest, ie with description longer than 100 