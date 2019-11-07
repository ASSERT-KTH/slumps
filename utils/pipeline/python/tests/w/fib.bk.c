int fn_fib(int local_0) {
    if (local_0 < 2) {
        return 1;
    }
    return fn_fib(local_0 - 2) + fn_fib(local_0 - 1);
}