import random
import time

'''
Create an animal class that sorts animals into pens based on their size.
'''

class Animal:

    def __init__(self, size: int, age: int, color: str):
        self.size = size
        self.age = age
        self.color = color

def sort_by_size(animals: list[Animal]) -> list[Animal]:
    new_animals = []
    if animals[0]:
        pivot = animals[0].size
        for animal in animals:
            if animal.size <= pivot:
                new_animals.append(animal)
                sort_by_size(new_animals)

    return new_animals


    return new_animals

def main():
    # elephant = Animal(24, 30, "gray")
    # horse = Animal(14, 25, "brown")
    # dog = Animal(7, 13, "brown")
    #
    # animal_list = [elephant, horse, dog]
    #
    # print("Hello World")
    #
    # print(sort_by_size(animal_list))
    #
    # print(quick_sort([1,8,4,6,2]))
    print(bogobogo_sort([1, 5, 3, 7, 8, 4, 1]))
    print(time.process_time())


def quick_sort(array: list[int]) -> list[int]:
    if len(array) <= 1:
        return array
    
    pivot = array[len(array) - 1]

    left = [x for x in array[:-1] if x <= pivot]
    right = [x for x in array[:-1] if x > pivot]

    return quick_sort(left) + [pivot] + quick_sort(right)


def is_sorted(arr):
    """Helper function to check if an array is sorted."""
    return all(arr[i] <= arr[i + 1] for i in range(len(arr) - 1))

def bogobogo_sort(arr):
    """Recursive implementation of the Bogobogo sort algorithm."""
    if len(arr) <= 1:
        return arr

    for i in range(1, len(arr)):
        # Sort the first i elements
        sorted_part = bogobogo_sort(arr[:i])
        
        # If the sorted part is not in order with the current element, reshuffle and retry
        if sorted_part + [arr[i]] != sorted(sorted_part + [arr[i]]):
            random.shuffle(arr)
            return bogobogo_sort(arr)

    return arr

main()

