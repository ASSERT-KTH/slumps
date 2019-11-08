; ModuleID = '/Users/javier/Documents/Develop/slumps/utils/pipeline/python/tests/_dummy/dummy.c'
source_filename = "/Users/javier/Documents/Develop/slumps/utils/pipeline/python/tests/_dummy/dummy.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; Function Attrs: noinline nounwind ssp uwtable
define i32 @a(i32 %t) #0 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %u = alloca i32, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load i32, i32* %t.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 20, i32* %x, align 4
  %1 = load i32, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  %add = add nsw i32 %1, %2
  store i32 %add, i32* %y, align 4
  %3 = load i32, i32* %x, align 4
  %4 = load i32, i32* %y, align 4
  %mul = mul nsw i32 %4, 2
  %add1 = add nsw i32 %3, %mul
  store i32 %add1, i32* %z, align 4
  %5 = load i32, i32* %z, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 25, i32* %u, align 4
  %6 = load i32, i32* %u, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
