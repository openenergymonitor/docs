echo "main"
git pull

echo "emonbase"
cd emonbase
git pull

echo "emoncms"
cd ../emoncms
git pull

echo "emonhub"
cd ../emonhub
git pull

echo "emonpi"
cd ../emonpi
git pull

echo "EmonScripts"
cd ../EmonScripts
git pull

echo "emonth2"
cd ../emonth2
git pull

echo "emontx3"
cd ../emontx3
git pull

echo "emontx4"
cd ../emontx4
git pull

echo "learn"
cd ../learn
git pull
cd

cd main
make clean
make html
