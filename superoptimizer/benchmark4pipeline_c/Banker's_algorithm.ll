; ModuleID = 'benchmark4pipeline_c/Banker's_algorithm.c'
source_filename = "benchmark4pipeline_c/Banker's_algorithm.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str = private unnamed_addr constant [33 x i8] c"\0AEnter the number of resources: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"\0AEnter the number of processes: \00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"\0AEnter Claim Vector: \00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"\0AEnter Allocated Resource Table: \00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AEnter Maximum Claim table: \00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"\0AThe Claim Vector is: \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"\09%d\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"\0AAllocated resources: \00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"\0AAvailable resources: \00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"\0AProcess%d is executing.\0A\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"\0AThe processes are in unsafe state.\00", align 1
@.str.16 = private unnamed_addr constant [31 x i8] c"\0AThe process is in safe state.\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"\0AAvailable vector: \00", align 1
@str = private unnamed_addr constant [31 x i8] c"\0AThe Allocated Resource Table:\00"
@str.18 = private unnamed_addr constant [26 x i8] c"\0AThe Maximum Claim Table:\00"

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  %2 = alloca [5 x [5 x i32]], align 16
  %3 = alloca [5 x i32], align 16
  %4 = alloca [5 x i32], align 16
  %5 = alloca [5 x i32], align 16
  %6 = alloca [5 x i32], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = bitcast [5 x [5 x i32]]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %9) #4
  %10 = bitcast [5 x [5 x i32]]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %10) #4
  %11 = bitcast [5 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %11) #4
  %12 = bitcast [5 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %12) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull %12, i8 0, i32 20, i32 16, i1 false)
  %13 = bitcast [5 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %13) #4
  %14 = bitcast [5 x i32]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %14) #4
  %15 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #4
  %16 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #4
  %17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0))
  %18 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %7) #4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0))
  %20 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %8) #4
  %21 = load i32, i32* %8, align 4, !tbaa !2
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %0
  br label %24

; <label>:24:                                     ; preds = %23, %24
  %25 = phi i32 [ %27, %24 ], [ 0, %23 ]
  %26 = getelementptr inbounds [5 x i32], [5 x i32]* %6, i32 0, i32 %25
  store i32 1, i32* %26, align 4, !tbaa !2
  %27 = add nuw nsw i32 %25, 1
  %28 = icmp slt i32 %27, %21
  br i1 %28, label %24, label %29

; <label>:29:                                     ; preds = %24, %0
  %30 = phi i32 [ 0, %0 ], [ %27, %24 ]
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0))
  %32 = load i32, i32* %7, align 4, !tbaa !2
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %42

; <label>:34:                                     ; preds = %29
  br label %35

; <label>:35:                                     ; preds = %34, %35
  %36 = phi i32 [ %39, %35 ], [ 0, %34 ]
  %37 = getelementptr inbounds [5 x i32], [5 x i32]* %5, i32 0, i32 %36
  %38 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %37) #4
  %39 = add nuw nsw i32 %36, 1
  %40 = load i32, i32* %7, align 4, !tbaa !2
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %35, label %42

; <label>:42:                                     ; preds = %35, %29
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0))
  %44 = load i32, i32* %8, align 4, !tbaa !2
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %68

; <label>:46:                                     ; preds = %42
  %47 = load i32, i32* %7, align 4, !tbaa !2
  br label %48

; <label>:48:                                     ; preds = %46, %63
  %49 = phi i32 [ %44, %46 ], [ %64, %63 ]
  %50 = phi i32 [ %47, %46 ], [ %65, %63 ]
  %51 = phi i32 [ 0, %46 ], [ %66, %63 ]
  %52 = icmp sgt i32 %50, 0
  br i1 %52, label %53, label %63

; <label>:53:                                     ; preds = %48
  br label %54

; <label>:54:                                     ; preds = %53, %54
  %55 = phi i32 [ %58, %54 ], [ 0, %53 ]
  %56 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 %51, i32 %55
  %57 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %56) #4
  %58 = add nuw nsw i32 %55, 1
  %59 = load i32, i32* %7, align 4, !tbaa !2
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %54, label %61

; <label>:61:                                     ; preds = %54
  %62 = load i32, i32* %8, align 4, !tbaa !2
  br label %63

; <label>:63:                                     ; preds = %61, %48
  %64 = phi i32 [ %62, %61 ], [ %49, %48 ]
  %65 = phi i32 [ %59, %61 ], [ %50, %48 ]
  %66 = add nuw nsw i32 %51, 1
  %67 = icmp slt i32 %66, %64
  br i1 %67, label %48, label %68

