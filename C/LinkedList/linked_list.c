#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

struct Node 
{
	int value;
	struct Node* next_node;
	struct Node* prev_node;
};

struct Linked_List 
{
	struct Node* head;
	struct Node* tail;
	int length;
};


int size(struct Linked_List list)
{
	int counter = 0;
	struct Node* inode = NULL;
	if (list.head != NULL) {
		struct Node* inode = list.head;
		counter++;
	}
	while (inode != NULL) {
		inode = inode->next_node;
		counter++;
	}
	return counter;
}


struct Node add(struct Node* new_node, struct Node* prev_node)
{
	new_node ->next_node = prev_node->next_node;
	prev_node->next_node = new_node;
	new_node ->prev_node = prev_node;

	return *new_node;
}

int getIndex(struct Node* node)
{
	struct Node* index_node = node->prev_node;
	int counter = 0;
	while (index_node != NULL) {
		index_node = index_node->prev_node;
		counter++;
	}

	return counter;
}

struct Node append(struct Node* new_node, struct Node* prev_node)
{
	while (prev_node->next_node != NULL) {
		prev_node = prev_node->next_node;
	}
	prev_node->next_node = new_node;

	return *new_node;
}

struct Node addAtIndex(struct Node* new_node, struct Node* node_in_list, int* new_index)
{
	int index_node_in_list = getIndex(node_in_list);
	int index_diff = index_node_in_list - *new_index;

	if (index_diff == 0) {
	}
	else if (index_diff > 0) {
		while (index_diff != 0 || node_in_list->prev_node != NULL && index_diff != 1) {
			node_in_list = node_in_list->prev_node;
			index_diff--;
		}
		if (node_in_list->prev_node == NULL) {
			printf("Out of Bounds Exception: index not in linked list");
		}
	
	}
	else if (index_diff < 0) {
		while (index_diff != 0 || node_in_list->next_node != NULL && index_diff != -1) {
			node_in_list = node_in_list->next_node;
			index_diff++;
		}
		if (node_in_list->next_node == NULL) {
			printf("Out of Bounds Exception: index not in linked list");
		}
	}

	return *add(new_node, node_in_list);
}

int main()
{
	struct Node A = { 1, NULL, NULL};
	struct Node B = { 2, NULL, NULL};

	struct Linked_List ABC = { .head = &A, .tail = &A };

	A = append(&A,&B);

	printf("%d", size(ABC));
	return 0;
}
