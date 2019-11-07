int f(int cond, int z) {
    int x, y;
    if (cond) {
        x = 3 * z;
        y = z;
    } else {
        x = 2 * z;
        y = 2 * z;
    }
    return x + y;
}

