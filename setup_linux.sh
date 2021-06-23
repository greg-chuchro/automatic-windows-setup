sudo apt update --yes && sudo apt full-upgrade --yes

bash ./install_dotnet.sh
bash ./install_nodejs.sh

sudo apt install --yes git-all
bash ./install_github_cli.sh
git config --global credential.helper store
gh auth login --hostname github.com
sudo -H npm install -g ungit
