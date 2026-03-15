#include <string>
#include <map>
#include "isogram.h"

namespace isogram {
    bool is_isogram(const std::string& s) {
        bool result = true;
        if(s.length() == 0) {
            return true;
        }
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

