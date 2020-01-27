#include <stdio.h>
#include <order/interpreter.h>

#define ORDER_PP_DEF_8fac ORDER_PP_FN( \
8fn(8X, 8seq_fold(8times, 1, 8seq_iota(1, 8inc(8X)))) )

int main(void) {
	printf("10! = %d\n", ORDER_PP( 8to_lit( 8fac(10) ) ) );
	return 0;
}/* <stdin>:2:10: fatal error: 'order/interpreter.h' file not found
#include <order/interpreter.h>
         ^~~~~~~~~~~~~~~~~~~~~
1 error generated.
 */