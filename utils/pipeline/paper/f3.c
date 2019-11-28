unsigned g(unsigned a) {
    switch (a % 4) {
    case 0:
        a += 3;
        break;
    case 1:
        a += 2;
        break;
    case 2:
        a += 1;
        break;
    }
    return a & 3;
}

