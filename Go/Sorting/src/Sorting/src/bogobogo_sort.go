package main

func bogobogo_sort(array []int) []int {
	if len(array) == 1 {
		return array
	}
	bogobogo_sort(array[:(len(array) - 1)])

	if !is_sorted(array) {
		shuffle(array)
		return bogobogo_sort(array)
	}
	return array
}
