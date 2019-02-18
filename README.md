# scan-build-crosscheck-docker

Docker image with scan-build with crosscheck support

# Why?

`scan-build` at the moment does not include, in any apt-repository, crosscheck support.
We want to use this new feature in [https://racket-lang.org](Racket) static analysis running in CI at https://gitlab.com/LinkiTools/racket

Therefore we build the image on a regular basis, upload it to docker hub and use the image from the Gitlab CI jobs. 
