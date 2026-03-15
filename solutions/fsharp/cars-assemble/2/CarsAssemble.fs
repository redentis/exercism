module CarsAssemble 

let successRate = function
    | s when s = 0  -> 0.0
    | s when s <= 4 -> 1.0
    | s when s <= 8 -> 0.9
    | 9             -> 0.8
    | 10            -> 0.77
    | _             -> 0.0

let productionRatePerHour (speed: int): float =
    221.0 * (successRate speed) * (float speed)

let workingItemsPerMinute (speed: int): int =
    (productionRatePerHour speed) / 60.0 |> int
