package main

import (
	"math/rand"
	"time"
)

func swap(array []int, i int, j int) []int {
	array[i], array[j] = array[j], array[i]
	return array
}

func is_sorted(array []int) bool {
	for i := 0; i < len(array)-1; i++ {
		if array[i] > array[i+1] {
			return false
		}
	}
	return true
}

func shuffle(array []int) {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	for i := 0; i < len(array); i++ {
		j := r.Intn(len(array))
		array = swap(array, i, j)
	}
}

func merge(left, right []int) []int {
	result := []int{}
	i, j := 0, 0

	for i < len(left) && j < len(right) {
		if left[i] < right[j] {
			result = append(result, left[i])
			i++
		} else {
			result = append(result, right[j])
			j++
		}
	}

	result = append(result, left[i:]...)
	result = append(result, right[j:]...)

	return result
}

func heapify(array []int, n, i int) {
	largest := i     // Initialize largest as root
	left := 2*i + 1  // Left child
	right := 2*i + 2 // Right child

	// If left child is larger than root
	if left < n && array[left] > array[largest] {
		largest = left
	}

	// If right child is larger than the largest so far
	if right < n && array[right] > array[largest] {
		largest = right
	}

	// If the largest is not root
	if largest != i {
		swap(array, i, largest)
		// Recursively heapify the affected subtree
		heapify(array, n, largest)
	}
}

func remove(array []int, i int) []int {
	return append(array[:i], array[i+1:]...)
}
