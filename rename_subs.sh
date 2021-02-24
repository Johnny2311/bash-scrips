# Pass the season as a parameter to the script
# $1 => season

# Video formats (may be incomplete)
formats=(avi mkv mp4 mpg mpeg) 

# Iterate over all the video formats
for f in "${formats[@]}";
do
    for i in *.$f;
    do     
        # Parse the episode number
        # Change the pattern as convenient
        j=${i#*$1x};     
        j=${j::2};     
        echo "Current episode: $j"; 
        
        # Must be only one that matches 
        # Change the pattern as convenient
        for k in *$1x${j}*.srt;
        do
            if [ -f "$k" ];
            then
            mv -vi "$k" "${i/.$f/.srt}"    
            fi
        done
    done
    echo "Moving to another format..."
done
