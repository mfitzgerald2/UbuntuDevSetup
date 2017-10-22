echo This Setup Script for Ubuntu will install a full development environment on this computer. 
echo This script is being ran by $USER on $HOSTNAME.
echo This script will only work of the above user is a memer of the sudoers group.
read -p 'Type 1 if the user is a member of the sudoers group and you wish to continue' cont
if $cont == 1
then
    echo Continuing the Script!
    echo Currently Updating Packages and Repositories...
    sudo apt-get update
    sudo apt-get upgrade -y

    echo Currently making sure standard utilities like SSH are installed
    sudo apt-get install -y openssh-server openssh-client git curl

    echo Currently Installing C and C++ Development Tools...
    sudo apt-get install -y build-essential

    echo Currently Instaling Python and development Tools...
    sudo apt-get install -y python3-pip
    sudo apt-get insyall -y python-devel
    sudo apt-get install -y python3-venv

    echo Currently Instaling LAMP and development Tools...
    sudo apt-get install -y tasksel
    sudo tasksel install lamp-server

    echo Currently Instaling Java JDK and development Tools...
    sudo apt-get install openjdk-8-jdk
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin

    echo Currently Instaling NodeJS, jQuery and development Tools...
    sudo apt-get install python-software-properties
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install jquery

    echo Currently Installing Visual Studio Code...
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get update
    sudo apt-get install code

    echo Setup is now complete! Please reboot your machine to make sure all of the services start up!
    echo The system will automatically reboot in two minutes if you do not manually reboot. 
    sleep 2m
    reboot

else
    echo Please run again once the current user is a sudoer. 
fi
