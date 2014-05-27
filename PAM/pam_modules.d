/++
 Define a PAM interface to a module.

 Replacement of <security/pam_modules.h>

 Copyright: Copyright Mathias LANG 2013 - 2014.
 Authors:   Mathias 'Geod24' LANG
 Standards: The Open Group, document P702, ISBN: 1-85912-144-6
 +/
module Client.PAM.pam_modules;
public import Client.PAM.pam_types;

/* -------------- The Linux-PAM Module PI ------------- */

alias extern(C) void function(pam_handle_t*, void* data, int error_status) CleanupCB;

extern(C) int pam_set_data(pam_handle_t* pamh, const char* module_data_name,
                           void* data, CleanupCB  cleanup);

extern(C) int pam_get_data(const pam_handle_t* pamh, const char *module_data_name,
                           const void **data);

extern(C) int pam_get_user(pam_handle_t *pamh, const char **user, const char *prompt);

struct pam_module {
    const char*             name;           // Name of the module
    SMAuthenticateCB        authenticate;
    SMSetcredCB             setcred;
    SMAccountManagementCB   acc_mgmt;
    SMOpenSessionCB         open_session;
    SMCloseSessionCB        close_session;
    SMChAuthTokenCB         ch_auth_token;
};


/* Authentication API's */
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMAuthenticateCB;
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMSetcredCB;
/* Account Management API's */
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMAccountManagementCB;
/* Session Management API's */
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMOpenSessionCB;
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMCloseSessionCB;
/* Password Management API's */
alias int function(pam_handle_t *pamh, int flags, int argc, const char **argv)
    SMChAuthTokenCB;


/* The following two flags are for use across the Linux-PAM/module
 * interface only. The Application is not permitted to use these
 * tokens.
 *
 * The password service should only perform preliminary checks.  No
 * passwords should be updated. */
//#define PAM_PRELIM_CHECK		0x4000

/* The password service should update passwords Note: PAM_PRELIM_CHECK
 * and PAM_UPDATE_AUTHTOK cannot both be set simultaneously! */
//#define PAM_UPDATE_AUTHTOK		0x2000


/*
 * here are some proposed error status definitions for the
 * 'error_status' argument used by the cleanup function associated
 * with data items they should be logically OR'd with the error_status
 * of the latest return from libpam -- new with .52 and positive
 * impression from Sun although not official as of 1996/9/4 there are
 * others in _pam_types.h -- they are for common module/app use.
 */

//#define PAM_DATA_REPLACE   0x20000000     /* used when replacing a data item */


/* take care of any compatibility issues */
//#include <security/_pam_compat.h>
