package main

func quick_sort(array []int) []int {
	if len(array) <= 1 {
		return array
	}
	pivot := array[0]
	var left, right []int
	for i := 1; i < len(array); i++ {
		if array[i] <= pivot {
			left = append(left, array[i])
		} else {
			right = append(right, array[i])
		}
	}
	left = quick_sort(left)
	right = quick_sort(right)
	return append(append(left, pivot), right...)
}