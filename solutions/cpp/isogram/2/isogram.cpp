#include <string>
#include <map>
#include "isogram.h"

namespace isogram {
    bool is_isogram(const std::string& s) {
        bool result = true; // assume string is an isogram until proven otherwise
        std::map<char, size_t> counts;
        for(const auto c : s) {
            auto lc = std::tolower(c);
            ++counts[lc];
            if(lc != ' ' && lc != '-' && counts[lc] > 1) {
                result = false;
                break;
            }
        }
        return result;
    }
}  // namespace isogram

