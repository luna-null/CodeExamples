#include <cstdio>
#include <iostream>
#include <chrono>
#include <vector>

void counter(int *a, int b)
{
    while (*a != b) {
        if (*a < b) {
            (*a)++;
        } else if (*a > b) {
            (*a)--;
        }
    }
}

int main()
{
    int x = 1;
    int target = 1'000'000'000;

    auto start = std::chrono::high_resolution_clock::now();
    {
        counter(&x, target);
    }
    auto end = std::chrono::high_resolution_clock::now(); 

    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();

    std::cout << x << std::endl;
    std::cout << "Time taken: " << duration << " nanoseconds" << std::endl;
    std::vector<int> blah;
    blah.insert();
    return 0;
}
