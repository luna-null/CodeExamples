package main

func bogo_sort(array []int) []int {
	for !is_sorted(array) {
		shuffle(array)
	}
	return array
}
