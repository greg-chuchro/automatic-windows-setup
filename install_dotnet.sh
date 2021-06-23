version=$(lsb_release -r | cut -d':' -f2 | xargs)

wget https://packages.microsoft.com/config/ubuntu/$version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install --yes apt-transport-https
sudo apt update
dotnetSdkPackageName=$(apt-cache search dotnet-sdk- | sed '/-rc/d' | sed '/preview/d' | sort --reverse --version-sort | head -n 1 | cut -d' ' -f1)
sudo apt-get install --yes $dotnetSdkPackageName