; <label>:68:                                     ; preds = %63, %42
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  %70 = load i32, i32* %8, align 4, !tbaa !2
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %72, label %94

; <label>:72:                                     ; preds = %68
  %73 = load i32, i32* %7, align 4, !tbaa !2
  br label %74

; <label>:74:                                     ; preds = %72, %89
  %75 = phi i32 [ %70, %72 ], [ %90, %89 ]
  %76 = phi i32 [ %73, %72 ], [ %91, %89 ]
  %77 = phi i32 [ 0, %72 ], [ %92, %89 ]
  %78 = icmp sgt i32 %76, 0
  br i1 %78, label %79, label %89

; <label>:79:                                     ; preds = %74
  br label %80

; <label>:80:                                     ; preds = %79, %80
  %81 = phi i32 [ %84, %80 ], [ 0, %79 ]
  %82 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %2, i32 0, i32 %77, i32 %81
  %83 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %82) #4
  %84 = add nuw nsw i32 %81, 1
  %85 = load i32, i32* %7, align 4, !tbaa !2
  %86 = icmp slt i32 %84, %85
  br i1 %86, label %80, label %87

; <label>:87:                                     ; preds = %80
  %88 = load i32, i32* %8, align 4, !tbaa !2
  br label %89

; <label>:89:                                     ; preds = %87, %74
  %90 = phi i32 [ %88, %87 ], [ %75, %74 ]
  %91 = phi i32 [ %85, %87 ], [ %76, %74 ]
  %92 = add nuw nsw i32 %77, 1
  %93 = icmp slt i32 %92, %90
  br i1 %93, label %74, label %94

; <label>:94:                                     ; preds = %89, %68
  %95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0))
  %96 = load i32, i32* %7, align 4, !tbaa !2
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %98, label %107

; <label>:98:                                     ; preds = %94
  br label %99

; <label>:99:                                     ; preds = %98, %99
  %100 = phi i32 [ %104, %99 ], [ 0, %98 ]
  %101 = getelementptr inbounds [5 x i32], [5 x i32]* %5, i32 0, i32 %100
  %102 = load i32, i32* %101, align 4, !tbaa !2
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %102)
  %104 = add nuw nsw i32 %100, 1
  %105 = load i32, i32* %7, align 4, !tbaa !2
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %99, label %107

; <label>:107:                                    ; preds = %99, %94
  %108 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str, i32 0, i32 0))
  %109 = load i32, i32* %8, align 4, !tbaa !2
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %111, label %130

; <label>:111:                                    ; preds = %107
  br label %112

; <label>:112:                                    ; preds = %111, %125
  %113 = phi i32 [ %127, %125 ], [ 0, %111 ]
  %114 = load i32, i32* %7, align 4, !tbaa !2
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %125

; <label>:116:                                    ; preds = %112
  br label %117

; <label>:117:                                    ; preds = %116, %117
  %118 = phi i32 [ %122, %117 ], [ 0, %116 ]
  %119 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 %113, i32 %118
  %120 = load i32, i32* %119, align 4, !tbaa !2
  %121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %120)
  %122 = add nuw nsw i32 %118, 1
  %123 = load i32, i32* %7, align 4, !tbaa !2
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %117, label %125

; <label>:125:                                    ; preds = %117, %112
  %126 = call i32 @putchar(i32 10)
  %127 = add nuw nsw i32 %113, 1
  %128 = load i32, i32* %8, align 4, !tbaa !2
  %129 = icmp slt i32 %127, %128
  br i1 %129, label %112, label %130

; <label>:130:                                    ; preds = %125, %107
  %131 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.18, i32 0, i32 0))
  %132 = load i32, i32* %8, align 4, !tbaa !2
  %133 = icmp sgt i32 %132, 0
  br i1 %133, label %134, label %173

; <label>:134:                                    ; preds = %130
  br label %135

; <label>:135:                                    ; preds = %134, %148
  %136 = phi i32 [ %150, %148 ], [ 0, %134 ]
  %137 = load i32, i32* %7, align 4, !tbaa !2
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %139, label %148

; <label>:139:                                    ; preds = %135
  br label %140

; <label>:140:                                    ; preds = %139, %140
  %141 = phi i32 [ %145, %140 ], [ 0, %139 ]
  %142 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %2, i32 0, i32 %136, i32 %141
  %143 = load i32, i32* %142, align 4, !tbaa !2
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %143)
  %145 = add nuw nsw i32 %141, 1
  %146 = load i32, i32* %7, align 4, !tbaa !2
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %140, label %148

