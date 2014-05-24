
if [ "$1" != "" ];
then
	if [ ! -d ~/Haskell ];
	then
		echo "Haskell Directory does not exit. Creating..."
		mkdir ~/Haskell
	fi
	if [ -d ~/Haskell/$1 ];
	then
    	cd ~/Haskell/$1
	else
    	mkdir ~/Haskell/$1
		cd ~/Haskell/$1
	fi
else 
	echo "Please enter foldername."
	
fi