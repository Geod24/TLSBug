/++
 This file defines all of the types common to the Linux-PAM library
 applications and modules.

 Replacement of <security/_pam_types.h>.
 
 Copyright: Copyright Mathias LANG 2013 - 2014.
 Authors:   Mathias 'Geod24' LANG
 Standards: The Open Group, document P702, ISBN: 1-85912-144-6
 +/
module Client.PAM.pam_types;

/++
 This is a blind structure; users aren't allowed to see inside a
 pam_handle_t, so we don't define struct pam_handle here.  This is
 defined in a file private to the PAM library.  (i.e., it's private
 to PAM service modules, too!)
 +/
struct pam_handle {}
alias pam_handle pam_handle_t;

/* ---------------- The Linux-PAM Version defines ----------------- */

/+
 Major and minor version number of the Linux-PAM package.  Use
 these macros to test for features in specific releases.
 +/
const int __LINUX_PAM__ = 1;
/// ditto
const int __LINUX_PAM_MINOR__ = 0;

/* ----------------- The Linux-PAM return values ------------------ */

enum {
    PAM_SUCCESS             = 0,    /** Successful function return */
    PAM_OPEN_ERR            = 1,    /** dlopen() failure when dynamically */
                                    /** loading a service module */
    PAM_SYMBOL_ERR          = 2,    /** Symbol not found */
    PAM_SERVICE_ERR         = 3,    /** Error in service module */
    PAM_SYSTEM_ERR          = 4,    /** System error */
    PAM_BUF_ERR             = 5,    /** Memory buffer error */
    PAM_PERM_DENIED         = 6,    /** Permission denied */
    PAM_AUTH_ERR            = 7,    /** Authentication failure */
    PAM_CRED_INSUFFICIENT   = 8,    /** Can not access authentication data */
                                    /** due to insufficient credentials */
    PAM_AUTHINFO_UNAVAIL    = 9,    /** Underlying authentication service */
                                    /** can not retrieve authentication */
                                    /** information  */
    PAM_USER_UNKNOWN        = 10,   /** User not known to the underlying */
                                    /** authenticaiton module */
    PAM_MAXTRIES            = 11,   /** An authentication service has */
                                    /** maintained a retry count which has */
                                    /** been reached.  No further retries */
                                    /** should be attempted */
    PAM_NEW_AUTHTOK_REQD    = 12,   /** New authentication token required.
                                       This is normally returned if the 
                                       machine security policies require 
                                       that the password should be changed 
                                       beccause the password is NULL or it 
                                       has aged */
    PAM_ACCT_EXPIRED        = 13,   /** User account has expired */
    PAM_SESSION_ERR         = 14,   /** Can not make/remove an entry for
                                       the specified session */
    PAM_CRED_UNAVAIL        = 15,   /** Underlying authentication service 
                                       can not retrieve user credentials 
                                       unavailable */
    PAM_CRED_EXPIRED        = 16,   /** User credentials expired */
    PAM_CRED_ERR            = 17,   /** Failure setting user credentials */
    PAM_NO_MODULE_DATA      = 18,   /** No module specific data is present */
    PAM_CONV_ERR            = 19,   /** Conversation error */
    PAM_AUTHTOK_ERR         = 20,   /** Authentication token manipulation error */
    PAM_AUTHTOK_RECOVERY_ERR = 21,  /** Authentication information
                                       cannot be recovered */
    PAM_AUTHTOK_LOCK_BUSY   = 22,   /** Authentication token lock busy */
    PAM_AUTHTOK_DISABLE_AGING = 23, /** Authentication token aging disabled */
    PAM_TRY_AGAIN           = 24,   /** Preliminary check by password service */
    PAM_IGNORE              = 25,   /** Ignore underlying account module */
                                    /** regardless of whether the control
                                       flag is required, optional, or sufficient */
    PAM_ABORT               = 26,   /** Critical error (?module fail now request) */
    PAM_AUTHTOK_EXPIRED     = 27,   /** user's authentication token has expired */
    PAM_MODULE_UNKNOWN      = 28,   /** module is not known */

