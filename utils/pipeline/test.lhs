
; function: $0

; start LHS (in $0)
%0:i32 = var
%1 = and %0, 32:i32
infer %1


; start LHS (in $0)
%0:i32 = var
%1 = and %0, 32:i32
%2 = eq %1, 0:i32
infer %2


; function: $1

; start LHS (in $1)
%0:i32 = var
%1 = add %0, 256:i32
infer %1


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = slt %0, %1
infer %2


; start LHS (in $1)
%0:i32 = var
%1 = and %0, 73728:i32
infer %1


; start LHS (in $1)
%0:i32 = var
%1 = and %0, 73728:i32
%2 = eq %1, 0:i32
infer %2


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = slt %0, %1
%3:i32 = zext %2
%4:i32 = var
%5 = and %4, 73728:i32
%6 = eq %5, 0:i32
%7:i32 = zext %6
%8 = and %3, %7
infer %8


; start LHS (in $1)
%0:i32 = var
%1 = shl %0, 24:i32
%2:i32 = var
%3:i32 = var
%4 = slt %2, %3
%5:i32 = zext %4
%6:i32 = var
%7 = and %6, 73728:i32
%8 = eq %7, 0:i32
%9:i32 = zext %8
%10 = and %5, %9
%11 = ne %10, 0:i32
pc %11 1
infer %1


; start LHS (in $1)
%0:i32 = var
%1 = shl %0, 24:i32
%2 = ashr %1, 24:i32
%3:i32 = var
%4:i32 = var
%5 = slt %3, %4
%6:i32 = zext %5
%7:i32 = var
%8 = and %7, 73728:i32
%9 = eq %8, 0:i32
%10:i32 = zext %9
%11 = and %6, %10
%12 = ne %11, 0:i32
pc %12 1
infer %2


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = sub %0, %1
%3 = slt %1, %0
%4:i32 = zext %3
%5:i32 = var
%6 = and %5, 73728:i32
%7 = eq %6, 0:i32
%8:i32 = zext %7
%9 = and %4, %8
%10 = ne %9, 0:i32
pc %10 1
infer %2


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = sub %0, %1 (hasExternalUses)
%3 = ult %2, 256:i32
%4 = slt %1, %0
%5:i32 = zext %4
%6:i32 = var
%7 = and %6, 73728:i32
%8 = eq %7, 0:i32
%9:i32 = zext %8
%10 = and %5, %9
%11 = ne %10, 0:i32
pc %11 1
infer %3


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = sub %0, %1 (hasExternalUses)
%3 = ult 255:i32, %2
%4 = slt %1, %0
%5:i32 = zext %4
%6:i32 = var
%7 = and %6, 73728:i32
%8 = eq %7, 0:i32
%9:i32 = zext %8
%10 = and %5, %9
%11 = ne %10, 0:i32
pc %11 1
infer %3


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = sub %0, %1
%3 = sub %0, %1
%4 = ult 255:i32, %3
%5 = slt %1, %0
%6:i32 = zext %5
%7:i32 = var
%8 = and %7, 73728:i32
%9 = eq %8, 0:i32
%10:i32 = zext %9
%11 = and %6, %10
%12 = ne %11, 0:i32
pc %4 1
pc %12 1
infer %2


; start LHS (in $1)
%0:i32 = var
%1 = add %0, -256:i32
%2:i32 = var
%3:i32 = var
%4 = sub %2, %3
%5 = ult 255:i32, %4
%6 = slt %3, %2
%7:i32 = zext %6
%8:i32 = var
%9 = and %8, 73728:i32
%10 = eq %9, 0:i32
%11:i32 = zext %10
%12 = and %7, %11
%13 = ne %12, 0:i32
pc %5 1
pc %13 1
infer %1


; start LHS (in $1)
%0:i32 = var
%1 = add %0, -256:i32
%2 = ult 255:i32, %1
%3:i32 = var
%4:i32 = var
%5 = sub %3, %4
%6 = ult 255:i32, %5
%7 = slt %4, %3
%8:i32 = zext %7
%9:i32 = var
%10 = and %9, 73728:i32
%11 = eq %10, 0:i32
%12:i32 = zext %11
%13 = and %8, %12
%14 = ne %13, 0:i32
pc %6 1
pc %14 1
infer %2


; start LHS (in $1)
%0:i32 = var
%1:i32 = var
%2 = sub %0, %1
%3 = and %2, 255:i32
%4 = sub %0, %1
%5 = ult 255:i32, %4
%6 = slt %1, %0
%7:i32 = zext %6
%8:i32 = var
%9 = and %8, 73728:i32
%10 = eq %9, 0:i32
%11:i32 = zext %10
%12 = and %7, %11
%13 = ne %12, 0:i32
pc %5 1
pc %13 1
infer %3


; function: $2

; start LHS (in $2)
%0:i32 = var
%1 = slt 0:i32, %0
infer %1


; start LHS (in $2)
%0:i32 = var
%1:i32 = var
%2 = add %0, %1
infer %2


; start LHS (in $2)
%0:i32 = var
%1:i32 = var
%2 = add %0, %1 (hasExternalUses)
%3 = slt %2, %0
infer %3


; start LHS (in $2)
%0:i32 = var
%1 = slt 0:i32, %0
%2:i32 = zext %1
%3:i32 = var
%4 = add %3, %0 (hasExternalUses)
%5 = slt %4, %3
%6:i32 = zext %5
%7 = and %2, %6
infer %7


; start LHS (in $2)
%0:i32 = var
%1:i32 = var
%2 = add %0, %1 (hasExternalUses)
%3 = slt %2, 0:i32
infer %3


; start LHS (in $2)
%0:i32 = var
%1 = slt 0:i32, %0
%2:i32 = zext %1
%3:i32 = var
%4 = add %3, %0 (hasExternalUses)
%5 = slt %4, %3
%6:i32 = zext %5
%7 = and %2, %6
%8 = slt %4, 0:i32
%9:i32 = zext %8
%10 = or %7, %9
infer %10


; start LHS (in $2)
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3 = add %1, %2 (hasExternalUses)
%4 = slt %0, %3
infer %4


; start LHS (in $2)
%0:i32 = var
%1 = eq %0, 0:i32
%2:i32 = var
%3:i32 = var
%4:i32 = var
%5 = add %3, %4
%6 = slt %2, %5
pc %6 1
infer %1

