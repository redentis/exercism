module CarsAssemble

let BASE_PRODUCTION_RATE = 221.0

let successRate (speed: int): float =
    let band_a = seq {1..4}
    let band_b = seq {5..8}
    if     Seq.contains speed band_a then 1.0
    elif Seq.contains speed band_b then 0.9 
    elif speed = 9 then 0.8
    elif speed = 10 then 0.77
    else 0.0

let productionRatePerHour (speed: int): float =
    BASE_PRODUCTION_RATE * (successRate speed) * (float speed)

let workingItemsPerMinute (speed: int): int =
    (productionRatePerHour speed) / 60.0
    |> int
