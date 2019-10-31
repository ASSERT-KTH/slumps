#[no_mangle]
pub extern "C" fn fuzz() {
    let input = sidefuzz::fetch_input(1);
    sidefuzz::black_box(fibonacci(input[0]));
}

pub fn fibonacci(n: u8) -> f64 {
    if n == 0 {
        panic!("zero is not a right argument to fibonacci()!");
    } else if n == 1 {
        return 1.0;
    }

    let mut sum = 0.0;
    let mut last = 0.0;
    let mut curr = 1.0;
    for _i in 1..n {
        sum = last + curr;
        last = curr;
        curr = sum;
    }
    sum
}
