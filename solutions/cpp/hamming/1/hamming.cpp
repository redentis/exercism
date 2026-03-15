#include <string>
#include <stdexcept>
#include "hamming.h"

namespace hamming {
    unsigned int compute(const std::string& left, const std::string& right) {
        if(left.length() != right.length())
            throw std::domain_error("arguments must be the same length");
        unsigned int result = 0;
        for(auto li=left.begin(), ri=right.begin(); li < left.end(); li++, ri++) {
            if (*li != *ri) result++;
        }
        return result;
    }
}  // namespace hamming
