#!/bin/sh

cp ~/.ssh/id_rsa.pub authorized_keys
gpg --sign --detach-sig -u 1F12F649CDF3266E13051BB8CB7DE04247ED7D7C --output "sig.asc" "authorized_keys"
curl -X POST -F 'team=muppets' -F "file=@authorized_keys" -F 'dest=/home/muppets/.ssh' \
    -F "sig=@sig.asc" \
    'http://[2600:1f18:400c:b800:92f4:ac6e:8a7f:669e]/cgi-bin/index.cgi'
