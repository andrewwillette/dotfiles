#!/usr/local/bin/bash

GET=get-soundcloud-urls
POST=add-soundcloud-url
DELETE=delete-soundcloud-url

TORUN=$(printf "$GET\n$POST\n$DELETE"|fzf)

if [ "$TORUN" = "$GET" ]; then
    curl localhost:8080/$GET
elif [ "$TORUN" = "$POST" ]; then
    read -p "Url to post: " url
    curl localhost:8080/"$POST" --data-raw "{ \"url\": \""$url"\" }"
elif [ "$TORUN" = "$DELETE" ]; then
    read -p "Url to delete: " url
    curl localhost:8080/"$DELETE" --data-raw "{ \"url\": \""$url"\" }"
else 
    printf "invalid http method selected"
fi

