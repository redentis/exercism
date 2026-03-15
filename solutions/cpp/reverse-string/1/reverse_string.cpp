#include <string>
#include <iterator>
#include "reverse_string.h"

namespace reverse_string {
    std::string reverse_string(const std::string& in) {
        std::string result(in.rbegin(), in.rend());
        return result;
    }
}  // namespace reverse_string
