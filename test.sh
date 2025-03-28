#!/bin/bash
# yes this test could be factorizes, however I want beginners to understand this as well

TARGET=target.html

GIT_DIR=git-test
GIT_LOG=git-test.log

HG_DIR=hg-test
HG_LOG=hg-test.log

COUNT=3

# --- git ---
echo "Testing git"
echo "Start git test" > $GIT_LOG
mkdir $GIT_DIR
cp $TARGET $GIT_DIR/$TARGET
cd $GIT_DIR
git init .
git add $TARGET
git commit -m "Initial commit"

for i in $(seq $COUNT); do
    sed -i $TARGET -e "s/footer-icons/footer-icons\nEXTRA CONTENT/"
    SIZE_PRE=$(du -d 0 .)
    git commit -am "change $i"
    SIZE_POST=$(du -d 0 .)

    echo "CHANGE #$i SIZE pre:$SIZE_PRE post:$SIZE_POST" >> ../$GIT_LOG
    LAST_GIT_SIZE=$SIZE_POST
done
cd ..

# --- mercurial (hg) ---
echo "Testing hg"
echo "Start hg test" > $HG_LOG
mkdir $HG_DIR
cp $TARGET $HG_DIR/$TARGET
cd $HG_DIR
hg init .
hg add $TARGET
hg commit -m "Initial commit"

for i in $(seq $COUNT); do
    sed -i $TARGET -e "s/footer-icons/footer-icons\nEXTRA CONTENT/"
    SIZE_PRE=$(du -d 0 .)
    hg commit -m "change $i"
    SIZE_POST=$(du -d 0 .)

    echo "CHANGE #$i SIZE pre:$SIZE_PRE post:$SIZE_POST" >> ../$HG_LOG
    LAST_HG_SIZE=$SIZE_POST
done
cd ..

echo "Final directory size in kb git:$LAST_GIT_SIZE and in hg:$LAST_HG_SIZE
