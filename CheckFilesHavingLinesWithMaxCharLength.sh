#bin/sh
# This script will list the files which are modified or newly added in git
# having character length in line more than 100 chars.
git ls-files -m | while read f ;
do 
    if grep -q '.\{100\}' ${f}; then
        echo ${f}
    fi
    grep -n '.\{100\}' ${f}
done;

git status | grep "new file:" | cut -c 14- | while read f ;
do 
    if grep -q '.\{99\}' ${f}; then
        echo ${f}
    fi
    grep -n '.\{99\}' ${f}
done;
