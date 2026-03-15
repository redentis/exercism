#if !defined(SPACE_AGE_H)
#define SPACE_AGE_H

namespace space_age {
    constexpr auto Earth_Year_Seconds   = 31557600.0;    

    constexpr auto Mercury_Year_Seconds = Earth_Year_Seconds * 0.2408467;
    constexpr auto Venus_Year_Seconds   = Earth_Year_Seconds * 0.61519726;
    constexpr auto Mars_Year_Seconds    = Earth_Year_Seconds * 1.8808158;
    constexpr auto Jupiter_Year_Seconds = Earth_Year_Seconds * 11.862615;
    constexpr auto Saturn_Year_Seconds  = Earth_Year_Seconds * 29.447498;
    constexpr auto Uranus_Year_Seconds  = Earth_Year_Seconds * 84.016846;
    constexpr auto Neptune_Year_Seconds = Earth_Year_Seconds * 164.79132;

    class space_age {
        public:
            space_age(unsigned long seconds) : _seconds{seconds} {};
            unsigned long seconds() const { return _seconds; } ;
            double on_earth() const { return _seconds /  Earth_Year_Seconds; };
            double on_mercury() const { return _seconds /  Mercury_Year_Seconds; };
            double on_venus() const { return _seconds /  Venus_Year_Seconds; };
            double on_mars() const { return _seconds /  Mars_Year_Seconds; };
            double on_jupiter() const { return _seconds /  Jupiter_Year_Seconds; };
            double on_saturn() const { return _seconds /  Saturn_Year_Seconds; };
            double on_uranus() const { return _seconds /  Uranus_Year_Seconds; };
            double on_neptune() const { return _seconds /  Neptune_Year_Seconds; };
        private:
            unsigned long _seconds;
        
    };
}  // namespace space_age

#endif // SPACE_AGE_H