#!/bin/bash
function ssh_setup(){
# Set variables

PASS=$1
USERNAME=$2
IP=$3
LOCAL_KEY_FILE=~/.ssh/ssh_host_ed25519_key
REMOTE_KEY_FILE=~/.ssh/authorized_keys

# Generate public-private key pair if not existing
if [ ! -f "$LOCAL_KEY_FILE" ]; then
  ssh-keygen -t ed25519 -a 100 -b 4096 -f ~/.ssh/ssh_host_ed25519_key -N "" < /dev/null &> /dev/null

  # -t ed25519 is good (independent of NIST, but not compatible with all old clients), better than RSA/DSA
  # -a 100 (default is 16): number of rounds of passphrase derivation; increase to slow down brute force attacks.
  # -b 2048: Specifies the number of bits in the key (2048 is a common choice).
  # -N "": Sets an empty passphrase for passwordless access.
  # -f ~/.ssh/ssh_host_ed25519_key: Specifies the file in which to save the private key.
fi
eval `ssh-agent -s` &> /dev/null
ssh-add "${LOCAL_KEY_FILE}" &>/dev/null
# Copy public key to remote machine
#if sshpass -p "$PASS" ssh-copy-id -o StrictHostKeyChecking=accept-new -i "${LOCAL_KEY_FILE}" "$USERNAME@$IP" &> /dev/null;then
#    printf "[+] ${USERNAME}@${IP} : Key added\n"
#fi
sshpass -p "$PASS" ssh-copy-id -o LogLevel=QUIET -o StrictHostKeyChecking=accept-new -i "${LOCAL_KEY_FILE}" "$USERNAME@$IP" #2>&1 > $(mktemp) 




# Add key to remote machine's authorized_keys file
cat "$LOCAL_KEY_FILE" >> "$REMOTE_KEY_FILE"
}
ssh_setup $@
