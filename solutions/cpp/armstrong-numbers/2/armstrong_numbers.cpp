#include "armstrong_numbers.h"
#include <vector>
#include <numeric>

namespace armstrong_numbers {
    bool is_armstrong_number(const int candidate) {
        if (candidate >= 0 && candidate < 10) return true; // special case for 0 and any single digit number
        else {
            std::vector<int> digits {};
            for(auto m = candidate; m != 0; m /= 10) {            
                digits.push_back(m % 10);          
            }
            auto n = digits.size();
            auto sum = std::accumulate(digits.begin(), digits.end(), 0, [n](int a, int b){return a + pow(b, n);});
            return sum == candidate;
        }
    }
}  // namespace armstrong_numbers
