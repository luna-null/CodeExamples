package main

func stalin_sort(array []int) []int {
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
