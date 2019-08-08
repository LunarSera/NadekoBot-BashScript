#!/bin/sh
echo ""
echo "Welcome to Red Installer."

choice=5
	echo "1. Launch Red in PM2 (Only run this once or you will have more than one instance of the bot running.)"
	echo "2. Install npm and Pyvenv"
	echo "3. Optimize Python for Red. (Only run once.)"
	echo "4. Install The bot itself."
	echo -n "Description of launcher."
while [ $choice -eq 5 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Installing Red, please wait."
	pm2 start redbot --name Red --interpreter "/home/red/bin/python" -- red --no-prompt
	echo ""
	echo "Redbot Installed. Monitoring now."
	pm2 logs --lines 100
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Downloading PM2, please wait."
		sudo apt-get install -y build-essential &&
		sudo apt autoremove -y && 
		sudo apt-get install curl software-properties-common &&
		sudo curl -sL https://deb.nodesource.com/setup_10.x | -E sudo bash -
		sudo apt-get install -y nodejs && 
		sudo curl -sL https://deb.nodesource.com/setup_10.x | -E sudo bash - 
		sudo apt-get install -y npm &&
		sleep 10 &&
		echo Did npm install?
		sudo apt-get update &&
		echo npm version:
		npm --version
		echo Should be 6.9.0 or newer &&
		sleep 5 &&
		apt-get install zlib1g-dev &&
		npm install pm2 -g &&
		apt install python3.7 python3.7-dev python3.7-venv python3-pip build-essential \
		libssl-dev libffi-dev git unzip default-jre -y &&
		curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash &&
		echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc &&
		echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc &&
		echo 'eval "$(pyenv init -)"' >> ~/.bashrc &&
		exec bash
		echo ""
		echo "PM2 and pyvenv installed."
		sudo bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			CONFIGURE_OPTS=--enable-optimizations pyenv install 3.7.2 -v
			echo Optimized.
		else
			if [ $choice -eq 4 ] ; then
				python3.7 -m venv /home/red/
				source /home/red/bin/activate
				python3.7 -m pip install -U Red-DiscordBot
				redbot-setup
			else

				clear
				echo "1. ...)"
				echo "2. ..."
				echo "3. ..."

				echo -n "..."
				choice=8
			fi
		fi
	fi
fi
done
exit 0
