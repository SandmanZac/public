certutil –dspublish –f "CAZ Offline Trusted Root.crt" RootCA
certutil –addstore –f root orca1_ContosoRootCA.crt
certutil –addstore –f root ContosoRootCA.crl
