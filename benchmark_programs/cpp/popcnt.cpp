int main(int a) {
  return __builtin_popcount(a) + 
         __builtin_popcount(a);
}

int count(unsigned int x) {
  int v = 0;
  while(x != 0) {
    x &= x - 1;
    v++;
  }
  return v;
}
