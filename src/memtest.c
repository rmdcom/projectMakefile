#include<stdlib.h>
#include<stdio.h>
int main(){

    printf("Hello Test\n");

    int *p = malloc(sizeof *p);

    *p = 45;

    return 0;
}