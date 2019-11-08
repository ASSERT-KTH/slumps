; ModuleID = './python/tests/_paper/f2.ll'
source_filename = "./python/tests/_paper/f2.ll"

define i32 @f(i32 %cond, i32 %z) {
entry:
  %tobool = icmp ne i32 %cond, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %mul = mul nsw i32 3, %z
  br label %if.end

if.else:                                          ; preds = %entry
  %mul1 = mul nsw i32 2, %z
  %mul2 = mul nsw i32 2, %z
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %x.0 = phi i32 [ %mul, %if.then ], [ %mul1, %if.else ]
  %y.0 = phi i32 [ %z, %if.then ], [ %mul2, %if.else ]
  %add = add nsw i32 %x.0, %y.0
  ret i32 %add
}
