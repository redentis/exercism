#include "leap.h"

namespace leap {
    bool is_leap_year(const unsigned int year) {
        bool result = false;
        if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
            result = true;
        }
        return result;
    }
}  // namespace leap
