int f(int cond, int z){
    int x, y, k;
    if (cond) {      
        x = 2* z;  
        x += z;    
        y = z;       
    } else {
        x = 2 * z;
        y = 2 * z;
    }
    
    k = x;
    k = k + y;
    return k; 
}