#[no_mangle]
pub extern "C" fn fuzz() {
    let input = sidefuzz::fetch_input(28);
    sidefuzz::black_box(not_constant_time_comparison(input));
}

fn not_constant_time_comparison(message: &[u8]) -> bool {
    message == b"NOT CONSTANT TIME COMPARISON"
}
