#include "reverse_string.h"

namespace reverse_string {

    std::string reverse_string(std::string s) {
        std::string reversed (s.rbegin(), s.rend());
        return reversed;
    }
}
