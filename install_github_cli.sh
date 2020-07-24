ghPackageUrl=$(curl -sL https://api.github.com/repos/cli/cli/releases/latest | sed -n '/browser_download_url/p' | sed -n 's/.*\(http.*linux_amd64.deb\).*/\1/p')
wget $ghPackageUrl -O gh_linux_amd64.deb
sudo apt install --yes ./gh_linux_amd64.deb
