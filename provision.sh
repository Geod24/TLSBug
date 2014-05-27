#!/bin/bash

function die()
{
    echo -e '[DIE]['`date -u +"%H:%m:%S:%N"`']' $@
    exit 1
}

# Preliminary checks
DUB=`which dub` || die "dub was not found in the path"
DMD=`which dmd` || die "dmd was not found in the path"

function install_config()
{
    ## This is missing from the box
    sudo apt-get install -y libpam0g-dev libreadline-dev

    ## Configuration file
    CONF=$(echo "# -*- conf -*-
#
# The PAM configuration file for boapnet
# And the test application...
#

auth    required    pam_warn.so
auth    required    pam_boapnet.so")

    ## Install
    sudo cp /vagrant/PAM/libpam_boapnet.so /lib/security/pam_boapnet.so
    sudo bash -c "echo \"$CONF\" > /etc/pam.d/boapnet"
    #sudo echo "auth    required    pam_boapnet.so" >> /etc/pam.d/common-auth
}

## Entry ##
cd /vagrant/PAM && ./compile.sh
install_config
