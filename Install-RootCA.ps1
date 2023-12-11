$aialist = Get-CAAuthorityInformationAccess; foreach ($aia in $aialist) {Remove-CAAuthorityInformationAccess $aia.uri -Force};
