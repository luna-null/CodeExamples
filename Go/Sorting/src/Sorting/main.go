package main

import(
    "fmt"
    "github.com/luna-null/go-sorting/utils"
)

func main() {
    test_array := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    fmt.Printf("\nTest Array: %d\n", test_array)
    fmt.Printf("\nSelection Sort: %d\n", utils.SelectionSort(test_array))

    test_array2 := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    fmt.Printf("\nInsertion Sort: %d\n", utils.InsertionSort(test_array2))

    test_array3 := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    fmt.Printf("\nBubble Sort: %d\n", utils.BubbleSort(test_array3))

    test_array4 := []int{9,8,7,6,5,4,3,2,1}
    fmt.Printf("\nBogo Sort: %d\n", utils.BogoSort(test_array4))

    test_array6 := []int{9,8,7,6,5,4,3,2,1}
    fmt.Printf("\nBogoBogo Sort: %d\n", utils.BogobogoSort(test_array6))

    test_array7 := []int{9,8,7,6,5,4,3,2,1}
    fmt.Printf("\nStalin Sort: %d\n", utils.StalinSort(test_array7))

    test_array8 := []int{1,2,3,9,8,7,6,5,4}
    fmt.Printf("\nQuick Sort: %d\n", utils.QuickSort(test_array8))
}

