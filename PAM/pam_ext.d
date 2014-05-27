module Client.PAM.pam_ext;

public import Client.PAM.pam_types;

//extern(C) void pam_vsyslog (const pam_handle_t *pamh, int priority,
//             const char *fmt, va_list args);

//extern(C) void pam_syslog (const pam_handle_t *pamh, int prio, const char *fmt, ...);

//extern(C) int pam_vprompt (pam_handle_t *pamh, int style, char **response,
//                           const char *fmt, va_list args);

//extern(C) int pam_prompt (pam_handle_t *pamh, int style, char **response,
//                       const char *fmt, ...);

//#define pam_error(pamh, fmt...)                       \
//	pam_prompt(pamh, PAM_ERROR_MSG, NULL, fmt)
//#define pam_verror(pamh, fmt, args)                           \
//	pam_vprompt(pamh, PAM_ERROR_MSG, NULL, fmt, args)

//#define pam_info(pamh, fmt...) pam_prompt(pamh, PAM_TEXT_INFO, NULL, fmt)
//#define pam_vinfo(pamh, fmt, args) pam_vprompt(pamh, PAM_TEXT_INFO, NULL, fmt, args)

extern(C) int pam_get_authtok (pam_handle_t *pamh, int item, const char **authtok,
                               const char *prompt);
extern(C) int pam_get_authtok_noverify (pam_handle_t *pamh, const char **authtok,
                                        const char *prompt);
extern(C) int pam_get_authtok_verify (pam_handle_t *pamh, const char **authtok,
                                      const char *prompt);
