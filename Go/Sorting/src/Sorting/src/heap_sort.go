package main

func heap_sort(array []int) []int {
	n := len(array)

	// Build a maxheap (rearrange array)
	for i := n/2 - 1; i >= 0; i-- {
		heapify(array, n, i)
	}

	// One by one extract elements from the heap
	for i := n - 1; i > 0; i-- {
		// Move current root to the end
		swap(array, 0, i)

		// Call heapify on the reduced heap
		heapify(array, i, 0)
	}
	return array
}
