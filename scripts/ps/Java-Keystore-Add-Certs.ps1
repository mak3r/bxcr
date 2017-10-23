Write-Output "Calling Apprenda Installer"

# if we don't already  have the cert, we can get it like this
#& 'C:\Program Files\Git\git-bash.exe' -c openssl s_client -connect apps.apprenda.bxcr:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /c/vgrant/certs/apps.apprenda.bxcr.crt

# install the cert in the java keystore
& 'C:\Program Files\Git\git-bash.exe' -c "$JAVA_HOME/bin/keytool" -import -alias apprenda.bxcr -keystore "$JAVA_HOME/jre/lib/security/cacerts" -file /c/vagrant/certs/bxcr.cer -storepass changeit -noprompt
