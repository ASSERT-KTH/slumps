int a(int t){

    int x = 10 + 10;

    if(t){

        int y = x + x;

        int  z = x + y*2;

        return z;
    }

    int u = 10 + x;

    return u;
}