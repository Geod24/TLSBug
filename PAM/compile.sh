#!/bin/bash
dmd -fPIC -c -ofpam_boapnet.o -debug -g -w entry.d pam_appl.d pam_ext.d pam_modules.d pam_types.d
dmd -oflibpam_boapnet.so pam_boapnet.o -L--no-as-needed -shared -g -defaultlib=libphobos2.so
