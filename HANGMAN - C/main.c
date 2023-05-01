#include <stdlib.h>
#include <stdio.h>
#include <time.h>

char *words[] = {"Penis", "Love", "Cocks"};

int main() {
    srand(time(0));

    char word[] = words[rand()%3];
    char discovered[sizeof(word)];
    discovered[1] = 'a';

    while(1) {
        break;    
    }

    return 0;
}