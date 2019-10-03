target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"


define i32 @foo(i32 %x1) {
entry:
  %0 = mul i32 2, %x1
  ret i32 %0
}
