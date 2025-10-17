clear
echo "------------------------------------------------"
echo "------------------Calculator--------------------"
echo "------------------------------------------------"
echo -e "[a]Addition\n[b]Substraction\n[c]Multiplication\n[d]Division\n"
read -p "Enter your choice: " choice
case $choice in
	[aA])
		read -p "Enter first number : " num1
		read -p "Enter second number: " num2
		result=$((num1+num2))
		echo "The sum of $num1 and $num2 is : $result"
		;;
	[bB])
		read -p "Enter first number : " num1
                read -p "Enter second number: " num2
                result=$((num1-num2))
                echo "The substraction of $num1 and $num2 is : $result"
                ;;
	*)
		echo "Please enter a valid choice"
		;;
esac
