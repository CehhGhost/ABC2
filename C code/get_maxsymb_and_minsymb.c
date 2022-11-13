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
