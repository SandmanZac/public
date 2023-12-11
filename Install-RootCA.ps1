Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools
Install-AdcsCertificationAuthority -CAType StandaloneRootCA -CACommonName "CAZ Offline Root CA" -KeyLength 4096 -HashAlgorithm SHA512 -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -Force -Confirm:$false
$aialist = Get-CAAuthorityInformationAccess; foreach ($aia in $aialist) {Remove-CAAuthorityInformationAccess $aia.uri -Force -Confirm:$false};
Add-CAAuthorityInformationAccess -AddToCertificateAia -uri http://pki.caz.one/pki
$crllist = Get-CACrlDistributionPoint; foreach ($crl in $crllist) {Remove-CACrlDistributionPoint $crl.uri -Force -Confirm:$false};
Add-CACRLDistributionPoint -Uri C:\Windows\System32\CertSrv\CertEnroll\%3%8.crl -PublishToServer -Force -Confirm:$false
Add-CACRLDistributionPoint -Uri http://pki.caz.one/pki/%3%8.crl -AddToCertificateCDP -Force -Confirm:$false
Certutil -setreg CA\CRLOverlapPeriodUnits 24
Certutil -setreg CA\CRLOverlapPeriod "Hours"
Certutil -setreg CA\ValidityPeriodUnits 5
Certutil -setreg CA\ValidityPeriod "Years"
restart-service certsvc
certutil -crl
