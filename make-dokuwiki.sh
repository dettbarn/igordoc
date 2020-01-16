# save previous creation, if any
mv dokuwiki.txt dokuwiki_old.txt

# pipe documentation of all procedures into dokuwiki formatted file
for i in *.ipf
do
        echo "====== $i ======" >> dokuwiki.txt
        cat "$i" | pcregrep -M '(//.*\r?\n)*Function' | perl -0777 -i.original -pe 's/(\/\/(=====|-----).*\r?\n?)((\/\/.*\r?\n?)*)(Function.*\r?\n?)/\n\5\3\n/g' | sed "s/\(\(Function.*\) \([^( ]\+\) \?([^)]*).*$\)/==== \3 ====\n''\1''/g" |  sed 's/\/\/\(.*\)/\1/g' | sed 's/\(.*[^=-]$\)/\1\\\\/g' | sed 's/^ \(.*\)/\1/g' >> dokuwiki.txt
done