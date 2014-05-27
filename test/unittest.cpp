#include    <stdlib.h>
#include    "unittest.hh"

int run_unittest()
{
    std::string username = "xaqq";
    std::string password = "q";

    pam_conv        conv = { ft_conv, NULL };
    pam_handle_t*   pamh;
    struct passwd*  pwd;
    int             status;
    
    std::cout << "[CALL] pam_start : boapnet {" << username
              << ";" << password << "}" << std::endl;
    if ((status = pam_start("boapnet", username.c_str(), &conv, &pamh)) != PAM_SUCCESS)
        return failure("pam_start", status, NULL);

    // This will prompt for the password (which is q).
    // I currently don't know of any way to handle that programmatically.

    // Authenticate : This will fetch an API key.
    if ((status = pam_authenticate(pamh, 0) != PAM_SUCCESS))
        return failure("pam_authenticate", status, NULL);

    std::cout << "[CALL] pam_end" << std::endl;
    if ((status = pam_end(pamh, status)) != PAM_SUCCESS)
        return failure("pam_end", status, NULL);
    return EXIT_SUCCESS;
}
