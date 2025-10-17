age=11
if [ $age -ge 18 ]; then
	echo "You can vote"
else
	echo "You can't vote"
fi

for i in {1..3} ; 
do 
	echo "This is one $i"
done

gap=18-$age
echo "You have to wait 18-$gap years to be eligible to vote"

echo "Enter any random number"
read num

echo "You have entered $num"
