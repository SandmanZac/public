# Copy the root CA certificate and CRL to removable media (usb stick) and paste them in the CDP and / or AIA location
# Now log in to your domain server that will become your subordinate certificate authority and insert your removable media

# Publish the "ROOTCA_RonnyVdB Trusted Root.crt" certificate into the configuration container of AD, this will make all machines on the domain trust this certificate without need for group policy distribution.
certutil –dspublish –f "ROOTCA_RonnyVdB Trusted Root.crt" RootCA
# Add the "ROOTCA_RonnyVdB Trusted Root.crt" certificate to the local certificate store, normally this happens at next group policy update, but this speeds up the process
certutil –addstore –f root orca1_ContosoRootCA.crt
certutil –addstore –f root ContosoRootCA.crl
