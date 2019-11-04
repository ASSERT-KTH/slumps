fn fibonacci(n: u32) -> u32 {
    match n {
        0 => 1,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

fn main() {
    println!("Fibonacci generator");
    println!("{}", fibonacci(1));
    println!("{}", fibonacci(3));
    println!("{}", fibonacci(5));
}
