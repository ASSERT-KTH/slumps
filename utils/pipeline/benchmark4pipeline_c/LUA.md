**LUA Interpreter**

```
; No solver specified; listing all candidate replacements.

; Function: main
;[ORIGIN]   %11 = icmp eq %struct.lua_State* %10, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %19 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %20 = sext i32 %19 to i64
%0:i32 = var
%1:i64 = sext %0
infer %1

; Function: main
;[ORIGIN]   %25 = call i32 @lua_pcallk(%struct.lua_State* %24, i32 2, i32 1, i32 0, i32 0, i32 (%struct.lua_State*, i32, i32)* null)
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %27 = call i32 @lua_toboolean(%struct.lua_State* %26, i32 -1)
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %29 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %32 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %33 = icmp ne i32 %32, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %35 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %36 = icmp eq i32 %35, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %38 = phi i1 [ false, %16 ], [ %36, %34 ]
%0 = block 2
%1:i32 = var
%2:i1 = eq 0:i32, %1
%3:i1 = phi %0, 0:i1, %2
infer %3

; Function: main
;[ORIGIN]   %40 = select i1 %38, i32 0, i32 1
%0 = block 2
%1:i32 = var
%2:i1 = eq 0:i32, %1
%3:i1 = phi %0, 0:i1, %2
%4:i32 = select %3, 0:i32, 1:i32
infer %4

; Function: main
;[ORIGIN]   %42 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:l_message
;[ORIGIN]   %6 = icmp ne i8* %5, null
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %9 = call i64 @lua_tointegerx(%struct.lua_State* %8, i32 1, i32* null)
%0:i64 = var
infer %0 (demandedBits=0000000000000000000000000000000011111111111111111111111111111111)

; Function: t.bc:pmain
;[ORIGIN]   %10 = trunc i64 %9 to i32
%0:i64 = var
%1:i32 = trunc %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %15 = call i32 @collectargs(i8** %14, i32* %6)
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %20 = icmp ne i8* %19, null
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %26 = load i8, i8* %25, align 1
%0:i8 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %27 = sext i8 %26 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %28 = icmp ne i32 %27, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %34 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %35 = icmp eq i32 %34, 1
%0:i32 = var
%1:i1 = eq 1:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %38 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %42 = load i32, i32* %7, align 4
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000000000100)

; Function: t.bc:pmain
;[ORIGIN]   %43 = and i32 %42, 4
%0:i32 = var
%1:i32 = and 4:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %44 = icmp ne i32 %43, 0
%0:i32 = var
%1:i32 = and 4:i32, %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %47 = load i32, i32* %7, align 4
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000000010000)

; Function: t.bc:pmain
;[ORIGIN]   %48 = and i32 %47, 16
%0:i32 = var
%1:i32 = and 16:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %49 = icmp ne i32 %48, 0
%0:i32 = var
%1:i32 = and 16:i32, %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %57 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %58 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %61 = load i32, i32* %7, align 4
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000000010000)

; Function: t.bc:pmain
;[ORIGIN]   %62 = and i32 %61, 16
%0:i32 = var
%1:i32 = and 16:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %63 = icmp ne i32 %62, 0
%0:i32 = var
%1:i32 = and 16:i32, %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %66 = call i32 @handle_luainit(%struct.lua_State* %65)
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %67 = icmp ne i32 %66, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %73 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %74 = call i32 @runargs(%struct.lua_State* %71, i8** %72, i32 %73)
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %75 = icmp ne i32 %74, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %78 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %79 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %80 = icmp slt i32 %78, %79
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %84 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %86 = call i32 @handle_script(%struct.lua_State* %82, i8** %85)
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %87 = icmp ne i32 %86, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %90 = load i32, i32* %7, align 4
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000000000010)

; Function: t.bc:pmain
;[ORIGIN]   %91 = and i32 %90, 2
%0:i32 = var
%1:i32 = and 2:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %92 = icmp ne i32 %91, 0
%0:i32 = var
%1:i32 = and 2:i32, %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %96 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %97 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:pmain
;[ORIGIN]   %98 = icmp eq i32 %96, %97
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %100 = load i32, i32* %7, align 4
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000000001100)

; Function: t.bc:pmain
;[ORIGIN]   %101 = and i32 %100, 12
%0:i32 = var
%1:i32 = and 12:i32, %0
infer %1

; Function: t.bc:pmain
;[ORIGIN]   %102 = icmp ne i32 %101, 0
%0:i32 = var
%1:i32 = and 12:i32, %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:pmain
;[ORIGIN]   %109 = load i32, i32* %2, align 4
%0:i32 = var
infer %0

; Function: t.bc:report
;[ORIGIN]   %6 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:report
;[ORIGIN]   %7 = icmp ne i32 %6, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:report
;[ORIGIN]   %15 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %10 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %13 = icmp ne i8* %12, null
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %15 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %18 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %22 = load i8, i8* %21, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %23 = sext i8 %22 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %24 = icmp ne i32 %23, 45
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 45:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %26 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %29 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %33 = load i8, i8* %32, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %34 = sext i8 %33 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %37 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %41 = load i8, i8* %40, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %42 = sext i8 %41 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %43 = icmp ne i32 %42, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %46 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %47 = add nsw i32 %46, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %49 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %51 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %54 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %58 = load i8, i8* %57, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %59 = sext i8 %58 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %60 = icmp ne i32 %59, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %63 = load i32, i32* %6, align 4
%0:i32 = var
infer %0 (demandedBits=11111111111111111111111111101111)

; Function: t.bc:collectargs
;[ORIGIN]   %64 = or i32 %63, 16
%0:i32 = var
%1:i32 = or 16:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %67 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %71 = load i8, i8* %70, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %72 = sext i8 %71 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %73 = icmp ne i32 %72, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %77 = load i32, i32* %6, align 4
%0:i32 = var
infer %0 (demandedBits=11111111111111111111111111111101)

; Function: t.bc:collectargs
;[ORIGIN]   %78 = or i32 %77, 2
%0:i32 = var
%1:i32 = or 2:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %81 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %85 = load i8, i8* %84, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %86 = sext i8 %85 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %87 = icmp ne i32 %86, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %90 = load i32, i32* %6, align 4
%0:i32 = var
infer %0 (demandedBits=11111111111111111111111111111011)

; Function: t.bc:collectargs
;[ORIGIN]   %91 = or i32 %90, 4
%0:i32 = var
%1:i32 = or 4:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %93 = load i32, i32* %6, align 4
%0:i32 = var
infer %0 (demandedBits=11111111111111111111111111110111)

; Function: t.bc:collectargs
;[ORIGIN]   %94 = or i32 %93, 8
%0:i32 = var
%1:i32 = or 8:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %97 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %101 = load i8, i8* %100, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %102 = sext i8 %101 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %103 = icmp eq i32 %102, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 0:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %105 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %106 = add nsw i32 %105, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %108 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %111 = icmp eq i8* %110, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %114 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %118 = load i8, i8* %117, align 1
%0:i8 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %119 = sext i8 %118 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %120 = icmp eq i32 %119, 45
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 45:i32, %1
infer %2

; Function: t.bc:collectargs
;[ORIGIN]   %127 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %128 = add nsw i32 %127, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:collectargs
;[ORIGIN]   %130 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %132 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:collectargs
;[ORIGIN]   %134 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:print_usage
;[ORIGIN]   %10 = load i8, i8* %9, align 1
%0:i8 = var
infer %0

; Function: t.bc:print_usage
;[ORIGIN]   %11 = sext i8 %10 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:print_usage
;[ORIGIN]   %12 = icmp eq i32 %11, 101
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 101:i32, %1
infer %2

; Function: t.bc:print_usage
;[ORIGIN]   %16 = load i8, i8* %15, align 1
%0:i8 = var
infer %0

; Function: t.bc:print_usage
;[ORIGIN]   %17 = sext i8 %16 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:print_usage
;[ORIGIN]   %18 = icmp eq i32 %17, 108
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 108:i32, %1
infer %2

; Function: t.bc:print_version
;[ORIGIN]   %1 = call i32 @strlen(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.8, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %11 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %12 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %13 = icmp eq i32 %11, %12
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: t.bc:createargtable
;[ORIGIN]   %16 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %17 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %18 = add nsw i32 %17, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:createargtable
;[ORIGIN]   %19 = sub nsw i32 %16, %18
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1
%3:i32 = subnsw %0, %2
infer %3

; Function: t.bc:createargtable
;[ORIGIN]   %21 = load i32, i32* %10, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %22 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %23 = add nsw i32 %22, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:createargtable
;[ORIGIN]   %25 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %26 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %27 = icmp slt i32 %25, %26
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: t.bc:createargtable
;[ORIGIN]   %31 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %36 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %37 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %38 = sub nsw i32 %36, %37
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
infer %2

; Function: t.bc:createargtable
;[ORIGIN]   %39 = sext i32 %38 to i64
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
%3:i64 = sext %2
infer %3

; Function: t.bc:createargtable
;[ORIGIN]   %41 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:createargtable
;[ORIGIN]   %42 = add nsw i32 %41, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:handle_luainit
;[ORIGIN]   %10 = icmp eq i8* %9, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:handle_luainit
;[ORIGIN]   %17 = icmp eq i8* %16, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:handle_luainit
;[ORIGIN]   %22 = load i8, i8* %21, align 1
%0:i8 = var
infer %0

; Function: t.bc:handle_luainit
;[ORIGIN]   %23 = sext i8 %22 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:handle_luainit
;[ORIGIN]   %24 = icmp eq i32 %23, 64
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 64:i32, %1
infer %2

; Function: t.bc:handle_luainit
;[ORIGIN]   %29 = call i32 @dofile(%struct.lua_State* %26, i8* %28)
%0:i32 = var
infer %0

; Function: t.bc:handle_luainit
;[ORIGIN]   %34 = call i32 @dostring(%struct.lua_State* %31, i8* %32, i8* %33)
%0:i32 = var
infer %0

; Function: t.bc:handle_luainit
;[ORIGIN]   %36 = load i32, i32* %2, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %13 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %14 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %15 = icmp slt i32 %13, %14
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: t.bc:runargs
;[ORIGIN]   %18 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %22 = load i8, i8* %21, align 1
%0:i8 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %23 = sext i8 %22 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %24 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %27 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %32 = load i8, i8* %31, align 1
%0:i8 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %33 = sext i8 %32 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %34 = icmp eq i32 %33, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 0:i32, %1
infer %2

; Function: t.bc:runargs
;[ORIGIN]   %37 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %38 = add nsw i32 %37, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %42 = load i32, i32* %9, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %43 = icmp eq i32 %42, 101
%0:i32 = var
%1:i1 = eq 101:i32, %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %47 = call i32 @dostring(%struct.lua_State* %45, i8* %46, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %51 = call i32 @dolibrary(%struct.lua_State* %49, i8* %50)
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %53 = phi i32 [ %47, %44 ], [ %51, %48 ]
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %54 = load i32, i32* %10, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %55 = icmp ne i32 %54, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %62 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:runargs
;[ORIGIN]   %63 = add nsw i32 %62, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:runargs
;[ORIGIN]   %66 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %12 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %13 = icmp eq i32 %12, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:handle_script
;[ORIGIN]   %18 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %19 = icmp ne i32 %18, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:handle_script
;[ORIGIN]   %24 = call i32 @luaL_loadfilex(%struct.lua_State* %22, i8* %23, i8* null)
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %25 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %26 = icmp eq i32 %25, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:handle_script
;[ORIGIN]   %29 = call i32 @pushargs(%struct.lua_State* %28)
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %31 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %32 = call i32 @docall(%struct.lua_State* %30, i32 %31, i32 -1)
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %35 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:handle_script
;[ORIGIN]   %36 = call i32 @report(%struct.lua_State* %34, i32 %35)
%0:i32 = var
infer %0

; Function: t.bc:doREPL
;[ORIGIN]   %9 = call i32 @loadline(%struct.lua_State* %8)
%0:i32 = var
infer %0

; Function: t.bc:doREPL
;[ORIGIN]   %10 = icmp ne i32 %9, -1
%0:i32 = var
%1:i1 = ne 4294967295:i32, %0
infer %1

; Function: t.bc:doREPL
;[ORIGIN]   %12 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:doREPL
;[ORIGIN]   %13 = icmp eq i32 %12, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:doREPL
;[ORIGIN]   %16 = call i32 @docall(%struct.lua_State* %15, i32 0, i32 -1)
%0:i32 = var
infer %0

; Function: t.bc:doREPL
;[ORIGIN]   %18 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:doREPL
;[ORIGIN]   %19 = icmp eq i32 %18, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:doREPL
;[ORIGIN]   %24 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:dofile
;[ORIGIN]   %8 = call i32 @luaL_loadfilex(%struct.lua_State* %6, i8* %7, i8* null)
%0:i32 = var
infer %0

; Function: t.bc:dofile
;[ORIGIN]   %9 = call i32 @dochunk(%struct.lua_State* %5, i32 %8)
%0:i32 = var
infer %0

; Function: t.bc:dostring
;[ORIGIN]   %11 = call i32 @strlen(i8* %10)
%0:i32 = var
infer %0

; Function: t.bc:dostring
;[ORIGIN]   %13 = call i32 @luaL_loadbufferx(%struct.lua_State* %8, i8* %9, i32 %11, i8* %12, i8* null)
%0:i32 = var
infer %0

; Function: t.bc:dostring
;[ORIGIN]   %14 = call i32 @dochunk(%struct.lua_State* %7, i32 %13)
%0:i32 = var
infer %0

; Function: t.bc:dochunk
;[ORIGIN]   %5 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:dochunk
;[ORIGIN]   %6 = icmp eq i32 %5, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:dochunk
;[ORIGIN]   %9 = call i32 @docall(%struct.lua_State* %8, i32 0, i32 0)
%0:i32 = var
infer %0

; Function: t.bc:dochunk
;[ORIGIN]   %12 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:dochunk
;[ORIGIN]   %13 = call i32 @report(%struct.lua_State* %11, i32 %12)
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %10 = call i32 @lua_gettop(%struct.lua_State* %9)
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %11 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %12 = sub nsw i32 %10, %11
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
infer %2

; Function: t.bc:docall
;[ORIGIN]   %15 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %19 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %20 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %21 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %22 = call i32 @lua_pcallk(%struct.lua_State* %18, i32 %19, i32 %20, i32 %21, i32 0, i32 (%struct.lua_State*, i32, i32)* null)
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %25 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:docall
;[ORIGIN]   %27 = load i32, i32* %7, align 4
%0:i32 = var
infer %0

; Function: t.bc:msghandler
;[ORIGIN]   %8 = icmp eq i8* %7, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:msghandler
;[ORIGIN]   %11 = call i32 @luaL_callmeta(%struct.lua_State* %10, i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:msghandler
;[ORIGIN]   %12 = icmp ne i32 %11, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:msghandler
;[ORIGIN]   %15 = call i32 @lua_type(%struct.lua_State* %14, i32 -1)
%0:i32 = var
infer %0

; Function: t.bc:msghandler
;[ORIGIN]   %16 = icmp eq i32 %15, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: t.bc:msghandler
;[ORIGIN]   %22 = call i32 @lua_type(%struct.lua_State* %21, i32 1)
%0:i32 = var
infer %0

; Function: t.bc:msghandler
;[ORIGIN]   %31 = load i32, i32* %2, align 4
%0:i32 = var
infer %0

; Function: t.bc:laction
;[ORIGIN]   %3 = load i32, i32* %2, align 4
%0:i32 = var
infer %0

; Function: t.bc:dolibrary
;[ORIGIN]   %12 = call i32 @docall(%struct.lua_State* %11, i32 1, i32 1)
%0:i32 = var
infer %0

; Function: t.bc:dolibrary
;[ORIGIN]   %13 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:dolibrary
;[ORIGIN]   %14 = icmp eq i32 %13, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:dolibrary
;[ORIGIN]   %20 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:dolibrary
;[ORIGIN]   %21 = call i32 @report(%struct.lua_State* %19, i32 %20)
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %6 = call i32 @lua_getglobal(%struct.lua_State* %5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %7 = icmp ne i32 %6, 5
%0:i32 = var
%1:i1 = ne 5:i32, %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %13 = call i64 @luaL_len(%struct.lua_State* %12, i32 -1)
%0:i64 = var
infer %0 (demandedBits=0000000000000000000000000000000011111111111111111111111111111111)

; Function: t.bc:pushargs
;[ORIGIN]   %14 = trunc i64 %13 to i32
%0:i64 = var
%1:i32 = trunc %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %16 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %17 = add nsw i32 %16, 3
%0:i32 = var
%1:i32 = addnsw 3:i32, %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %19 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %20 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %21 = icmp sle i32 %19, %20
%0:i32 = var
%1:i32 = var
%2:i1 = sle %0, %1
infer %2

; Function: t.bc:pushargs
;[ORIGIN]   %24 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %25 = sub nsw i32 0, %24
%0:i32 = var
%1:i32 = subnsw 0:i32, %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %26 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %27 = sext i32 %26 to i64
%0:i32 = var
%1:i64 = sext %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %30 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %31 = add nsw i32 %30, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %34 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushargs
;[ORIGIN]   %35 = sub nsw i32 0, %34
%0:i32 = var
%1:i32 = subnsw 0:i32, %0
infer %1

; Function: t.bc:pushargs
;[ORIGIN]   %37 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:loadline
;[ORIGIN]   %7 = call i32 @pushline(%struct.lua_State* %6, i32 1)
%0:i32 = var
infer %0

; Function: t.bc:loadline
;[ORIGIN]   %8 = icmp ne i32 %7, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:loadline
;[ORIGIN]   %12 = call i32 @addreturn(%struct.lua_State* %11)
%0:i32 = var
infer %0

; Function: t.bc:loadline
;[ORIGIN]   %13 = icmp ne i32 %12, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:loadline
;[ORIGIN]   %16 = call i32 @multiline(%struct.lua_State* %15)
%0:i32 = var
infer %0

; Function: t.bc:loadline
;[ORIGIN]   %20 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:loadline
;[ORIGIN]   %22 = load i32, i32* %2, align 4
%0:i32 = var
infer %0

; Function: t.bc:l_print
;[ORIGIN]   %5 = call i32 @lua_gettop(%struct.lua_State* %4)
%0:i32 = var
infer %0

; Function: t.bc:l_print
;[ORIGIN]   %6 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:l_print
;[ORIGIN]   %7 = icmp sgt i32 %6, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: t.bc:l_print
;[ORIGIN]   %14 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:l_print
;[ORIGIN]   %15 = call i32 @lua_pcallk(%struct.lua_State* %13, i32 %14, i32 0, i32 0, i32 0, i32 (%struct.lua_State*, i32, i32)* null)
%0:i32 = var
infer %0

; Function: t.bc:l_print
;[ORIGIN]   %16 = icmp ne i32 %15, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %13 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %24 = icmp ne i8* %23, null
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %25 = zext i1 %24 to i32
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: t.bc:pushline
;[ORIGIN]   %26 = load i32, i32* %10, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %27 = icmp eq i32 %26, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %32 = call i32 @strlen(i8* %31)
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %33 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %34 = icmp ugt i32 %33, 0
%0:i32 = var
%1:i1 = ult 0:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %37 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %38 = sub i32 %37, 1
%0:i32 = var
%1:i32 = sub %0, 1:i32
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %40 = load i8, i8* %39, align 1
%0:i8 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %41 = sext i8 %40 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %42 = icmp eq i32 %41, 10
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 10:i32, %1
infer %2

; Function: t.bc:pushline
;[ORIGIN]   %45 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %46 = add i32 %45, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %49 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %50 = icmp ne i32 %49, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %54 = load i8, i8* %53, align 1
%0:i8 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %55 = sext i8 %54 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:pushline
;[ORIGIN]   %56 = icmp eq i32 %55, 61
%0:i8 = var
%1:i32 = sext %0
%2:i1 = eq 61:i32, %1
infer %2

; Function: t.bc:pushline
;[ORIGIN]   %65 = load i32, i32* %8, align 4
%0:i32 = var
infer %0

; Function: t.bc:pushline
;[ORIGIN]   %71 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:addreturn
;[ORIGIN]   %14 = call i32 @strlen(i8* %13)
%0:i32 = var
infer %0

; Function: t.bc:addreturn
;[ORIGIN]   %15 = call i32 @luaL_loadbufferx(%struct.lua_State* %11, i8* %12, i32 %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* null)
%0:i32 = var
infer %0

; Function: t.bc:addreturn
;[ORIGIN]   %16 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:addreturn
;[ORIGIN]   %17 = icmp eq i32 %16, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:addreturn
;[ORIGIN]   %23 = load i8, i8* %22, align 1
%0:i8 = var
infer %0

; Function: t.bc:addreturn
;[ORIGIN]   %24 = sext i8 %23 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: t.bc:addreturn
;[ORIGIN]   %25 = icmp ne i32 %24, 0
%0:i8 = var
%1:i32 = sext %0
%2:i1 = ne 0:i32, %1
infer %2

; Function: t.bc:addreturn
;[ORIGIN]   %33 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %11 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %12 = call i32 @luaL_loadbufferx(%struct.lua_State* %9, i8* %10, i32 %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* null)
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %14 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %15 = call i32 @incomplete(%struct.lua_State* %13, i32 %14)
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %16 = icmp ne i32 %15, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:multiline
;[ORIGIN]   %19 = call i32 @pushline(%struct.lua_State* %18, i32 0)
%0:i32 = var
infer %0

; Function: t.bc:multiline
;[ORIGIN]   %20 = icmp ne i32 %19, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:multiline
;[ORIGIN]   %24 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:get_prompt
;[ORIGIN]   %7 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:get_prompt
;[ORIGIN]   %8 = icmp ne i32 %7, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:get_prompt
;[ORIGIN]   %15 = icmp eq i8* %14, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:get_prompt
;[ORIGIN]   %17 = load i32, i32* %4, align 4
%0:i32 = var
infer %0

; Function: t.bc:get_prompt
;[ORIGIN]   %18 = icmp ne i32 %17, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: t.bc:incomplete
;[ORIGIN]   %8 = load i32, i32* %5, align 4
%0:i32 = var
infer %0

; Function: t.bc:incomplete
;[ORIGIN]   %9 = icmp eq i32 %8, 3
%0:i32 = var
%1:i1 = eq 3:i32, %0
infer %1

; Function: t.bc:incomplete
;[ORIGIN]   %13 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:incomplete
;[ORIGIN]   %14 = icmp uge i32 %13, 5
%0:i32 = var
%1:i1 = ule 5:i32, %0
infer %1

; Function: t.bc:incomplete
;[ORIGIN]   %17 = load i32, i32* %6, align 4
%0:i32 = var
infer %0

; Function: t.bc:incomplete
;[ORIGIN]   %20 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0))
%0:i32 = var
infer %0

; Function: t.bc:incomplete
;[ORIGIN]   %21 = icmp eq i32 %20, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: t.bc:incomplete
;[ORIGIN]   %27 = load i32, i32* %3, align 4
%0:i32 = var
infer %0

```