    PAM_BAD_ITEM            = 29,   /** Bad item passed to pam_*_item() */
    PAM_CONV_AGAIN          = 30,   /** conversation function is event driven
                                       and data is not available yet */
    PAM_INCOMPLETE          = 31    /** please call this function again to
                                       complete authentication stack. Before
                                       calling again, verify that conversation
                                       is completed */

}
/*
 * Add new #define's here - take care to also extend the libpam code:
 * pam_strerror() and "libpam/pam_tokens.h" .
 */

//#define _PAM_RETURN_VALUES 32   /* this is the number of return values */


/* ---------------------- The Linux-PAM flags -------------------- */

/** Authentication service should not generate any messages */
    const uint PAM_SILENT                   = 0x8000U;

/* Note: these flags are used by pam_authenticate{,_secondary}() */

/* The authentication service should return PAM_AUTH_ERROR if the
 * user has a null authentication token */
    const uint PAM_DISALLOW_NULL_AUTHTOK    = 0x0001U;

/* Note: these flags are used for pam_setcred() */

/** Set user credentials for an authentication service */
    const uint PAM_ESTABLISH_CRED           = 0x0002U;
    
/** Delete user credentials associated with an authentication service */
    const uint PAM_DELETE_CRED              = 0x0004U;
    
/** Reinitialize user credentials */
    const uint PAM_REINITIALIZE_CRED        = 0x0008U;

/** Extend lifetime of user credentials */
    const uint PAM_REFRESH_CRED             = 0x0010U;

/* Note: these flags are used by pam_chauthtok */

/**
  The password service should only update those passwords that have aged.
  If this flag is not passed, the password service should update all passwords.
*/
    const uint PAM_CHANGE_EXPIRED_AUTHTOK   = 0x0020U;

/* ------------------ The Linux-PAM item types ------------------- */

/**
   These defines are used by pam_set_item() and pam_get_item().
   Please check the spec which are allowed for use by applications
   and which are only allowed for use by modules.
*/
    enum {
        PAM_SERVICE     = 1,	/** The service name */
        PAM_USER        = 2,	/** The user name */
        PAM_TTY         = 3,	/** The tty name */
        PAM_RHOST       = 4,	/** The remote host name */
        PAM_CONV        = 5,	/** The pam_conv structure */
        PAM_AUTHTOK     = 6,	/** The authentication token (password) */
        PAM_OLDAUTHTOK  = 7,	/** The old authentication token */
        PAM_RUSER       = 8,	/** The remote user name */
        PAM_USER_PROMPT = 9,    /** the prompt for getting a username
                                   Linux-PAM extensions */
        PAM_FAIL_DELAY  = 10,   /** app supplied function to override failure
				   delays */
        PAM_XDISPLAY    = 11,   /** X display name */
        PAM_XAUTHDATA   = 12,   /** X server authentication data */
        PAM_AUTHTOK_TYPE = 13   /** The type for pam_get_authtok */
    }
/* -------------- Special defines used by Linux-PAM -------------- */
/*
#if defined(__GNUC__) && defined(__GNUC_MINOR__)
# define PAM_GNUC_PREREQ(maj, min) \
        ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
#else
# define PAM_GNUC_PREREQ(maj, min) 0
#endif

#if PAM_GNUC_PREREQ(2,5)
# define PAM_FORMAT(params) __attribute__((__format__ params))
#else
# define PAM_FORMAT(params)
#endif

#if PAM_GNUC_PREREQ(3,3) && !defined(LIBPAM_COMPILE)
# define PAM_NONNULL(params) __attribute__((__nonnull__ params))
#else
# define PAM_NONNULL(params)
#endif
*/
/* ---------- Common Linux-PAM application/module PI ----------- */

extern(C) int pam_set_item(pam_handle_t *pamh, int item_type, const void *item);

extern(C) int pam_get_item(const pam_handle_t *pamh, int item_type, const void **item);

