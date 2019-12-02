
/*
%0:i4 = var
%1:i4 = var
%2:i4 = mul %0, 7:i4
%3:i4 = mul %1, 7:i4
%4:i4 = add %2, %3
infer %4
*/

int a(int t, int u){
    
    int z = t * 7;
    int y = u * 7;

    int x = z + y;
    return x;
}