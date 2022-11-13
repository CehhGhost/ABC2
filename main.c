#include <stdio.h>
#include <stdlib.h>

extern void get_maxsymb_and_minsymb(const char *line, int size, char* min, char* max);

int main(int argc, char *argv[]) {
    int size;
    int flag;
    int seed;
    char min;
    char max;
    if (argc == 2) {
        size = atoi(argv[1]);
        char line[size];
        FILE *input = fopen("input.txt", "r");
        fgets(line, size, input);
        fclose(input);
        FILE *output = fopen("output.txt", "w");
        get_maxsymb_and_minsymb(line, size, &min, &max);
        fprintf(output, "Minimum symb: %c\r\n", min);
        fprintf(output, "Maximum symb: %c", max);
        fclose(output);
        return 0;
    }
    printf("Set size of your line(>0 && <= %d)\r\n", 100);
    scanf("%d", &size);
    if (size < 1 || size > 100) {
        printf("Size is out of range\r\n");
        return 1;
    }
    char line[size];
    printf("Choose input: manual or random(0 = manual; other = random):\r\n");
    scanf("%d", &flag);
    if (flag == 0) {
        printf("\n");
        for (int i = 0; i < size; ++i) {
            printf("Line[%d] =", i);
            scanf("%s", line + i);
        }
        get_maxsymb_and_minsymb(line, size, &min, &max);
        printf("Minimum symb: %c\r\n", min);
        printf("Maximum symb: %c", max);
        return 0;
    }
    printf("Choose seed generation(>0 && <= 100):\r\n");
    scanf("%d", &seed);
    if (seed < 1 || seed > 100) {
        printf("Seed is out of range\r\n");
        return 1;
    }
    srand(seed);
    printf("Result Line: \r\n");
    for (int i = 0; i < size; ++i) {
        line[i] = (char)((int)'A' + rand() % ('Z' - 'A'));
        printf("Line[%d] = %c\r\n", i, *(line + i));
    }
    printf("\r\n");
    get_maxsymb_and_minsymb(line, size, &min, &max);
    printf("Minimum symb: %c\r\n", min);
    printf("Maximum symb: %c", max);
    return 0;
}

void get_maxsymb_and_minsymb(const char *line, int size, char* min, char* max) {
    int i;
    char symb;
    *min = line[0];
    *max = line[0];
    for (i = 1; i < size; ++i) {
        symb = line[i];
        if (symb > *max) {
            *max = symb;
        }
        if (symb < *min) {
            *min = symb;
        }
    }
}
