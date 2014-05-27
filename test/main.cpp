#include    <stdlib.h>
#include    <unistd.h>
#include    <readline/readline.h>
#include    <readline/history.h>
#include    "unittest.hh"
#include    <cstring>

int run_unittest();
int run_client(const char* username, const char* password);

int     main(int ac, char** av)
{
    return run_unittest();
}

int failure(const std::string& funcname, int retval, pam_handle_t* h)
{
    std::cerr << "[ERROR] " << funcname << " returned " << retval << std::endl;

    // Cleanup
    if (h != nullptr)
        if ((retval = pam_end(h, retval)) != PAM_SUCCESS)
            return failure("pam_end", retval, nullptr);

    return EXIT_FAILURE;
}

int ft_conv(int num_msg, const pam_message** msg, pam_response** resp, void* _par)
{
    struct pam_message* m = *((struct pam_message**)msg);
    struct pam_response* r = *resp;
    // ConvData* data = (ConvData*)_par;

    while (num_msg--) {
        // If response is not allocated
        if (r == NULL)
            *resp = r = (pam_response*)malloc(sizeof(*r));

        switch (m->msg_style) {
        case PAM_PROMPT_ECHO_ON:
            r->resp = readline(m->msg);
            break;
        case PAM_PROMPT_ECHO_OFF:
            r->resp = getpass(m->msg);
            break;
        case PAM_ERROR_MSG:
            fprintf(stderr, "[ERROR] %s\n", m->msg);
            break;

        case PAM_TEXT_INFO:
            fprintf(stdout, "[INFO] %s\n", m->msg);
            break;

        default:
            fprintf(stderr, "[INT-ERROR] Unknown message type: [%d]\n", m->msg_style);
            break;
        }
        ++m; ++r; // Next message / response
    }
    return PAM_SUCCESS;
}
