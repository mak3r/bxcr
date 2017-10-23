Set-ExecutionPolicy RemoteSigned -scope CurrentUser	  


#Get Scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

#Get gradle
scoop install gradle

#Prepare for bitbucket pull
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh -T git@github.com

#DL apprenda bamboo integration
git clone git@github.com:you/your-private-repo

#DL apprenda powershell tools
git clone git@github.com:you/your-private-repo

#DL Visual Studio
https://www.visualstudio.com/thank-you-downloading-visual-studio/?sku=Community&rel=15
#Update Certs in java keystore
#Get openssl?
