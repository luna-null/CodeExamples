#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    time_t t = 1435100000;
    struct tm *tmp;
    setenv("TZ", "America/Los_Angeles", 0);
    tzset();
    tmp = localtime(&t);
    printf("time = %d:%d\n", tmp->tm_hour, tmp->tm_min);
}
