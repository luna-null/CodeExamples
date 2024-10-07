package main

import(
    "fmt"
    "Sorting/utils"
)

func main() {
    // test_array := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    // fmt.Printf("\nTest Array: %d\n", test_array)
    // fmt.Printf("\nSelection Sort: %d\n", sorting.selection_sort(test_array))
    //
    // test_array2 := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    // fmt.Printf("\nInsertion Sort: %d\n", sorting.insertion_sort(test_array2))
    //
    // test_array3 := []int{1,5,3,2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    // fmt.Printf("\nBubble Sort: %d\n", sorting.bubble_sort(test_array3))
    //
    // test_array4 := []int{9,8,7,6,5,4,3,2,1}
    // fmt.Printf("\nBogo Sort: %d\n", sorting.bogo_sort(test_array4))

    // test_array5 := []int{2,6,2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
    // test_array5 := []int{9,8,7,6,5,4,3,2,1}
    // fmt.Printf("\nBogoBogo Sort: %d\n", sorting.bogobogo_sort(test_array5))

    // test_array6 := []int{9,8,7,6,5,4,3,2,1}
    // fmt.Printf("\nStalin Sort: %d\n", sorting.stalin_sort(test_array6))

    test_array7 := []int{1,2,3,9,8,7,6,5,4}
    fmt.Printf("\nQuick Sort: %d\n", utils.quick_sort(test_array7))
}

