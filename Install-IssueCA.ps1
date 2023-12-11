certutil –dspublish –f "offlineCA_CAZ Offline Root CA.crt" RootCA
certutil –addstore –f root "offlineCA_CAZ Offline Root CA.crt"
certutil –addstore –f root "CAZ Offline Root CA.crl"
