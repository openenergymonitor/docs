git pull

for d in */ ; do
    echo "$d"
    cd $d
    if [ -f ".git" ] 
    then
        git pull
    fi
    cd ..
done

cd main
make clean
make html
rm -rf _live
mv _build/html _live
