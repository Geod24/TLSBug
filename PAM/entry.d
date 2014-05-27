// Written in the D programming language.

/**
 Hold the PAM function.
 
 This module hold the pam_* functions required by the PAM framework.
 A very useful (though a bit outdated) explanation of PAM can be found
 $(LINK2 http://www.phrack.com/issues.html?issue=56&id=14#article, here).
 
 Note: The pam_* function's documentation is extracted from linux man pages.
 

 Date: November 1, 2013
 Version: 0.1
 Authors: Mathias 'Geod24' LANG, mathias.lang@boap.net
 Copyright: © 2013 - 2014 Mathias LANG
*/
module Client.PAM.entry;

import Client.PAM.pam_modules;
import Client.PAM.pam_ext;

import core.runtime : Runtime;

// Note: It would be very cool to have GCC like __attribute__(ctor)
void    init()
{
    static __gshared bool inited = false;
    if (!inited) {
        Runtime.initialize();
        inited = true;
    }
}

import std.stdio : log = writeln;

extern(C):
int  pam_sm_open_session(pam_handle_t* pamh, int flags, int ac, const char** av)
{
    int     status = PAM_ABORT;
    init();
    try {
        debug(PAMCall) log("[IN]]");
    } catch (Exception e) {
        status = PAM_ABORT;
        debug log(e);
    }
    return status;
}

int  pam_sm_close_session(pam_handle_t *pamh, int flags, int ac, const char** av)
{
    int     status = PAM_SESSION_ERR;
    init();
    try {
        debug(PAMCall) log("[IN]]");
    } catch (Exception e) {
        status = PAM_SESSION_ERR;
        debug log(e);
    }
    return status;
}

int   pam_sm_authenticate(pam_handle_t *pamh, int flags, int ac, const char** av)
{
    int     status = PAM_AUTH_ERR;
    init();
    try {
        debug(PAMCall) {
            log("[IN]");
            scope(exit) log("[OUT]={", status, "}");
        }
    } catch (Exception e) {
        status = PAM_AUTH_ERR;
        debug log(e);
    }
    return status;
}

int   pam_sm_setcred(pam_handle_t *pamh, int flags, int ac, const char** av)
{
    int     status = PAM_CRED_ERR;
    init();
    try {
        debug(PAMCall) log("[IN]]");
    } catch (Exception e) {
        status = PAM_CRED_ERR;
        debug log(e);
    }
    return status;
}

int   pam_sm_acct_mgmt(pam_handle_t *pamh, int flags, int ac, const char** av)
{
    int     status = PAM_AUTH_ERR;
    init();
    try {
        debug(PAMCall) log("[IN]]");
    } catch (Exception e) {
        status = PAM_AUTH_ERR;
        debug log(e);
    }
    return status;
}

int   pam_sm_chauthtok(pam_handle_t *pamh, int flags, int ac, const char** av)
{
    int     status = PAM_AUTHTOK_ERR;
    init();
    try {
        debug(PAMCall) log("[IN]]");
    } catch (Exception e) {
        status = PAM_AUTHTOK_ERR;
        debug log(e);
    }
    return status;
}
