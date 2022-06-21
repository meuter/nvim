#include <stdio.h>
#include <stdlib.h>

static int  x = 33;

int foo() {
    int toto =54;
    printf("foo\n");
    return 22;
}

int main() {
    int y = 44;
    foo();
    printf("hello world\n");
    return EXIT_SUCCESS;
}

