#include "bob.h"
#include <string>
namespace bob {

    std::string trim(const std::string &s) {
        auto start = s.begin();
        while (start != s.end() && std::isspace(*start)) {
            start++;
        }
    
        auto end = s.end();
        do {
            end--;
        } while (std::distance(start, end) > 0 && std::isspace(*end));
    
        return std::string(start, end + 1);
    }

    std::string hey(const std::string& message) {
        auto clean_message = trim(message);

        // special case: early return
        if(clean_message.length() == 0)
            return "Fine. Be that way!";

        // shouting
        std::string just_alpha;
        std::copy_if(clean_message.begin(), clean_message.end(), std::back_inserter(just_alpha), [](char c){ return std::isalpha(c); });
        auto is_shouting = just_alpha.length() > 0 && std::all_of(just_alpha.begin(), just_alpha.end(), [](char c){ return std::isupper(c); });

        // questioning
        auto is_question = clean_message.back() == '?';
        
        if(is_question && is_shouting)
            return "Calm down, I know what I'm doing!";
        if(is_question)
            return "Sure.";
        if(is_shouting)
            return "Whoa, chill out!";
        return "Whatever.";
    }
}  // namespace bob
