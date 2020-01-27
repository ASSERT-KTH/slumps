#ifndef _POLIFITGSL_H
#define _POLIFITGSL_H
#include <gsl/gsl_multifit.h>
#include <stdbool.h>
#include <math.h>
bool polynomialfit(int obs, int degree, 
		   double *dx, double *dy, double *store); /* n, p */
#endif/* <stdin>:3:10: fatal error: 'gsl/gsl_multifit.h' file not found
#include <gsl/gsl_multifit.h>
         ^~~~~~~~~~~~~~~~~~~~
1 error generated.
 */