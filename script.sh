result=$(for filename in *.csv
do
 x=0
 while read p
 do
  if [ ${#p} -ge 5 ]
  then
   echo $len
   x=$((x+1))
  fi
  var=$(echo "$p" | awk '{gsub(/\t/, ";"); print}' | awk '{gsub(/\t/, ";"); print}' | awk '{sub(/ /, ";"); print}'  | awk '{gsub(/ /, ""); print}' | sed -r '/^\s*$/d' | awk '{split($0,a,";"); print a[2]}')
  varb=$(echo "$p" | awk '{gsub(/\t/, ";"); print}' | awk '{gsub(/\t/, ";"); print}' | awk '{sub(/ /, ";"); print}'  | awk '{gsub(/ /, ""); print}' | sed -r '/^\s*$/d' | awk '{split($0,a,";"); print a[1]}')
  for element in ${var/,/ }
   do
   varc=$(echo "$element" | awk '{split($0,a," "); print a[2]}')
   vard=$(echo "$element" | awk '{split($0,a," "); print a[1]}')
   echo $filename,$x,$varb,$vard
   echo $filename,$x,$varb,$varc
   done
 done < <(grep . "${filename}")
done)
resultb=$(echo "$result" | sed 's/\r//g' | awk '{gsub(/ /, ","); print}' | awk '/\:/{print}')

for line in ${resultb}
do
IFS=',' read -a myarray <<< "$line"
#echo "${#myarray[@]}"
for((c=3; c<"${#myarray[@]}"; c++))
do
    echo "${myarray[0]}","${myarray[1]}","${myarray[2]}","${myarray[$c]}" 
done
done