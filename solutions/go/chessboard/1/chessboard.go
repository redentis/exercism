package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

func CountInActualFile(f File) (result int) {
    result = 0
    for _,v := range f {
        if v {
            result++
        }
    }
	return
}
// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) (result int) {
    result = 0
	f,found := cb[file]
    if found {
    	result = CountInActualFile(f)    
    }
	return
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) (result int) {
	result = 0
	if rank >= 1 && rank <= 8 {
    	for _,file := range cb {
            if file[rank-1] {
                result += 1
            }
        }
    }
    return
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) (result int) {
	result = 0
	for _,f := range cb {
        result += len(f)
    }
    return
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) (result int) {
    result = 0
	for _,f := range cb {
      result += CountInActualFile(f)  
    }
	return
}
