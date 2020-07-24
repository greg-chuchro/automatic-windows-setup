sudo apt update --yes && sudo apt full-upgrade --yes

bash ./install_dotnet.sh
bash ./install_nodejs.sh

sudo apt install --yes git-all
bash ./install_github_cli.sh
sudo -H npm install -g ungit
