use subtle::ConstantTimeEq;

#[no_mangle]
pub extern "C" fn fuzz() {
  let input = sidefuzz::fetch_input(24);
  sidefuzz::black_box(input.ct_eq(b"CONSTANT TIME COMPARISON"));
}
