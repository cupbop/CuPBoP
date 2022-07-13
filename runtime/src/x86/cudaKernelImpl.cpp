#include "cudaKernelImpl.h"
#include <math.h>
double __nv_exp(double base) { return exp(base); }
double __nv_sqrt(double v) { return sqrt(v); }
float __nv_sqrtf(float v) { return sqrt(v); }
float __nv_powif(float base, int exp) { return pow(base, exp); }
float __nv_logf(float v) { return logf(v); }
float __nv_expf(float v) { return expf(v); }
float __nv_log10f(float v) { return log10f(v); }
float __nv_fast_log2f(float v) { return log2f(v); }
double __nv_powi(double base, int exp) { return pow(base, exp); }
float __nv_powf(float base, float exp) { return pow(base, exp); }
float __nv_fast_powf(float base, float exp) { return pow(base, exp); }
float __nv_fmodf(float x, float y) { return fmod(x, y); }
int __nv_isnanf(float v) { return isnan(v); }
int __nv_isinff(float v) { return isinf(v); }
float __nv_fabsf(float v) { return abs(v); }
double __nv_fabsd(double v) { return abs(v); }
double __nv_fmind(double a, double b) { return (a < b) ? a : b; }
double __nv_fmaxd(double a, double b) { return (a > b) ? a : b; }
int __nvvm_mul24_i(int a, int b) { return a * b; }
double _ZL3expd(double base) { return exp(base); }
double _ZL8copysigndd(double x, double y) { return y > 0 ? abs(x) : -abs(x); };
