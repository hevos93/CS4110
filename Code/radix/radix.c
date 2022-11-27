//Taken from https://www.programiz.com/dsa/radix-sort
// Radix Sort in C Programming

#include "radix.h"

// Function to get the largest element from an array
int getMax(int array[], int n) {
    int max = array[0];
    for (int i = 1; i < n; i++)
        if (array[i] > max)
            max = array[i];
    return max;
}

// Using counting sort to sort the elements in the basis of significant places
void countingSort(int array[], int size, int place) {
    int output[size + 1];
    int max = (array[0] / place) % 10;

    for (int i = 1; i < size; i++) {
        if (((array[i] / place) % 10) > max)
            max = array[i];
    }
    int count[6];

    for (int i = 0; i < max; ++i)
        count[i] = 0;

    // Calculate count of elements
    for (int i = 0; i < size; i++)
        count[(array[i] / place) % 10]++;

    // Calculate cumulative count
    for (int i = 1; i < 10; i++)
        count[i] += count[i - 1];

    // Place the elements in sorted order
    for (int i = size - 1; i >= 0; i--) {
        output[count[(array[i] / place) % 10] - 1] = array[i];
        count[(array[i] / place) % 10]--;
    }

    for (int i = 0; i < size; i++)
        array[i] = output[i];
}

// Main function to implement radix sort
void radixsort(int array[], int size) {
    // Get maximum element
    int max = getMax(array, size);

    // Apply counting sort to sort elements based on place value.
    for (int place = 1; max / place > 0; place *= 10)
        countingSort(array, size, place);
}

void radix(const char* input, int* output){
    #pragma HLS INTERFACE mode=s_axilite port=input
    #pragma HLS INTERFACE mode=s_axilite port=output

    int size_str = sizeof(input);
    int arr_counter=0;
    int counter = 0;
    char str[size_str];
    int array[size_str];

    while (counter<size_str){
        str[counter] = input[counter];
        printf("%c\t%c\n", str[counter], input[counter]);
        if(str[counter]==','){
            counter++;
        } else{
            int typecast = (int)(str[counter]);
            array[arr_counter]=typecast;
            printf("%c\n", array[arr_counter]);
            arr_counter++;
            counter++;
        }
    }
    //Use an existing array, this needs to be changed
    //int array[] = input;

    //Get the size of array
    int n = sizeof(array) / sizeof(array[0]);

    //Sort the array
    radixsort(array, n);
    *output = (int) array;
}
