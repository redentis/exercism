#include "atbash_cipher.h"
#include <string>
#include <map>
#include <vector>

namespace atbash_cipher {
    const std::string key_alphabet    = "abcdefghijklmnopqrstuvwxyz";
    const std::string cipher_alphabet = "zyxwvutsrqponmlkjihgfedcba";

    class grouped_string {
        public: 
            grouped_string(unsigned int size, char sep = ' ') : _buffer{}, _sep{sep}, _size{size} {}
            void push_back(char c) {
                _buffer.push_back(c);
                _chars++;                
                if(_chars > 0 && _chars % _size == 0) {
                    _buffer.push_back(_sep);
                }
  
            }
            std::string to_string() {
                if(_buffer.back() == _sep) _buffer.pop_back();
                return std::string(_buffer.begin(), _buffer.end());
            }
            ~grouped_string() {
                _buffer.clear();
            }
        private:
            std::vector<char> _buffer;
            char _sep;
            unsigned int _chars = 0;
            unsigned int _size;
    };
    
    std::string encode(const std::string& plaintext) {
        grouped_string raw_result{5};
        for(auto c : plaintext) {
            if(std::isdigit(c)) {
                raw_result.push_back(c);
            }
            else {
                auto i = key_alphabet.find(std::tolower(c));
                if(i != std::string::npos) {
                    raw_result.push_back(cipher_alphabet.at(i));
                }
            }
        }
        return raw_result.to_string();
    }

    std::string decode(const std::string& ciphertext) {
        std::string plaintext{};
        for(auto c : ciphertext) {
            if(std::isdigit(c)) {
                plaintext.push_back(c);
            }
            else {
                auto i = cipher_alphabet.find(c);
                if(i != std::string::npos)  {
                    plaintext.push_back(key_alphabet.at(i));
                }
            }
        }
        return plaintext;
    }
}  // namespace atbash_cipher