extern(C) char* pam_strerror(pam_handle_t *pamh, int errnum);

extern(C) int pam_putenv(pam_handle_t *pamh, const char *name_value);

extern(C) char* pam_getenv(pam_handle_t *pamh, const char *name);

extern(C) char ** pam_getenvlist(pam_handle_t *pamh);

/* ---------- Common Linux-PAM application/module PI ----------- */

/*
 * here are some proposed error status definitions for the
 * 'error_status' argument used by the cleanup function associated
 * with data items they should be logically OR'd with the error_status
 * of the latest return from libpam -- new with .52 and positive
 * impression from Sun although not official as of 1996/9/4
 * [generally the other flags are to be found in pam_modules.h]
 */

//#define PAM_DATA_SILENT    0x40000000     /* used to suppress messages... */

/*
 * here we define an externally (by apps or modules) callable function
 * that primes the libpam library to delay when a stacked set of
 * modules results in a failure. In the case of PAM_SUCCESS this delay
 * is ignored.
 *
 * Note, the pam_[gs]et_item(... PAM_FAIL_DELAY ...) can be used to set
 * a function pointer which can override the default fail-delay behavior.
 * This item was added to accommodate event driven programs that need to
 * manage delays more carefully.  The function prototype for this data
 * item is
 *     void (*fail_delay)(int status, unsigned int delay, void *appdata_ptr);
 */

//#define HAVE_PAM_FAIL_DELAY
//extern int pam_fail_delay(pam_handle_t *pamh, unsigned int musec_delay);

/* ------------ The Linux-PAM conversation structures ------------ */

    enum {
/** Message styles */
        PAM_PROMPT_ECHO_OFF = 1,
        PAM_PROMPT_ECHO_ON  = 2,
        PAM_ERROR_MSG       = 3,
        PAM_TEXT_INFO       = 4,

/* Linux-PAM specific types */
        PAM_RADIO_TYPE      = 5,    /** yes/no/maybe conditionals */

/** This is for server client non-human interaction.. these are NOT
   part of the X/Open PAM specification. */
        PAM_BINARY_PROMPT   = 7
    }

/** maximum size of messages/responses etc.. (these are mostly
   arbitrary so Linux-PAM should handle longer values). */
    const uint PAM_MAX_NUM_MSG      = 32;
    const uint PAM_MAX_MSG_SIZE     = 512;
    const uint PAM_MAX_RESP_SIZE    = 512;

/** Used to pass prompting text, error messages, or other informatory
 * text to the user.  This structure is allocated and freed by the PAM
 * library (or loaded module).  */

struct pam_message {
    int         msg_style;
    const char* msg;
};

/* if the pam_message.msg_style = PAM_BINARY_PROMPT
   the 'pam_message.msg' is a pointer to a 'const *' for the following
   pseudo-structure.  When used with a PAM_BINARY_PROMPT, the returned
   pam_response.resp pointer points to an object with the following
   structure:

   struct {
       u32 length;                         #  network byte order
       unsigned char type;
       unsigned char data[length-5];
   };

   The 'libpamc' library is designed around this flavor of
   message and should be used to handle this flavor of msg_style.
   */

/** Used to return the user's response to the PAM library.  This
   structure is allocated by the application program, and free()'d by
   the Linux-PAM library (or calling module).  */

struct pam_response {
    char*   resp;
    int     resp_retcode;   /** currently un-used, zero expected */
};

/** The actual conversation structure itself */
alias extern(C) int function(int num_msg, const pam_message **msg,
                             pam_response **resp, void *appdata_ptr)
    ConvCB;
struct pam_conv {
    ConvCB  conv;
    void*   appdata_ptr;
};

/**
   Used by the PAM_XAUTHDATA pam item.  Contains X authentication
   data used by modules to connect to the user's X display.  Note:
   this structure is intentionally compatible with xcb_auth_info_t.
*/
struct pam_xauth_data {
    int     namelen;
    char*   name;
    int     datalen;
    char*   data;
};
