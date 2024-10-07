from enum import Enum

class direction(Enum):
    LEFT = "left"
    RIGHT = "right"

class heap_node:
    def __init__(self, value = int, parent_node = None, left_child_node = None, right_child_node = None):
        self.value = value
        self.parent = parent_node
        self.left_child = left_child_node
        self.right_child = right_child_node

    def get_value(self):
        return self.value
    def get_parent_value(self):
        if self.parent.value is not None:
            return self.parent.value
        else:
            return None
    def get_child_value(self, direction: direction):
        if direction == direction.LEFT and self.left_child.value is not None:
            return self.left_child.value
        elif direction == direction.RIGHT and self.right_child.value is not None:
            return self.right_child.value
        return None


    
