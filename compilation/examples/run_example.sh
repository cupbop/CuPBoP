#!bin/sh
for file in ./*
do
    if test -d $file
    then
        echo executing $file
        cd $file
        bash run.sh
        cd ..
    fi
done
