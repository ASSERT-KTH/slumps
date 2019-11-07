; ModuleID = 'souper.ll'
source_filename = "souper.ll"

define i8 @fun(i16, i4) {
entry:
  %2 = zext i4 %1 to i8
  %3 = trunc i16 %0 to i8
  %4 = and i8 %2, %3
  ret i8 %4
}
