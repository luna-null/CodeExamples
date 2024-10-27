package main

func selection_sort(array []int) []int {
	sorted := make([]int, len(array))
	for i := 0; i < len(sorted); i++ {
		var min int = array[i]
		var minIndex = 0
		for j := i + 1; j < len(array); j++ {
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
