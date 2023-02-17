for d in */ ; do
    echo "$d"
    cd $d
    if [ -f ".git" ] 
    then
        git pull
    fi
    cd ..
done

