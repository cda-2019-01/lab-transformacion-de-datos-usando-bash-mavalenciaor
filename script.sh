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
  #echo "$var"
  for element in ${var/,/ }
   do
   #echo $element
   varc=$(echo "$element" | awk '{split($0,a," "); print a[2]}')
   vard=$(echo "$element" | awk '{split($0,a," "); print a[1]}')
   #echo $varc
   echo $filename,$x,$varb,$vard
   echo $filename,$x,$varb,$varc
   done
 done < <(grep . "${filename}")
done)
echo $result | awk '{gsub(/ /, ","); print}' | awk '/\:/{print}'