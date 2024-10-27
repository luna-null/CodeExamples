package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {

	var wg sync.WaitGroup
	wg.Add(10)

	test_array := []int{1, 5, 3, 2, 6, 2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, selection_sort)
		fmt.Printf("\nSelection Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, insertion_sort)
		fmt.Printf("\nInsertion Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, bubble_sort)
		fmt.Printf("\nBubble Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, quick_sort)
		fmt.Printf("\nQuick Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, merge_sort)
		fmt.Printf("\nMerge Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		test_array2 := []int{1, 5, 3, 2, 6, 2, 12, 1, 5, 2, 7, 8, 2, 3, 6, 1}
		result, duration := shuffle_and_sort(test_array2, heap_sort)
		fmt.Printf("\nHeap Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		test_array2 := []int{1, 5, 3, 2, 6, 2, 12, 1, 5}
		result, duration := shuffle_and_sort(test_array2, bogo_sort)
		fmt.Printf("\nBogo Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		test_array2 := []int{1, 5, 3, 2, 6, 2, 12, 1, 5}
		result, duration := shuffle_and_sort(test_array2, bogobogo_sort)
		fmt.Printf("\nBogoBogo Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()

		result, duration := shuffle_and_sort(test_array, shell_sort)
		fmt.Printf("\nShell Sort: %d\nTook %s\n", result, duration)
	}()

	go func() {
		defer wg.Done()
		result, duration := shuffle_and_sort(test_array, stalin_sort)
		fmt.Printf("\nStalin Sort: %d\nTook %s\n", result, duration)
	}()

	wg.Wait()

}

func shuffle_and_sort(array []int, sorting_func func([]int) []int) ([]int, time.Duration) {

	shuffle(array)
	start := time.Now()

	sorting_func(array)
	duration := time.Since(start)

	return array, duration
}
