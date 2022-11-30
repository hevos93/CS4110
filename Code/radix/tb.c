//
// Created by Hevos on 23.11.2022.
//

#include <stdint.h>
#include <stdio.h>
#include <string.h>

int tb_main(){
    char in[] = "2,3,4,5,6";
    int out;

    printf("\n Output: ");

    radix(in, out);
    printf("%d", out);
}