; <label>:148:                                    ; preds = %140, %135
  %149 = call i32 @putchar(i32 10)
  %150 = add nuw nsw i32 %136, 1
  %151 = load i32, i32* %8, align 4, !tbaa !2
  %152 = icmp slt i32 %150, %151
  br i1 %152, label %135, label %153

; <label>:153:                                    ; preds = %148
  %154 = icmp sgt i32 %151, 0
  br i1 %154, label %155, label %173

; <label>:155:                                    ; preds = %153
  %156 = load i32, i32* %7, align 4
  %157 = icmp sgt i32 %156, 0
  br i1 %157, label %158, label %173

; <label>:158:                                    ; preds = %155
  br label %159

; <label>:159:                                    ; preds = %158, %170
  %160 = phi i32 [ %171, %170 ], [ 0, %158 ]
  br label %161

; <label>:161:                                    ; preds = %161, %159
  %162 = phi i32 [ 0, %159 ], [ %168, %161 ]
  %163 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 %160, i32 %162
  %164 = load i32, i32* %163, align 4, !tbaa !2
  %165 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i32 0, i32 %162
  %166 = load i32, i32* %165, align 4, !tbaa !2
  %167 = add nsw i32 %166, %164
  store i32 %167, i32* %165, align 4, !tbaa !2
  %168 = add nuw nsw i32 %162, 1
  %169 = icmp eq i32 %168, %156
  br i1 %169, label %170, label %161

; <label>:170:                                    ; preds = %161
  %171 = add nuw nsw i32 %160, 1
  %172 = icmp eq i32 %171, %151
  br i1 %172, label %173, label %159

; <label>:173:                                    ; preds = %170, %130, %155, %153
  %174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0))
  %175 = load i32, i32* %7, align 4, !tbaa !2
  %176 = icmp sgt i32 %175, 0
  br i1 %176, label %177, label %199

; <label>:177:                                    ; preds = %173
  br label %178

; <label>:178:                                    ; preds = %177, %178
  %179 = phi i32 [ %183, %178 ], [ 0, %177 ]
  %180 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i32 0, i32 %179
  %181 = load i32, i32* %180, align 4, !tbaa !2
  %182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %181)
  %183 = add nuw nsw i32 %179, 1
  %184 = load i32, i32* %7, align 4, !tbaa !2
  %185 = icmp slt i32 %183, %184
  br i1 %185, label %178, label %186

; <label>:186:                                    ; preds = %178
  %187 = icmp sgt i32 %184, 0
  br i1 %187, label %188, label %199

; <label>:188:                                    ; preds = %186
  br label %189

; <label>:189:                                    ; preds = %188, %189
  %190 = phi i32 [ %197, %189 ], [ 0, %188 ]
  %191 = getelementptr inbounds [5 x i32], [5 x i32]* %5, i32 0, i32 %190
  %192 = load i32, i32* %191, align 4, !tbaa !2
  %193 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i32 0, i32 %190
  %194 = load i32, i32* %193, align 4, !tbaa !2
  %195 = sub nsw i32 %192, %194
  %196 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i32 %190
  store i32 %195, i32* %196, align 4, !tbaa !2
  %197 = add nuw nsw i32 %190, 1
  %198 = icmp eq i32 %197, %184
  br i1 %198, label %199, label %189

; <label>:199:                                    ; preds = %189, %173, %186
  %200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i32 0, i32 0))
  %201 = load i32, i32* %7, align 4, !tbaa !2
  %202 = icmp sgt i32 %201, 0
  br i1 %202, label %203, label %212

; <label>:203:                                    ; preds = %199
  br label %204

; <label>:204:                                    ; preds = %203, %204
  %205 = phi i32 [ %209, %204 ], [ 0, %203 ]
  %206 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i32 %205
  %207 = load i32, i32* %206, align 4, !tbaa !2
  %208 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %207)
  %209 = add nuw nsw i32 %205, 1
  %210 = load i32, i32* %7, align 4, !tbaa !2
  %211 = icmp slt i32 %209, %210
  br i1 %211, label %204, label %212

; <label>:212:                                    ; preds = %204, %199
  %213 = call i32 @putchar(i32 10)
  %214 = icmp eq i32 %30, 0
  br i1 %214, label %291, label %215

; <label>:215:                                    ; preds = %212
  br label %216

; <label>:216:                                    ; preds = %215, %289
  %217 = phi i32 [ %257, %289 ], [ %30, %215 ]
  %218 = load i32, i32* %8, align 4, !tbaa !2
  %219 = icmp sgt i32 %218, 0
  br i1 %219, label %220, label %273

