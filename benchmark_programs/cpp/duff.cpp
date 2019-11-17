/**
  More expressive control flow constructs are needed to 
  implement Duff's device effectively.
  See: 
  https://github.com/WebAssembly/design/blob/master/FutureFeatures.md#more-expressive-control-flow
  */
void send(char *to, char *from, unsigned long count)
{
  unsigned long n = (count + 7) / 8;
  switch (count % 8) {
  case 0: do { *to++ = *from++;
  case 7:      *to++ = *from++;
  case 6:      *to++ = *from++;
  case 5:      *to++ = *from++;
  case 4:      *to++ = *from++;
  case 3:      *to++ = *from++;
  case 2:      *to++ = *from++;
  case 1:      *to++ = *from++;
    } while (--n > 0);
  }
}
