module Client.PAM.pam_appl;

public import Client.PAM.pam_types;

extern(C)
int pam_start(const char *service_name, const char *user,
              const pam_conv *pam_conversation,
              pam_handle_t **pamh);
extern(C) int pam_end(pam_handle_t *pamh, int pam_status);

/* Authentication API's */
extern(C) int pam_authenticate(pam_handle_t *pamh, int flags);
extern(C) int pam_setcred(pam_handle_t *pamh, int flags);

/* Account Management API's */
extern(C) int pam_acct_mgmt(pam_handle_t *pamh, int flags);

/* Session Management API's */
extern(C) int pam_open_session(pam_handle_t *pamh, int flags);
extern(C) int pam_close_session(pam_handle_t *pamh, int flags);

/* Password Management API's */
extern(C) int pam_chauthtok(pam_handle_t *pamh, int flags);
