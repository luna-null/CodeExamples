package utils
import(
    "math/rand"
    "time"
)


func SelectionSort(array []int) ([]int) {
    sorted := make([]int, len(array))
    for i := 0; i < len(sorted); i++ {
        var min int = array[i]
        var minIndex = 0
        for j := i+1; j < len(array); j++ {
            if array[j] < min {
                min = array[j]
                minIndex = j
            }
        }
        sorted[i] = min
        // Swap the found minimum with the current position
        if minIndex != i { // Only swap if minIndex is different from i
            array[minIndex], array[i] = array[i], array[minIndex]
        }
    }
    return sorted
}

func InsertionSort(array []int) []int {

    for i := 0; i < len(array); i++ {
        for j := i; j > 0; j-- {
            if array[j] < array[j-1] {
                swap(array, j-1, j)
            }
        }
    }
    return array
}


func BubbleSort(array []int) []int {
    for i := 0; i < len(array); i++ {
        for j := 0; j < len(array) - 1; j++ {
            if array[j] > array[j+1] {
                array = swap(array, j, j+1)
            }
        }
    }
    return array
}

func QuickSort(array []int) []int {
    if len(array) <= 1 {
        return array
    }
    pivot := array[0]
    var left,right []int
    for i := 1; i < len(array); i++ {
        if array[i] <= pivot {
            left = append(left, array[i])
        } else {
            right = append(right, array[i])
        }
    }
    left = QuickSort(left)
    right = QuickSort(right)
    return append(append(left, pivot), right...)
}

func MergeSort(array []int) []int {
    if len(array) <= 1 {
        return array
    }
    var merged []int
    var left, right []int = MergeSort(array[:(len(array)/2)]), MergeSort(array[(len(array)/2+1):])
    for i := 0; i < max(len(left), len(right)); i++ {
        
    }
    merged = append(merged, left...)
    return append(merged, right...)
}
func BogoSort(array []int) []int {
    for !IsSorted(array) {
        Shuffle(array)
    }
    return array
}

func BogobogoSort(array []int) []int {
    if len(array) == 1 {
        return array
    }
    BogobogoSort(array[:(len(array)-1)])

    if !IsSorted(array) {
        Shuffle(array)
        return BogobogoSort(array)
    }
    return array
}

func StalinSort(array []int) []int {
    if len(array) == 0 {
        return array
    }
    sorted := []int{array[0]}
    for i := 1; i < len(array); i++ {
        if array[i] >= sorted[len(sorted)-1] {
            sorted = append(sorted, array[i])
        }
    }
    return sorted
}

func swap(array []int, i int, j int) []int {
    array[i], array[j] = array[j], array[i]
    return array
}

func IsSorted(array []int) bool {
    for i := 0; i < len(array) - 1; i++ {
        if array[i] > array[i + 1] {
            return false
        }
    }
    return true
}

func Shuffle(array []int) {
    r := rand.New(rand.NewSource(time.Now().UnixNano()))
    for i := 0; i < len(array); i++ {
        j := r.Intn(len(array))
        array = swap(array, i, j)
    }
}

func remove(array []int, i int) []int {
    return append(array[:i], array[i+1:]...)
}


