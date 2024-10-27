package main

func insertion_sort(array []int) []int {

	for i := 0; i < len(array); i++ {
		for j := i; j > 0; j-- {
			if array[j] < array[j-1] {
				swap(array, j-1, j)
			}
		}
	}
	return array
}
