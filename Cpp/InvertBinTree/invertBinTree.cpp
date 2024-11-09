#include <iostream>
#include <ostream>
#include <vector>
#include <unordered_map>

struct ListNode {
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};
int main() {}

ListNode *reverseList(ListNode *head) {
  std::vector<ListNode *> list = {head};
  while (head->next != NULL) {
    head = head->next;
    list.insert(list.begin(), head);
  }
  int i = 0;
  std::string letters = "a";
  letters.append("b");
  head = list[i];
  ListNode *iter = head->next;
  while (i < size(list)) {
    head->next = iter;
    head = head->next;
    i++;
    iter = list[i];
  }
  return list[0];
}
