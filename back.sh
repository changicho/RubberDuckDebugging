#echo "hello world!"
mkdir ttemp

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
    # echo "$i"
    if find day"$i" -maxdepth 0 -empty | read;
    then
        echo "day$i is empty"
    else
        mkdir ttemp/day"$i"
        #cp day"$i"/*.js backup/day"$i"/"$i".js
        find day"$i" -name "*.js" -printf "%f\n" -exec cp {} ttemp/day"$i" \;
    fi    

done

zip backup_$(date +%Y%m%d).zip ttemp/*/*
rm -rf ttemp

scp backup_$(date +%Y%m%d).zip luciano@192.168.56.1:/home/luciano/backup/
