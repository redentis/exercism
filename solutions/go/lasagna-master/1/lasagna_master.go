package lasagna

func PreparationTime(layers []string, averagePrepTime int) (result int) {
    if averagePrepTime == 0 {
        averagePrepTime = 2
    }
	result = len(layers) * averagePrepTime
    return
}

func Quantities(layers []string) (noodles int, sauce float64) {
	noodles = 0
    sauce = 0.0
    for _, element := range(layers) {
        switch element {
            case "noodles":
        		noodles += 50
        	case "sauce":
        		sauce += 0.2
        }
    }
	return 
}

func AddSecretIngredient(friendsList []string, myList []string) {
    myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(quantities []float64, scale int) (result []float64) {
    result = make([]float64, len(quantities))
    f_scale := float64(scale)
    for i,q := range(quantities) {
        result[i] = (q / 2.0) * f_scale
    }
	return
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
// 
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more 
// functionality.
