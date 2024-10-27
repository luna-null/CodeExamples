package main

func shell_sort(array []int) []int {
	for gap := len(array) / 2; gap > 0; gap /= 2 {
		for i := gap; i < len(array); i++ {
			temp := array[i]
			var j int
			for j = i; j >= gap && array[j-gap] > temp; j -= gap {
				array[j] = array[j-gap]
			}
			array[j] = temp
		}
	}
	return array
}
