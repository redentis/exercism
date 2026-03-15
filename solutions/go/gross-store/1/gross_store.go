package gross

var defaultUnits = map[string]int{
        "quarter_of_a_dozen": 3,
        "half_of_a_dozen": 6,
        "dozen": 12,
        "small_gross": 120,
        "gross":  144,
        "great_gross": 1728}

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
    return defaultUnits
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return make(map[string]int)
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	quantity, found := units[unit]
    if found {
        existingQuantity, found := bill[item]
        if found {
            bill[item] = existingQuantity + quantity
        } else {
        	bill[item] = quantity
        }
    	return true
    } else {
    	return false
    }
	
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
    result := true
    existingQuantity,isOnBill := bill[item]
    adjustment, isKnownQuantity := units[unit]
    if isOnBill && isKnownQuantity {
        newQuantity := existingQuantity - adjustment
        switch {
            case newQuantity == 0:
                delete(bill, item)
            case newQuantity > 0:
                bill[item] = newQuantity
            default:
                result = false
        }
    } else {
    	result = false
    }
	return result
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (quantity int, isOnBill bool) {
    quantity, isOnBill = bill[item]
	return 
}
