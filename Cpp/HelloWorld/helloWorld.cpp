#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>
#include <algorithm>
/*
 * This method prints out
 * Hello World!
 */
int main()
{
    int healthPoints = 100;
    float damage = 12.5;
    double legendarySummonChance = 0.001125;
    bool ownsCharacter = false;
    std::string hello = "Hello World!\n";
    std::cout << hello << hello.size() << "\n";
    std::sort(hello.begin(), hello.end());
    
    std::unordered_map<std::string, int> map;
    char a = 'a';
    char b = 'b';
    std::cout << (a ^ b) << "\n";

    std::vector<std::string> vec = {"1","2","3"};
}
