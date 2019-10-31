use num_bigint_dig::BigUint;

#[no_mangle]
pub extern "C" fn fuzz() {
    let input = sidefuzz::fetch_input(32);
    sidefuzz::black_box(BigUint::from_bytes_be(input));
}