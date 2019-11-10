
int nonCall(){
    int y = 10;

    return y + 20;
}

int a(int t){

    int x = 10 + 10;

    int i = nonCall();

    if(t){

        int y = x + x;

        int  z = x + y*2;

        return z;
    }

    int u = 10 + x;

    return u + i;
}


int main(){
    return a(10) + nonCall();
}