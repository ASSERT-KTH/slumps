#include <stdio.h>
#include <stdlib.h>


int main () {
    int a[] = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1};
    int n = sizeof a / sizeof a[0];
    int i;
    for (i = 0; i < n; i++)
        printf("%d%s", a[i], i == n - 1 ? "\n" : " ");

    for (i = 0; i < n; i++)
        printf("%d%s", 1, i == n - 1 ? "\n" : " ");

    for (i = 0; i < n; i++)
        printf("%d%s", a[i], i == n - 1 ? "\n" : " ");
    return 0;
}
