target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"


define None @foo(i1 %x1, i64 %x2) {
entry:
  %0 = icmp ult i64 135637824071393761, %x2
  %1 = or i1 %x1, %0
  %2 = select i1 %1, i64 135637824071393761, i64 %x2
  %3 = icmp ult i64 135637824071393761, %2
  ret None %3
}