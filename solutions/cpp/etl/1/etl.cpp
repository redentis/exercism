#include <map>
#include <vector>
#include <stdexcept>
#include "etl.h"

namespace etl {
    std::map<char, int> transform(const std::map<int, std::vector<char>>& old) {
        std::map<char, int> result;
        for(const auto& [key, value] : old) { // C++17 feature to destructure map elements
            for(auto c : value) {
                result.insert({tolower(c), key});
            }
        }
        return result;
    }
}  // namespace etl
