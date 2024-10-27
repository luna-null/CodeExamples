package main

func bubble_sort(array []int) []int {
	for i := 0; i < len(array); i++ {
		for j := 0; j < len(array)-1; j++ {
			if array[j] > array[j+1] {
				array = swap(array, j, j+1)
			}
		}
	}
	return array
}