; <label>:220:                                    ; preds = %216
  %221 = load i32, i32* %7, align 4
  %222 = icmp sgt i32 %221, 0
  br i1 %222, label %224, label %223

; <label>:223:                                    ; preds = %220
  br label %247

; <label>:224:                                    ; preds = %220
  br label %225

; <label>:225:                                    ; preds = %224, %244
  %226 = phi i32 [ %245, %244 ], [ 0, %224 ]
  %227 = getelementptr inbounds [5 x i32], [5 x i32]* %6, i32 0, i32 %226
  %228 = load i32, i32* %227, align 4, !tbaa !2
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %244, label %230

; <label>:230:                                    ; preds = %225
  br label %233

; <label>:231:                                    ; preds = %233
  %232 = icmp slt i32 %243, %221
  br i1 %232, label %233, label %252

; <label>:233:                                    ; preds = %230, %231
  %234 = phi i32 [ %243, %231 ], [ 0, %230 ]
  %235 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %2, i32 0, i32 %226, i32 %234
  %236 = load i32, i32* %235, align 4, !tbaa !2
  %237 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 %226, i32 %234
  %238 = load i32, i32* %237, align 4, !tbaa !2
  %239 = sub nsw i32 %236, %238
  %240 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i32 %234
  %241 = load i32, i32* %240, align 4, !tbaa !2
  %242 = icmp sgt i32 %239, %241
  %243 = add nuw nsw i32 %234, 1
  br i1 %242, label %244, label %231

; <label>:244:                                    ; preds = %233, %225
  %245 = add nuw nsw i32 %226, 1
  %246 = icmp slt i32 %245, %218
  br i1 %246, label %225, label %273

; <label>:247:                                    ; preds = %223, %270
  %248 = phi i32 [ %271, %270 ], [ 0, %223 ]
  %249 = getelementptr inbounds [5 x i32], [5 x i32]* %6, i32 0, i32 %248
  %250 = load i32, i32* %249, align 4, !tbaa !2
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %270, label %252

; <label>:252:                                    ; preds = %247, %231
  %253 = phi i32* [ %227, %231 ], [ %249, %247 ]
  %254 = phi i32 [ %226, %231 ], [ %248, %247 ]
  %255 = add nuw nsw i32 %254, 1
  %256 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0), i32 %255)
  store i32 0, i32* %253, align 4, !tbaa !2
  %257 = add nsw i32 %217, -1
  %258 = load i32, i32* %7, align 4, !tbaa !2
  %259 = icmp sgt i32 %258, 0
  br i1 %259, label %260, label %275

; <label>:260:                                    ; preds = %252
  br label %261

; <label>:261:                                    ; preds = %260, %261
  %262 = phi i32 [ %268, %261 ], [ 0, %260 ]
  %263 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 %254, i32 %262
  %264 = load i32, i32* %263, align 4, !tbaa !2
  %265 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i32 %262
  %266 = load i32, i32* %265, align 4, !tbaa !2
  %267 = add nsw i32 %266, %264
  store i32 %267, i32* %265, align 4, !tbaa !2
  %268 = add nuw nsw i32 %262, 1
  %269 = icmp slt i32 %268, %258
  br i1 %269, label %261, label %275

; <label>:270:                                    ; preds = %247
  %271 = add nuw nsw i32 %248, 1
  %272 = icmp slt i32 %271, %218
  br i1 %272, label %247, label %273

; <label>:273:                                    ; preds = %216, %270, %244
  %274 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0))
  br label %291

; <label>:275:                                    ; preds = %261, %252
  %276 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.16, i32 0, i32 0))
  %277 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0))
  %278 = load i32, i32* %7, align 4, !tbaa !2
  %279 = icmp sgt i32 %278, 0
  br i1 %279, label %280, label %289

; <label>:280:                                    ; preds = %275
  br label %281

; <label>:281:                                    ; preds = %280, %281
  %282 = phi i32 [ %286, %281 ], [ 0, %280 ]
  %283 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i32 %282
  %284 = load i32, i32* %283, align 4, !tbaa !2
  %285 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %284)
  %286 = add nuw nsw i32 %282, 1
  %287 = load i32, i32* %7, align 4, !tbaa !2
  %288 = icmp slt i32 %286, %287
  br i1 %288, label %281, label %289

; <label>:289:                                    ; preds = %281, %275
  %290 = icmp eq i32 %257, 0
  br i1 %290, label %291, label %216

; <label>:291:                                    ; preds = %289, %212, %273
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %14) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %13) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %12) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %11) #4
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %10) #4
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %9) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @__isoc99_scanf(i8*, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
