package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
    val := 0
	switch card {
        case "ace":
    		val = 11
    	case "two":
    		val = 2
        case "three":
    		val = 3
        case "four":
    		val = 4
        case "five":
    		val = 5
        case "six":
    		val = 6
        case "seven":
    		val = 7
        case "eight":
    		val = 8
    	case "nine":
    		val = 9
        case "ten":   fallthrough
        case "jack":  fallthrough
    	case "queen": fallthrough
    	case "king":
    		val = 10
        default:
    		val = 0
    }
	return val
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
    var result string
    score := ParseCard(card1) + ParseCard(card2)
    dealerScore := ParseCard(dealerCard)
	switch {
        case card1 == "ace" && card2 == "ace":
    		result = "P"
        case score == 21:
    		if dealerScore < 10 {
    			result = "W"
            } else {
            	result = "S"
            }
		case score >= 17 && score <= 20:
    		result = "S"
    	case score >= 12 && score <= 16:
    		if dealerScore >= 7 {
        		result = "H"
            } else {
            	result = "S"
            }
    	case score <= 11:
    		result = "H"
        default:
    		result = "S"
    }
	return result
}
