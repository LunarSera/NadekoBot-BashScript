#!/bin/sh
echo ""
echo "Welcome to Red Installer."

choice=4
	echo "1. Launch Red in PM2 (Only run this once or you will have more than one instance of the bot running.)"
	echo "2. Install npm and Pyvenv"
	echo "3. Optimize Python for Red. (Only run once.)"
	echo -n "Description of launcher."
while [ $choice -eq 4 ]; do
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
		apt-get install -y build-essential &&
		apt autoremove -y && 
		apt-get install curl software-properties-common &&
		curl -sL https://deb.nodesource.com/setup_10.x | -E bash -
		apt-get install -y nodejs && 
		curl -sL https://deb.nodesource.com/setup_10.x | -E bash - 
		apt-get install -y npm &&
		sleep 10 &&
		echo Did npm install?
		apt-get update &&
		echo npm version:
		npm --version
		echo Should be 6.9.0 or newer &&
		sleep 5 &&
		apt-get install zlib1g-dev &&
		npm install pm2 -g &&
		apt install python3.7 python3.7-dev python3.7-venv python3-pip build-essential \
		libssl-dev libffi-dev git unzip default-jre -y &&
		sudo curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash &&
		echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc &&
		echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc &&
		echo 'eval "$(pyenv init -)"' >> ~/.bashrc &&
		exec bash
		echo ""
		echo "PM2 and pyvenv installed."
		bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			echo ""
			echo "Running Nadeko Normally, if you are running this to check Nadeko, use .die command on discord to stop Nadeko."
			curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_run.sh | sh
			echo ""
			echo "Welcome back to NadekoBot."
			bash linuxAIO.sh
		else

			clear
			echo "1. Download Dev Build (Latest)"
			echo "2. Download Stable Build"
			echo "3. Run Nadeko (Normally)"

			echo -n "Choose [1 or 2] to Download, [3 or 4] to Run, or [7] to Exit."
			choice=8
		fi
	fi
fi
done
exit 0
