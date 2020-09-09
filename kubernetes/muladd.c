#define SIZE 8989
int buffer[SIZE];

int muladd_loop(int xlen, int start, int end, int Y, int i, int c) {
    int hy = (Y >> 14);
    int ly = (Y & 0x3fff);

    for (int j = start; j < end; j++) {
        int x_j = buffer[j];
        int w_ji = buffer[j + i + xlen];

        int hx = (x_j >> 14);
        int lx = (x_j & 0x3fff);
        int cross = hx * ly + lx * hy;
        lx = w_ji + lx * ly + ((cross & 0x3fff) << 14) + c;
        c = (lx >> 28) + hx * hy + (cross >> 14);

        buffer[j + i + xlen] = lx & 0xfffffff;
    }

    return c;
}

int* get_buffer() {
    return &buffer[0];
}
