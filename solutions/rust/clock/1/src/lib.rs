use std::fmt;

const HOURS_PER_DAY:i32 = 24;
const MINUTES_PER_HOUR:i32 = 60;
const MINUTES_PER_DAY:i32 = HOURS_PER_DAY * MINUTES_PER_HOUR;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hours = self.minutes / 60;
        let mins  = self.minutes % 60;
        write!(f, "{:02}:{:02}", hours, mins)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: ((hours * MINUTES_PER_HOUR) + minutes).rem_euclid(MINUTES_PER_DAY)
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock {
            minutes: (self.minutes + minutes).rem_euclid(MINUTES_PER_DAY)
        }
    }
}
