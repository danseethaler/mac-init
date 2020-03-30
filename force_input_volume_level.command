while true ; do
    while (( `osascript -e "input volume of (get volume settings)"` != 50 )); do
        osascript -e "set volume input volume 50";
    done;
    sleep .3;
done;
