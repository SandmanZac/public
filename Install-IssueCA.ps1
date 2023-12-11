cd c:\installs
certutil -dspublish -f "offlineCA_CAZ Offline Root CA.crt" RootCA
certutil -addstore -f root "offlineCA_CAZ Offline Root CA.crt"
certutil -addstore -f root "CAZ Offline Root CA.crl"
certutil -dspublish "CAZ Offline Root CA.crl"
Install-AdcsCertificationAuthority –CAType EnterpriseSubordinateCA –CACommonName "CAZ Issue CA" –KeyLength 4096 –HashAlgorithm SHA512 –CryptoProviderName "RSA#Microsoft Software Key Storage Provider"
