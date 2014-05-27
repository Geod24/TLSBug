#ifndef _UNITTEST_H__
#define _UNITTEST_H__

#include    <string>
#include    <iostream>

#include    <security/pam_appl.h>
#include    <security/pam_modules.h>

// Utils //
int failure(const std::string& funcname, int retval, pam_handle_t*);

// Conversation function.
int ft_conv(int, const struct pam_message**, struct pam_response**, void*);

// Pam conv gets this as a param.
struct ConvData {
    bool    unittest;
};

#endif /* !_UNITTEST_H__ */
